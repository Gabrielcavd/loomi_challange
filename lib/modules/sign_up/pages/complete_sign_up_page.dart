// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/components/app_text_field.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/components/pick_image_bottom_modal.dart';
import 'package:loomi_challange/core/design_system/themes/app_button_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/components/upload_image.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/modules/sign_up/controller/sign_up_controller.dart';

class CompleteSignUpPage extends StatelessWidget {
  const CompleteSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller =
        getDependency.get<SignUpController>(context);
    return SafeArea(
      top: false,
      child: Form(
        key: controller.completeSignUpFormKey,
        child: PageBase(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/small_logo.png",
                  width: 32,
                ),
                const SizedBox(height: 50),
                Text("Tell us more!",
                    style: AppTextStyles.headerTitleTextStyle()),
                const SizedBox(height: 10),
                SizedBox(
                  width: 295,
                  child: Text(
                    "Complete your profile",
                    style: AppTextStyles.textStyle(
                      color: AppTheme.darkGrey2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                Obx(
                  () => UploadImageComponent(
                    imagePath: controller.userImage.firstOrNull?.path,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return PickImageBottomSheet(
                            onTapPhoto: () {
                              controller.pickImage();
                            },
                            onTapGallery: () {
                              controller.pickFile(
                                allowedExtensions: ['jpg', 'png', 'gif'],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 50),
                AppTextField(
                  controller: controller.userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  hintText: "Your name",
                ),
                const SizedBox(height: 50),
                AppButton(
                    onPressed: () {
                      controller.handleCompleteSignUp(context);
                    },
                    width: 205,
                    text: "Continue"),
                const SizedBox(height: 5),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: AppButtonStyles.outlinedButtonStyle(context, 205),
                  child: Text("Back"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
