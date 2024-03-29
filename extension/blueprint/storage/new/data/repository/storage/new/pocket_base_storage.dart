import 'dart:io';
import 'dart:typed_data';

import '../../../../../../../util/start_app.dart';
import '../../../../domain/repository/storage/new/pocket_base_storage.dart';
import '../../../source/storage/new/pocketbase/storage.dart';

class NewStoragePocketBaseRepo extends NewPocketBaseStorageInterface {
  @override
  Future<Uint8List?> get(String fileName) async {
    return await NewPocketBaseStorage().get(fileName);
  }

  @override
  Future<String?> set(String fileName, Uint8List data) async {
    return await NewPocketBaseStorage().set(fileName, data);
  }

  @override
  Future<bool> delete(String fileName) {
    return NewPocketBaseStorage().delete(fileName);
  }
}
