import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_input_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.obscureText = false,
      this.validator,
      this.controller,
      this.inputFormatters,
      this.keyboardType,
      this.hintText,
      this.style,
      this.suffixIcon,
      this.hintStyle,
      this.height,
      this.decoration,
      this.shineBorder = false,
      this.contentPadding});
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? style;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final double? height;
  final bool shineBorder;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height ?? 50),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: shineBorder
              ? [
                  BoxShadow(
                    color: AppTheme.palleteGrey.shade700,
                    blurRadius: 4,
                    offset: const Offset(0, -1),
                  ),
                ]
              : [],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          style: style ??
              AppTextStyles.textStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppTheme.palleteGrey.shade300,
              ),
          decoration: decoration ??
              AppTextInputStyles.inputDecoration(
                hintText: hintText,
                contentPadding: contentPadding,
                suffixIcon: suffixIcon,
                hintStyle: hintStyle ??
                    AppTextStyles.textStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.darkGrey2,
                    ),
              ),
        ),
      ),
    );
  }
}
