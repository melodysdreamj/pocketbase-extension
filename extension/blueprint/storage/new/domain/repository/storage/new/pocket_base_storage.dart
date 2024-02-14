import 'dart:io';

import '../../../../../../../util/start_app.dart';

abstract class NewPocketBaseStorageInterface {
  Future<Uint8List?> get(String fileName);

  Future<String?> set(String fileName, Uint8List data);

  Future<bool> delete(String fileName);

  Future<File?> getSync(String fileName);

  Future<bool> insertSync(String fileName, Uint8List? data);

  Future<void> deleteLocal(String fileName);

  Future<void> deleteServer(String fileName);

  Future<void> deleteSync(String fileName);
}
