import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthService extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDisplayName(String displayName) async {
    try {
      await _firebaseAuth.currentUser!.updateDisplayName(displayName.trim());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePhotoURL(String photoURL) async {
    try {
      await _firebaseAuth.currentUser!.updatePhotoURL(photoURL);
    } catch (e) {
      rethrow;
    }
  }
}
