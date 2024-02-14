import 'dart:io';

import '../../../../../../../util/start_app.dart';

abstract class NewLocalStorageInterface {
  Future<File?> get(String userId, String fileName);

  Future<File> setByData(String userId, String fileName, Uint8List data);

  Future<File> setByString(String userId, String fileName, String text);
}
