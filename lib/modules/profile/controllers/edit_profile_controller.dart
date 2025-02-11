import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loomi_challange/core/exceptions/handle_firebase_exceptions.dart';
import 'package:loomi_challange/core/general_functions/get_app_snackbar.dart';
import 'package:loomi_challange/modules/profile/repositories/profile_repository.dart';

class EditProfileController extends GetxController {
  EditProfileController(this._profileRepository);
  final ProfileRepository _profileRepository;
  late User? user;

  final userNameController = TextEditingController();
  final List<File> userImage = <File>[].obs;
  final state = EditProfileState.success.obs;

  @override
  void onInit() {
    super.onInit();
    user = _profileRepository.firebaseAuthService.firebaseAuth.currentUser;
  }

  Future<void> editProfile(BuildContext context) async {
    if (userNameController.text.isNotEmpty || userImage.isNotEmpty) {
      try {
        state.value = EditProfileState.loading;
        await _profileRepository.editProfile(
            userNameController.text, userImage.firstOrNull?.path);
        state.value = EditProfileState.success;
        if (context.mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        state.value = EditProfileState.error;
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

enum EditProfileState { loading, success, error }
