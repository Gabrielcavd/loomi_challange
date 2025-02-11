import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/components/app_text_field.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/components/social_login_buttons.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/core/validations/email_validation.dart';
import 'package:loomi_challange/modules/sign_up/components/sign_up_page_divider.dart';
import 'package:loomi_challange/modules/sign_up/controller/sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller =
        getDependency.get<SignUpController>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Form(
        key: controller.formKey,
        child: PageBase(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/login_logo.png",
                  width: size.width * .35,
                ),
                const SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: AppTextStyles.textStyle(
                      fontSize: 14,
                      color: AppTheme.darkGrey2,
                    ),
                    children: [
                      TextSpan(
                        text: ' Sign in!',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                                context, Routes.login);
                          },
                        style: AppTextStyles.textStyle(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.lightPurple,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Text("Create an account",
                    style: AppTextStyles.headerTitleTextStyle()),
                const SizedBox(height: 15),
                SizedBox(
                  width: 308,
                  child: Text(
                    "To get started, please complete your account registration.",
                    style: AppTextStyles.textStyle(
                      color: AppTheme.darkGrey2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                SocialLoginButtons(
                  onTapGoogle: () {},
                  onTapApple: () {},
                ),
                const SizedBox(height: 40),
                const SignUpPageDivider(),
                const SizedBox(height: 40),
                AppTextField(
                  validator: (value) => validateEmail(value, "Invalid email"),
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  obscureText: false,
                  hintText: "Email",
                ),
                const SizedBox(height: 20),
                Obx(
                  () => AppTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.shinePasswordInputBorder.value = false;
                        return "This field is required";
                      }
                      controller.shinePasswordInputBorder.value = true;
                      return null;
                    },
                    controller: controller.passwordController,
                    obscureText: controller.obscurePassword.value,
                    shineBorder: controller.shinePasswordInputBorder.value,
                    hintText: "Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.obscurePassword.toggle();
                      },
                      child: controller.obscurePassword.value
                          ? CustomIcons.visibility_off()
                          : const Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => AppTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.shineConfirmPasswordInputBorder.value =
                            false;
                        return "This field is required";
                      }
                      if (value != controller.passwordController.text) {
                        controller.shineConfirmPasswordInputBorder.value =
                            false;
                        return "Passwords do not match";
                      }
                      controller.shineConfirmPasswordInputBorder.value = true;
                      return null;
                    },
                    controller: controller.confirmPasswordController,
                    obscureText: controller.obscureConfirmPassword.value,
                    shineBorder:
                        controller.shineConfirmPasswordInputBorder.value,
                    hintText: "Confirm yout Password",
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
                const SizedBox(height: 20),
                Obx(
                  () => AppButton(
                    isRequesting: controller.signUpStateRequest.value ==
                        SignUpStateRequest.requesting,
                    onPressed: () {
                      controller.handleSignUp(context);
                    },
                    width: 205,
                    text: "Create Account",
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
