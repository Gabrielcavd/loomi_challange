// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcons {
  CustomIcons._();
  static Widget visibility_off({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/visibility_off.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget camera({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/cam.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget gallery({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/gallery.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));

  static ColorFilter? _getColorFilter(Color? color) =>
      color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null;
}
