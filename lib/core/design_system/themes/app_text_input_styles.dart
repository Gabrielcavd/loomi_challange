import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class AppTextInputStyles {
  static const _borderDefault = OutlineInputBorder(
    gapPadding: 12,
    borderSide: BorderSide(
      width: 1,
      color: AppTheme.palleteGrey2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(9),
    ),
  );

  static InputDecoration inputDecoration({
    String? hintText,
    Widget? suffixIcon,
    TextStyle? hintStyle,
    Widget? prefix,
    EdgeInsetsGeometry? contentPadding,
    BorderSide? borderSide,
  }) {
    return InputDecoration(
        fillColor: AppTheme.darkGrey,
        filled: true,
        errorStyle: AppTextStyles.textStyle(color: AppTheme.infoRed),
        errorBorder: _borderDefault.copyWith(
          borderSide: const BorderSide(
            width: 1,
            color: AppTheme.infoRed,
          ),
        ),
        focusedBorder: _borderDefault.copyWith(
          borderSide: BorderSide(
            width: 1,
            color: AppTheme.purplePrimary.shade600,
          ),
        ),
        enabledBorder: _borderDefault.copyWith(
          borderSide: borderSide,
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        border: _borderDefault,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 35,
          minWidth: 35,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: suffixIcon,
        ),
        prefix: prefix,
        contentPadding: contentPadding);
  }
}
