import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKeyForgotPassword = GlobalKey<FormState>();

  void handleForgotPassword(BuildContext context) {
    if (formKeyForgotPassword.currentState!.validate()) {
      Navigator.pushNamed(context,
          "${Routes.login}${Routes.forgotPassword}${Routes.forgotPasswordInstructions}");
    }
  }
}
