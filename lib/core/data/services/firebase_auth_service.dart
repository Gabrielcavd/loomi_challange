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
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getAuthToken() async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        return await user.getIdToken();
      }
      return null; // Usuário não autenticado
    } catch (e) {
      throw Exception('Erro ao obter token: $e');
    }
  }

  Future<String?> getFirebaseUID() async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        return user.uid;
      }
      return null;
    } catch (e) {
      throw Exception('Erro ao obter UID: $e');
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

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    try {
      final user = firebaseAuth.currentUser;
      final credential = EmailAuthProvider.credential(
          email: user!.email!, password: currentPassword.trim());
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword.trim());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email.trim());
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
