import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';

class SignUpController extends GetxController {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final completeSignUpFormKey = GlobalKey<FormState>();

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final shinePasswordInputBorder = true.obs;
  final shineConfirmPasswordInputBorder = true.obs;
  final List<File> userImage = <File>[].obs;

  void handleSignUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, "${Routes.signUp}${Routes.completeSignUp}");
    }
  }

  void handleCompleteSignUp(BuildContext context) {
    if (completeSignUpFormKey.currentState!.validate()) {
      print("Complete sign up");
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
