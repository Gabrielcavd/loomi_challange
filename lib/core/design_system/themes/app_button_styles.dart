import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class AppButtonStyles {
  static elevatedButtonStyle(BuildContext context, double width,
      {bool transparentButton = false}) {
    return OutlinedButton.styleFrom(
      elevation: 0,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: AppTheme.lightPurple,
      backgroundColor: transparentButton
          ? AppTheme.purplePrimary.shade900.withOpacity(0.4)
          : AppTheme.purplePrimary.shade900,
      minimumSize: Size(width, 42),
      side: const BorderSide(
        color: AppTheme.lightPurple,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static outlinedButtonStyle(BuildContext context, double width,
      {Color? borderColor, double? borderRadius}) {
    return OutlinedButton.styleFrom(
      elevation: 0,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: AppTheme.lightPurple,
      backgroundColor: AppTheme.darkGreyPrimary,
      minimumSize: Size(width, 42),
      side: BorderSide(
        color: borderColor ?? Colors.transparent,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
      ),
    );
  }
}
