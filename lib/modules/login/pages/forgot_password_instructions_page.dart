import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/components/page_header.dart';

class ForgotPasswordInstructionsPage extends StatelessWidget {
  const ForgotPasswordInstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        top: false,
        child: PageBase(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  width: 205,
                  text: "Login",
                ),
              ],
            ),
          ),
          body: const SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PageHeader(
                  title: "The instructions were sent!",
                  subTitle:
                      "If this was a valid email, instructions to reset your password will be sent to you. Please check your email.",
                  limitSubTitleWidth: false,
                  limitTitleWidth: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
