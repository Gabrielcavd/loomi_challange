import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';
import 'package:loomi_challange/core/exceptions/handle_firebase_exceptions.dart';
import 'package:loomi_challange/core/general_functions/get_app_snackbar.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordController(this.firebaseAuthService);
  final FirebaseAuthService firebaseAuthService;
  final emailController = TextEditingController();
  final formKeyForgotPassword = GlobalKey<FormState>();

  void handleForgotPassword(BuildContext context) {
    if (formKeyForgotPassword.currentState!.validate()) {
      try {
        firebaseAuthService.firebaseAuth
            .sendPasswordResetEmail(email: emailController.text);
        Navigator.pushNamed(context,
            "${Routes.login}${Routes.forgotPassword}${Routes.forgotPasswordInstructions}");
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
}
