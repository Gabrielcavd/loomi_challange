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
  static Widget trash({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/trash.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget shield({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/shield.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget like({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/like.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget likeFill({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/like_fill.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget dislike({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/dislike.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget dislikeFill({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/dislike_fill.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget loveIt({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/love_it.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget loveItFill({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/love_it_fill.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget send({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/send.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget back_video({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/back_video.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget advance_video({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/advance_video.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget comment({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/comment.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget subtitle({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/subtitles.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));
  static Widget purprleSend({Color? color, double? width, double? height}) =>
      SvgPicture.asset("assets/icons/purple_send.svg",
          width: width, height: height, colorFilter: _getColorFilter(color));

  static ColorFilter? _getColorFilter(Color? color) =>
      color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null;
}
