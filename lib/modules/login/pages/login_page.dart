// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/components/app_text_field.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/components/page_header.dart';
import 'package:loomi_challange/core/components/social_login_buttons.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/core/validations/email_validation.dart';
import 'package:loomi_challange/modules/login/controllers/login_controller.dart';
import 'package:loomi_challange/modules/sign_up/components/sign_up_page_divider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller =
        getDependency.get<LoginController>(context);
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
                PageHeader(
                    title: "Welcome Back", subTitle: "Look who is here!"),
                AppTextField(
                  validator: (value) => validateEmail(value, "Invalid email"),
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 20),
                Obx(
                  () => AppTextField(
                    controller: controller.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.shinePasswordInputBorder.value = false;
                        return "This field is required";
                      }
                      controller.shinePasswordInputBorder.value = true;
                      return null;
                    },
                    shineBorder: controller.shinePasswordInputBorder.value,
                    obscureText: controller.obscurePassword.value,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushNamed(
                          context, "${Routes.login}${Routes.forgotPassword}");
                    },
                    child: Text(
                      "Forgot password?",
                      style: AppTextStyles.textStyle(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.lightPurple),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                AppButton(
                    onPressed: () {
                      controller.handleLogin(context);
                    },
                    width: 205,
                    text: "Login"),
                const SizedBox(height: 50),
                SignUpPageDivider(),
                const SizedBox(height: 20),
                SocialLoginButtons(),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account?",
                    style: AppTextStyles.textStyle(
                      fontSize: 14,
                      color: AppTheme.darkGrey2,
                    ),
                    children: [
                      TextSpan(
                        text: ' Sign up!',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                                context, Routes.signUp);
                          },
                        style: AppTextStyles.textStyle(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.lightPurple,
                        ),
                      ),
                    ],
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
