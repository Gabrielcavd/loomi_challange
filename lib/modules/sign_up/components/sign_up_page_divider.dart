import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class SignUpPageDivider extends StatelessWidget {
  const SignUpPageDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1,
          width: 110,
          color: AppTheme.palleteGrey.shade700,
        ),
        Text(
          "Or Sign up With",
          style: AppTextStyles.textStyle(
            fontSize: 12,
            color: AppTheme.darkGrey2,
          ),
        ),
        Container(
          height: 1,
          width: 110,
          color: AppTheme.palleteGrey.shade700,
        ),
      ],
    );
  }
}
