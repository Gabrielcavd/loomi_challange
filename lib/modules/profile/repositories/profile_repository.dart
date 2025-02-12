import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';

class ProfileRepository {
  ProfileRepository(this.firebaseAuthService);
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  Future<void> signOut() async {
    try {
      await firebaseAuthService.firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editProfile(String? userName, String? photoURL) async {
    try {
      if (userName != null && userName.isNotEmpty) {
        await firebaseAuthService.updateDisplayName(userName);
      }
      if (photoURL != null && photoURL.isNotEmpty) {
        await firebaseAuthService.updatePhotoURL(photoURL);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    try {
      await firebaseAuthService.changePassword(currentPassword, newPassword);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAccount() async {
    try {
      await firebaseAuthService.deleteAccount();
    } catch (e) {
      rethrow;
    }
  }
}
