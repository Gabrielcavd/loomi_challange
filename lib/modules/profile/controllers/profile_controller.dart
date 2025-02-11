import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/exceptions/handle_firebase_exceptions.dart';
import 'package:loomi_challange/core/general_functions/get_app_snackbar.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/profile/repositories/profile_repository.dart';

class ProfileController extends GetxController {
  ProfileController(this._profileRepository);
  final ProfileRepository _profileRepository;
  late User? user;

  final state = ProfileState.success.obs;

  @override
  void onInit() {
    super.onInit();
    user = _profileRepository.firebaseAuthService.firebaseAuth.currentUser;
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _profileRepository.signOut();
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.login, (route) => false);
      }
    } catch (e) {
      String error = "";
      if (e is FirebaseAuthException) {
        error = e.code;
      }
      if (context.mounted) {
        getAppSnackBar(handleFirebaseExceptions(error), context);
      }
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    try {
      state.value = ProfileState.loading;
      await _profileRepository.deleteAccount();
      state.value = ProfileState.success;
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.login, (route) => false);
      }
    } catch (e) {
      state.value = ProfileState.error;
      String error = "";
      if (e is FirebaseAuthException) {
        error = e.code;
      }
      if (context.mounted) {
        getAppSnackBar(handleFirebaseExceptions(error), context);
      }
    }
  }
}

enum ProfileState { loading, success, error }
