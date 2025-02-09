import 'dart:ui';

import 'package:get/get.dart';
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
      color: color ??
          (Get.isDarkMode ? AppTheme.palleteWhite : AppTheme.darkBlack),
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
      color: color ??
          (Get.isDarkMode ? AppTheme.palleteWhite : AppTheme.palleteGrey3),
      fontSize: fontSize ?? 16,
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
      color:
          color ?? (Get.isDarkMode ? AppTheme.palleteWhite : AppTheme.darkGrey),
      fontSize: fontSize ?? 14,
    );
  }

  /// Default values
  ///
  /// fontWeight: [FontWeight.w400]
  ///
  /// color: [AppTheme.darkGrey]
  ///
  /// fontSize:  12.0
  static TextStyle textStyle(
      /* bool isDarkMode, */
      {double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      TextDecoration? decoration,
      Paint? foreground,
      Color? decorationColor}) {
    Color? colorText =
        color ?? (Get.isDarkMode ? AppTheme.palleteWhite : AppTheme.darkGrey);
    if (foreground != null) {
      colorText = null;
    }
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        color: colorText,
        fontSize: fontSize ?? 12.0,
        decoration: decoration,
        decorationColor: decorationColor,
        foreground: foreground);
  }
}
