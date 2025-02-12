// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/components/app_text_field.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/modules/profile/controllers/change_password_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController controller =
        getDependency.get<ChangePasswordController>(context);
    return SafeArea(
      child: Form(
        key: controller.formKey,
        child: PageBase(
          enableAppBar: true,
          bottomNavigationBar: Obx(
            () => AppButton(
              isRequesting:
                  controller.state.value == ChangePasswordState.loading,
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  await controller.changePassword(context);
                }
              },
              width: 205,
              text: "Update Password",
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 130,
                  child: Text("Change Password",
                      style: AppTextStyles.headerTitleTextStyle(
                          fontSize: 26, color: AppTheme.palleteWhite)),
                ),
                const SizedBox(height: 60),
                Obx(
                  () => AppTextField(
                    controller: controller.currentPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.shineCurrentPasswordBorder.value = false;
                        return "This field is required";
                      }
                      controller.shineCurrentPasswordBorder.value = true;
                      return null;
                    },
                    shineBorder: controller.shineCurrentPasswordBorder.value,
                    obscureText: controller.obscureCurrentPassword.value,
                    hintText: "Current password",
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.obscureCurrentPassword.toggle();
                      },
                      child: controller.obscureCurrentPassword.value
                          ? CustomIcons.visibility_off()
                          : const Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Divider(
                  color: AppTheme.palleteGrey.shade700,
                  thickness: 0.5,
                ),
                SizedBox(height: 35),
                Obx(
                  () => AppTextField(
                    controller: controller.newPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.shineNewPasswordBorder.value = false;
                        return "This field is required";
                      }
                      if (controller.newPassword.text ==
                          controller.currentPassword.text) {
                        controller.shineNewPasswordBorder.value = false;
                        return "New password must be different from the current";
                      }
                      controller.shineNewPasswordBorder.value = true;
                      return null;
                    },
                    shineBorder: controller.shineNewPasswordBorder.value,
                    obscureText: controller.obscureNewPassword.value,
                    hintText: "New password",
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.obscureNewPassword.toggle();
                      },
                      child: controller.obscureNewPassword.value
                          ? CustomIcons.visibility_off()
                          : const Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => AppTextField(
                    controller: controller.confirmPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.shineConfirmPasswordBorder.value = false;
                        return "This field is required";
                      }
                      if (controller.newPassword.text !=
                          controller.confirmPassword.text) {
                        controller.shineConfirmPasswordBorder.value = false;
                        return "Passwords do not match";
                      }
                      controller.shineConfirmPasswordBorder.value = true;
                      return null;
                    },
                    shineBorder: controller.shineConfirmPasswordBorder.value,
                    obscureText: controller.obscureConfirmPassword.value,
                    hintText: "Confirm password",
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.obscureConfirmPassword.toggle();
                      },
                      child: controller.obscureConfirmPassword.value
                          ? CustomIcons.visibility_off()
                          : const Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
