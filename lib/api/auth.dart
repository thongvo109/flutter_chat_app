import 'dart:async';
import 'dart:convert';

import 'package:chatweb/api/base.dart';
import 'package:chatweb/model/login_model.dart';
import 'package:chatweb/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthApi extends BaseApi {
  final FirebaseAuth _auth;

  AuthApi(this._auth);
  UserModel _userModel(User firebaseUser) {
    return firebaseUser != null
        ? UserModel(
            userId: firebaseUser.uid,
            email: firebaseUser.email,
            photoUrl: firebaseUser.photoURL,
            displayName: firebaseUser.displayName,
          )
        : null;
  }

  Stream<User> get authStateChanges => _auth.idTokenChanges();
  UserModel get getUser => _userModel(_auth.currentUser);
  // Future<UserModel> signInWithGoogle() async {
  //   try {
  //     final googleUser = await _googleSignIn.signIn();
  //     final googleAuth = await googleUser.authentication;
  //     final credential = GoogleAuthProvider.getCredential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     final authResult = await _auth.signInWithCredential(credential);
  //     return _userModel(authResult.user);
  //   } catch (e) {
  //     return e;
  //   }
  // }

  Future<String> signIn({String email, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'thanh cong';
    } on FirebaseAuthException catch (e) {
      print(e);
      return null;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<UserModel> signUp({String email, String password}) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userModel(user);
    } catch (e) {
      return UserModel.withError(handleError(e));
    }
  }

  Future<UserModel> signInModel({String email, String password}) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      return _userModel(user);
    } catch (e) {
      return UserModel.withError(handleError(e));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }
}
