import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {super.key,
      required this.photoURL,
      this.borderRadius,
      this.height,
      this.width,
      this.iconSize});
  final String photoURL;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    bool isNetworkImage = photoURL.contains("http");
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      child: photoURL.isNotEmpty
          ? isNetworkImage
              ? Image.network(
                  errorBuilder: (context, error, stackTrace) => CircleAvatar(
                    radius: borderRadius ?? 20,
                    backgroundColor: AppTheme.palleteGrey,
                    child: Icon(
                      size: iconSize,
                      Icons.person,
                    ),
                  ),
                  photoURL,
                  height: height ?? 40,
                  width: width ?? 40,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  errorBuilder: (context, error, stackTrace) => CircleAvatar(
                    radius: borderRadius ?? 20,
                    backgroundColor: AppTheme.palleteGrey,
                    child: Icon(
                      size: iconSize,
                      Icons.person,
                    ),
                  ),
                  File(photoURL),
                  height: height ?? 40,
                  width: width ?? 40,
                  fit: BoxFit.cover,
                )
          : CircleAvatar(
              radius: borderRadius ?? 20,
              backgroundColor: AppTheme.palleteGrey,
              child: Icon(
                size: iconSize,
                Icons.person,
              ),
            ),
    );
  }
}
