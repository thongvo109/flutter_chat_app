import 'package:chatweb/api/auth.dart';
import 'package:chatweb/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginRepository {
  AuthApi _api = AuthApi(FirebaseAuth.instance);

  Future<UserModel> login({
    String email,
    String passWord,
  }) async {
    return _api.signInModel(
      email: email,
      password: passWord,
    );
  }

  Future<UserModel> signUp({
    String email,
    String passWord,
  }) async {
    return _api.signUp(
      email: email,
      password: passWord,
    );
  }
}
