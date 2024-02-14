import 'dart:io';

import '../../../../../../../util/start_app.dart';
import '../../../../domain/repository/storage/new/local_storage.dart';
import '../../../source/storage/new/local_storage/storage.dart';

class NewStorageLocalRepo extends NewLocalStorageInterface {
  @override
  Future<File?> get(String fileName) async {
    return await NewLocalStorage().get(fileName);
  }

  @override
  Future<File> setByData(String fileName, Uint8List data) async {
    return await NewLocalStorage().setByData(fileName, data);
  }

  @override
  Future<File> setByString(String fileName, String text) async {
    return await NewLocalStorage().setByString(fileName, text);
  }
}
