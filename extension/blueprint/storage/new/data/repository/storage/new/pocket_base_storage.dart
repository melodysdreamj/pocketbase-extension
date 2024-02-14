import 'dart:io';

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

  @override
  Future<void> deleteLocal(String fileName) {
    return NewPocketBaseStorage().deleteLocal(fileName);
  }

  @override
  Future<void> deleteServer(String fileName) {
    return NewPocketBaseStorage().deleteServer(fileName);
  }

  @override
  Future<void> deleteSync(String fileName) {
    return NewPocketBaseStorage().deleteSync(fileName);
  }

  @override
  Future<File?> getSync(String fileName) {
    return NewPocketBaseStorage().getSync(fileName);
  }

  @override
  Future<bool> insertSync(String fileName, Uint8List? data) {
    return NewPocketBaseStorage().insertSync(fileName, data);
  }
}
