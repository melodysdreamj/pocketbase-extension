import 'dart:io';
import 'dart:typed_data';

import '../../../../../../../util/start_app.dart';
import '../../../../domain/repository/storage/new/pocket_base_storage.dart';
import '../../../source/storage/new/pocketbase/storage.dart';

class NewStoragePocketBaseRepo extends NewPocketBaseStorageInterface {
  @override
  Future<Uint8List?> get(String userId, String fileName) async {
    return await NewPocketBaseStorage().get(userId, fileName);
  }

  @override
  Future<String?> set(String userId, String fileName, Uint8List data) async {
    return await NewPocketBaseStorage().set(userId, fileName, data);
  }

  @override
  Future<bool> delete(String userId, String fileName) {
    return NewPocketBaseStorage().delete(userId, fileName);
  }
}
