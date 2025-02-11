import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/action_buttons.dart';
import 'package:loomi_challange/core/components/app_text_field.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/components/page_header.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/core/validations/email_validation.dart';
import 'package:loomi_challange/modules/login/controllers/forgot_password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
        getDependency.get<ForgotPasswordController>(context);
    return SafeArea(
      top: false,
      child: Form(
        key: controller.formKeyForgotPassword,
        child: PageBase(
          bottomNavigationBar: ActionButtons(
              onTapTopButton: () {
                controller.handleForgotPassword(context);
              },
              topButtonText: "Send reset instructions"),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PageHeader(
                  title: "Forgot Password?",
                  subTitle:
                      "Enter the email address you used when you joined and we'll send you instructions to reset your password.",
                  limitSubTitleWidth: false,
                ),
                AppTextField(
                  validator: (value) => validateEmail(value, "Invalid email"),
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
