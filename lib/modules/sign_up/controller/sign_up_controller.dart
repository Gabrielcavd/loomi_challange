import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loomi_challange/core/exceptions/handle_firebase_exceptions.dart';
import 'package:loomi_challange/core/general_functions/get_app_snackbar.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/sign_up/repositories/sign_up_repository.dart';

class SignUpController extends GetxController {
  SignUpController(this._signUpRepository);
  final SignUpRepository _signUpRepository;

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final completeSignUpFormKey = GlobalKey<FormState>();

  final signUpStateRequest = SignUpStateRequest.done.obs;
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final shinePasswordInputBorder = true.obs;
  final shineConfirmPasswordInputBorder = true.obs;
  final List<File> userImage = <File>[].obs;

  late UserCredential userToBeRegistered;

  void handleSignUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        signUpStateRequest.value = SignUpStateRequest.requesting;
        userToBeRegistered = await _signUpRepository.registerUser(
          emailController.text,
          confirmPasswordController.text,
        );
        signUpStateRequest.value = SignUpStateRequest.done;
        if (context.mounted) {
          Navigator.pushNamed(
              context, "${Routes.signUp}${Routes.completeSignUp}");
        }
      } catch (e) {
        signUpStateRequest.value = SignUpStateRequest.error;
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

  void handleCompleteSignUp(BuildContext context) async {
    if (completeSignUpFormKey.currentState!.validate()) {
      try {
        signUpStateRequest.value = SignUpStateRequest.requesting;
        await _signUpRepository.completeSignUp(
            userNameController.text, userImage.firstOrNull?.path);
        signUpStateRequest.value = SignUpStateRequest.done;
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      } catch (e) {
        signUpStateRequest.value = SignUpStateRequest.error;
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

  Future<void> pickFile({List<String>? allowedExtensions}) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );
      if (result == null) return;
      final PlatformFile file = result.files.first;
      File fileTemp = File(file.path!);
      userImage.insert(0, fileTemp);
    } catch (e) {
      debugPrint("Error on picking file $e");
      rethrow;
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final image = await picker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      File fileTemp = File(image.path);
      userImage.insert(0, fileTemp);
    } catch (e) {
      debugPrint("Erro on picking image $e");
      rethrow;
    }
  }
}

enum SignUpStateRequest { requesting, done, error }
