import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/social_button.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          onTap: () {},
          backgroundColor: AppTheme.purplePrimary.shade900,
          child: Image.asset("assets/images/google_logo.png"),
        ),
        const SizedBox(width: 13),
        SocialButton(
          onTap: () {},
          backgroundColor: AppTheme.palleteGrey,
          child: Image.asset("assets/images/apple_logo.png"),
        ),
      ],
    );
  }
}
