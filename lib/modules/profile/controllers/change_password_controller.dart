import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/exceptions/handle_firebase_exceptions.dart';
import 'package:loomi_challange/core/general_functions/get_app_snackbar.dart';
import 'package:loomi_challange/modules/profile/repositories/profile_repository.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordController(this._profileRepository);
  final ProfileRepository _profileRepository;

  final formKey = GlobalKey<FormState>();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  final state = ChangePasswordState.success.obs;
  final obscureCurrentPassword = true.obs;
  final obscureNewPassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final shineCurrentPasswordBorder = true.obs;
  final shineNewPasswordBorder = true.obs;
  final shineConfirmPasswordBorder = true.obs;

  Future<void> changePassword(BuildContext context) async {
    try {
      state.value = ChangePasswordState.loading;
      await _profileRepository.changePassword(
          currentPassword.text, confirmPassword.text);
      state.value = ChangePasswordState.success;
      if (context.mounted) {
        Navigator.pop(context);
        getAppSnackBar("Password changed successfully", context,
            color: AppTheme.purplePrimary.shade900);
      }
    } catch (e) {
      state.value = ChangePasswordState.error;
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

enum ChangePasswordState { loading, success, error }
