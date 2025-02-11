import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> googleSignIn() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final user = await firebaseAuth.signInWithCredential(credential);
      print(firebaseAuth.currentUser!.email);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDisplayName(String displayName) async {
    try {
      await firebaseAuth.currentUser!.updateDisplayName(displayName.trim());
      await firebaseAuth.currentUser!.reload();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePhotoURL(String photoURL) async {
    try {
      await firebaseAuth.currentUser!.updatePhotoURL(photoURL);
      await firebaseAuth.currentUser!.reload();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAccount() async {
    try {
      await firebaseAuth.currentUser!.delete();
    } catch (e) {
      rethrow;
    }
  }
}
