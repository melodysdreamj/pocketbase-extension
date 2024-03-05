import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:pocketbase/pocketbase.dart';

import '../../../../../../../../app/_/_/data/source/auth/pocketbase/_.dart';

import '../local_storage/storage.dart';
import 'config.dart';

import 'package:http/http.dart' as http;

class NewPocketBaseStorage {
  Future<Uint8List?> get(String fileName, {bool? needToken}) async {
    try {
      await _ready();
      final response = await http
          .get(Uri.parse(await url(fileName, needToken: needToken) ?? ""));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        print('Failed to download image: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred while downloading image: $e');
      return null;
    }
  }

  Future<String?> url(String fileName, {bool? needToken}) async {
    // PocketBase mixes random characters into the file name upon upload,
    // so additional work is needed to determine the server-side file name.

    try {
      await _ready();
      var record = await pb.collection('New').getFirstListItem(
          pb.filter("FileName = {:fileName}", {"fileName": fileName}));

      if (needToken != null && needToken == true) {
        final fileToken = await pb.files.getToken();
        return pb.files
            .getUrl(record, record.getDataValue<String>("File"),
                token: fileToken)
            .toString();
      } else {
        return pb.files
            .getUrl(record, record.getDataValue<String>("File"))
            .toString();
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> set(String fileName, Uint8List data) async {
    try {
      await _ready();


      String? deleteFileId = await _deleteOnlyFileForReplace(fileName);
      if (deleteFileId != null) {
        var record = await pb.collection('New').update(deleteFileId, files: [
          http.MultipartFile.fromBytes(
              'File', // the name of the file field
              data,
              filename: fileName),
        ]);

        return pb.files
            .getUrl(record, record.getDataValue<String>("File"))
            .toString();
      } else {
        var record = await pb.collection('New').create(
          body: {
            'FileName': fileName,
          },
          files: [
            // http.MultipartFile.fromString(
            //   'image', // the name of the file field
            //   'example content...',
            //   filename: 'example_document.txt',
            // ),
            http.MultipartFile.fromBytes(
                'File', // the name of the file field
                data,
                filename: fileName),
            // await http.MultipartFile.fromPath('image', filePath!),
            // http.MultipartFile.fromString(
            //   'image2', // the name of the file field
            //   'example content...',
            //   filename: 'example_document.txt',
            // ),
          ],
        );

        return pb.files
            .getUrl(record, record.getDataValue<String>("File"))
            .toString();
      }
    } on Exception catch (e) {
      // e.printError();
      return null;
    }
  }

  Future<bool> delete(String fileName) async {
    try {
      await _ready();
      await pb.collection('New').update(await _getId(fileName) ?? '', body: {
        'File': null,
      });
      await pb.collection('New').delete(await _getId(fileName) ?? '');
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> _deleteOnlyFileForReplace(String fileName) async {
    try {
      await _ready();
      String? id = await _getId(fileName);
      if (id == null) return null;
      await _ready();
      await pb.collection('New').update(id, body: {
        'File': null,
      });
      return id;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> _getId(String fileName, {bool? needToken}) async {
    try {
      await _ready();
      var record = await pb.collection('New').getFirstListItem(
          pb.filter("FileName = {:fileName}", {"fileName": fileName}));
      return record.id;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<File?> getSync(String fileName) async {
    // 1. 로컬에 파일이 있는지 확인하기 ( 있다면 리턴)
    File? localFile = await NewLocalStorage().get(fileName);
    if (localFile != null) {
      return localFile;
    }

    Uint8List? serverFileData = await get(fileName);

    if (serverFileData != null) {
      await NewLocalStorage().setByData(fileName, serverFileData);
      return NewLocalStorage().get(fileName);
    }

    return null;
  }

  Future<bool> insertSync(String fileName, Uint8List? data) async {
    if (data == null) return false;

    File? localFile = await NewLocalStorage().get(fileName);
    if (localFile == null) {
      await NewLocalStorage().setByData(fileName, data);
    }

    Uint8List? serverFileData = await get(fileName);
    if (serverFileData == null) {
      await set(fileName, data);
    }

    return true;
  }

  Future<bool> upsertSync(String fileName, Uint8List? data) async {
    if (data == null) return false;

    await NewLocalStorage().setByData(fileName, data);
    // File? localFile = await localStorage.get(fileName);
    // if (localFile == null) {
    //   await localStorage.setByData(fileName, data);
    // }else{
    //   if(localFile.lengthSync() != data.lengthInBytes){
    //     log("localFile.lengthSync():${localFile.lengthSync()}");
    //     log("data.lengthInBytes:${data.lengthInBytes}");
    //     await localStorage.setByData(fileName, data);
    //   }else{
    //     // 파일크기가 같은 경우는 하지 말아주자.
    //   }
    // }

    await set(fileName, data);

    // Uint8List? serverFileData = await get(fileName);
    // if (serverFileData == null) {
    //   await set(fileName, data);
    // }else{
    //   if(serverFileData.lengthInBytes != data.lengthInBytes){
    //     log("serverFileData.lengthInBytes:${serverFileData.lengthInBytes}");
    //     log("data.lengthInBytes:${data.lengthInBytes}");
    //     await set(fileName, data);
    //   }else{
    //     // 파일크기가 같은 경우는 하지 말아주자.
    //   }
    // }

    return true;
  }

  Future<void> deleteLocal(String fileName) async {
    await NewLocalStorage().delete(fileName);
  }

  Future<void> deleteServer(String fileName) async {
    await delete(fileName);
  }

  Future<void> deleteSync(String fileName) async {
    await deleteLocal(fileName);
    await deleteServer(fileName);
  }

  late PocketBase pb;

  _ready() async {
    if (_isReady) return;
    _isReady = true;
    final authData = await PocketBaseAuth().getAuth();
    if (authData != null) {
      pb =
          PocketBase(NewPocketBaseStorageConfig.serverUrl, authStore: authData);
    } else {
      pb = PocketBase(NewPocketBaseStorageConfig.serverUrl);
    }
  }

  bool _isReady = false;
}
