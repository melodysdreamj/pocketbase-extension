import '../../../../../../../util/start_app.dart';
import '../../../../domain/repository/auth/pocket_base/interface.dart';
import '../../../source/auth/pocketbase/_.dart';

class PocketBaseAuthRepo extends PocketBaseAuthRepoInterface {
  @override
  Future<bool> emailLogin(String email, String password,
      {bool? isAdmin}) async {
    return await PocketBaseAuth().emailLogin(email, password, isAdmin: isAdmin);
  }

  @override
  Future<void> logout() async {
    await PocketBaseAuth().logout();
  }

  @override
  Future<String?> getMyUid() {
    return PocketBaseAuth().getMyUid();
  }
}
