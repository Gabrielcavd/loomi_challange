import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class AppTextStyles {
  /// Default values
  ///
  /// fontWeight: [FontWeight.w700]
  ///
  /// color: [AppTheme.darkGreen]
  ///
  /// fontSize: 24.0
  static TextStyle headerTitleTextStyle({Color? color, double? fontSize}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize ?? 24,
      color: color ?? AppTheme.palleteWhite,
      fontFamily: "Epilogue",
    );
  }

  /// Default values
  ///
  /// fontWeight: [FontWeight.w400]
  ///
  /// color: [AppTheme.palleteGrey3]
  ///
  /// fontSize: 16.0
  static TextStyle headerSubtitleTextStyle({Color? color, double? fontSize}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      color: color ?? AppTheme.palleteWhite,
      fontSize: fontSize ?? 16,
      fontFamily: "Epilogue",
    );
  }

  /// Default values
  ///
  /// fontWeight: [FontWeight.w700]
  ///
  /// color: [AppTheme.darkGrey]
  ///
  /// fontSize: 14.0
  static TextStyle labelTextStyle({double? fontSize, Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      color: color ?? AppTheme.palleteWhite,
      fontSize: fontSize ?? 14,
      fontFamily: "Epilogue",
    );
  }

  /// Default values
  ///
  /// fontWeight: [FontWeight.w400]
  ///
  /// color: [AppTheme.darkGrey]
  ///
  /// fontSize:  14.0
  static TextStyle textStyle(
      {double? fontSize,
      double? letterSpacing,
      Color? color,
      FontWeight? fontWeight,
      TextDecoration? decoration,
      Paint? foreground,
      Color? decorationColor}) {
    Color? colorText = color ?? AppTheme.darkGrey;
    if (foreground != null) {
      colorText = null;
    }
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        color: colorText,
        height: letterSpacing,
        fontFamily: 'Epilogue',
        fontSize: fontSize ?? 14.0,
        decoration: decoration,
        decorationColor: decorationColor,
        foreground: foreground);
  }
}
