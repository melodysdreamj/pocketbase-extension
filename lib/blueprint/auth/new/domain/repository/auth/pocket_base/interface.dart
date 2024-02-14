import 'package:pocketbase/pocketbase.dart';

import '../../../../../../../util/start_app.dart';

abstract class NewPocketBaseAuthRepoInterface {
  Future<void> logout();
  Future<bool> emailLogin(String email, String password,
      {bool? isAdmin});
  Future<String?> getMyUid();
}
