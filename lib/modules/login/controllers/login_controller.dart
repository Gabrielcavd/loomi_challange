import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/exceptions/handle_firebase_exceptions.dart';
import 'package:loomi_challange/core/general_functions/get_app_snackbar.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/login/repositories/login_repository.dart';

class LoginController extends GetxController {
  LoginController(this._loginRepository);
  final LoginRepository _loginRepository;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final loginStateRequest = LoginStateRequest.done.obs;
  final obscurePassword = true.obs;
  final shinePasswordInputBorder = true.obs;

  void handleLogin(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        loginStateRequest.value = LoginStateRequest.requesting;
        final user = await _loginRepository.login(
            emailController.text, passwordController.text);
        loginStateRequest.value = LoginStateRequest.done;
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      } catch (e) {
        loginStateRequest.value = LoginStateRequest.error;
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

  void handleGoogleLogin(BuildContext context) async {
    try {
      final user = await _loginRepository.loginWithGoogle();
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

enum LoginStateRequest { requesting, done, error }
