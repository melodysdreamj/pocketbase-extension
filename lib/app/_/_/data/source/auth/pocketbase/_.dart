import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pocketbase/pocketbase.dart';

import 'config.dart';

class PocketBaseAuth {
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  Future<void> logout() async {
    final store = AsyncAuthStore(
      save: (String data) async =>
          await _flutterSecureStorage.write(key: 'pb_auth', value: data),
      initial: await _flutterSecureStorage.read(key: 'pb_auth'),
    );
    store.clear();
  }

  Future<AsyncAuthStore?> getAuth() async {
    final store = AsyncAuthStore(
      save: (String data) async =>
          await _flutterSecureStorage.write(key: 'pb_auth', value: data),
      initial: await _flutterSecureStorage.read(key: 'pb_auth'),
    );

    if (store.isValid) {
      return store;
    } else {
      return null;
    }
  }

  Future<String?> getMyUid() async {
    final store = AsyncAuthStore(
      save: (String data) async =>
          await _flutterSecureStorage.write(key: 'pb_auth', value: data),
      initial: await _flutterSecureStorage.read(key: 'pb_auth'),
    );

    if (store.isValid) {
      return store.model?.id;
    } else {
      return null;
    }
  }

  Future<bool> emailLogin(String email, String password,
      {bool? isAdmin}) async {
    final pb = PocketBase(PocketBaseAuthConfig.serverUrl);

    if (isAdmin == true) {
      await pb.admins.authWithPassword(email, password);
    } else {
      await pb.collection('users').authWithPassword(email, password);
    }

    final store = AsyncAuthStore(
      save: (String data) async =>
          await _flutterSecureStorage.write(key: 'pb_auth', value: data),
      initial: await _flutterSecureStorage.read(key: 'pb_auth'),
    );
    store.save(pb.authStore.token, pb.authStore.model);

    if (store.isValid) {
      return true;
    } else {
      return false;
    }
  }
}
