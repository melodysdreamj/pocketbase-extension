import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';

import '../../../../../../../../util/start_app.dart';
import 'config.dart';

class NewLocalStorage {
  Future<File?> get(String userId, String fileName) async {
    await _ready();
    File file = File(await _getPath(userId, fileName));
    if (file.existsSync()) {
      return file;
    } else {
      return null;
    }
  }

  Future<File> setByData(String userId, String fileName, Uint8List data) async {
    await _ready();
    return await File(await _getPath(userId, fileName)).writeAsBytes(data);
  }

  Future<File> setByString(String userId, String fileName, String text) async {
    await _ready();
    return await File(await _getPath(userId, fileName)).writeAsString(text);
  }

  Future<void> delete(String userId, String fileName) async {
    await _ready();
    File file = File(await _getPath(userId, fileName));
    if (file.existsSync()) {
      await file.delete();
    }
  }

  Future<String> _getPath(String userId, String fileName) async {
    String path =
        join(await NewLocalStorageConfig.localPath(), userId, fileName);

    await Directory(dirname(path)).create(recursive: true);

    return path;
  }

  /// 준비중
  ///////////////////////////////////////
  _ready() async {
    if (!isOpened) {
      await _open();
      isOpened = true;
    }
  }

  _open() async {
    // final path = join(databasePath, dbName);
    await Directory(dirname(await NewLocalStorageConfig.localPath()))
        .create(recursive: true);
  }

  static bool isOpened = false;
}
