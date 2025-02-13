import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_button_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onPressed,
      required this.width,
      required this.text,
      this.isRequesting = false,
      this.transparentButton = false});
  final void Function() onPressed;
  final double width;
  final String text;
  final bool isRequesting;
  final bool transparentButton;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: transparentButton
            ? []
            : [
                BoxShadow(
                  color: AppTheme.palleteGrey.shade700,
                  blurRadius: 7,
                  offset: const Offset(0, 0),
                ),
              ],
      ),
      child: ElevatedButton(
        onPressed: isRequesting ? null : onPressed,
        style: AppButtonStyles.elevatedButtonStyle(context, width,
            transparentButton: transparentButton),
        child: isRequesting
            ? const CircularProgressIndicator(color: AppTheme.lightPurple)
            : Text(
                text,
                style: AppTextStyles.textStyle(
                    color: AppTheme.lightPurple, fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
