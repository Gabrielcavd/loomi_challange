import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final obscurePassword = true.obs;
  final shinePasswordInputBorder = true.obs;

  void handleLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      print("Login");
    }
  }
}
