import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';
import 'package:loomi_challange/core/exceptions/handle_firebase_exceptions.dart';
import 'package:loomi_challange/core/general_functions/get_app_snackbar.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';

class ProfileController extends GetxController {
  ProfileController(this._firebaseAuthService);
  final FirebaseAuthService _firebaseAuthService;
  late User? user;

  @override
  void onInit() {
    super.onInit();
    user = _firebaseAuthService.firebaseAuth.currentUser;
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _firebaseAuthService.firebaseAuth.signOut();
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
}
