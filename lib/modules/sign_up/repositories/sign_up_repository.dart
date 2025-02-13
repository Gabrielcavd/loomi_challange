import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_challange/core/data/http/api.dart';
import 'package:loomi_challange/core/data/http/base_http_client.dart';
import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';

class SignUpRepository {
  final BaseHttpClient _baseHttpClient;
  final FirebaseAuthService _firebaseAuthService;
  SignUpRepository(this._baseHttpClient, this._firebaseAuthService);

  Future<UserCredential> registerUser(String email, String password) async {
    try {
      UserCredential user = await _firebaseAuthService
          .registerUserWithEmailAndPassword(email, password);
      // String? token = await user.user!.getIdToken();
      String? uid = user.user!.uid;
      final body = {
        "email": email,
        "password": password,
        "firebase_UID": uid,
        "username": "user",
      };
      _baseHttpClient.post(Api.registerUser, body);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> completeSignUp(String userName, String? photoURL) async {
    try {
      await _firebaseAuthService.updateDisplayName(userName);
      if (photoURL != null) {
        await _firebaseAuthService.updatePhotoURL(photoURL);
      }
    } catch (e) {
      rethrow;
    }
  }
}
