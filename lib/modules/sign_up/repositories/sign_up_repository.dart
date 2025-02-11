import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
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
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> completeSignUp(String userName, String? photoURL) async {
    try {
      //TODO: Implement the logic to navigate to the next screen
      await _firebaseAuthService.updateDisplayName(userName);
      if (photoURL != null) {
        await _firebaseAuthService.updatePhotoURL(photoURL);
      }
    } catch (e) {
      rethrow;
    }
  }
}
