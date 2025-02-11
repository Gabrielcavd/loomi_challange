import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

getAppSnackBar(String massage, BuildContext context,
    {int? duration, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        massage,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      duration: Duration(seconds: duration ?? 5),
      backgroundColor: color ?? AppTheme.infoRed,
    ),
  );
}
