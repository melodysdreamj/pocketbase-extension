import 'dart:io';

import '../../../../../../../util/start_app.dart';

abstract class NewPocketBaseStorageInterface {
  Future<Uint8List?> get(String fileName);

  Future<String?> set(String fileName, Uint8List data);

  Future<bool> delete(String fileName);
}
