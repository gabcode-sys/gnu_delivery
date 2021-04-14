import 'package:gnu_delivery/app/modules/login/infra/models/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> loginPhone({String phone});
  Future<UserModel> loginEmail({String email, String password});
  Future<UserModel> validateCode({String verificationId, String code});

  Future<UserModel> currentUser();

  Future<void> logout();
}
