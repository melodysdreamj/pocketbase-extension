import 'dart:io';

import '../../../../../../../util/start_app.dart';

abstract class NewPocketBaseStorageInterface {
  Future<Uint8List?> get(String userId, String fileName);

  Future<String?> set(String userId, String fileName, Uint8List data);

  Future<bool> delete(String userId, String fileName);

  Future<File?> getSync(String userId, String fileName);

  Future<bool> insertSync(String userId, String fileName, Uint8List? data);

  Future<void> deleteLocal(String userId, String fileName);

  Future<void> deleteServer(String userId, String fileName);

  Future<void> deleteSync(String userId, String fileName);
}
