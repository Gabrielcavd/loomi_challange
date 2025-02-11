import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_challange/core/data/http/base_http_client.dart';
import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';

class LoginRepository {
  final BaseHttpClient _baseHttpClient;
  final FirebaseAuthService _firebaseAuthService;
  LoginRepository(this._baseHttpClient, this._firebaseAuthService);

  Future<UserCredential> login(String email, String password) async {
    try {
      final userLogged = await _firebaseAuthService
          .signInUserWithEmailAndPassword(email, password);
      return userLogged;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final userLogged = await _firebaseAuthService.googleSignIn();
      return userLogged;
    } catch (e) {
      rethrow;
    }
  }
}
