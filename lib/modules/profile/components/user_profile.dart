import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, this.photoURL, this.displayName});
  final String? photoURL;
  final String? displayName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppTheme.palleteGrey,
          backgroundImage: photoURL != null
              ? FileImage(
                  File(photoURL!),
                )
              : null,
          child: photoURL == null
              ? const Icon(
                  Icons.person,
                  size: 50,
                )
              : null,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, ",
              style: AppTextStyles.textStyle(color: AppTheme.palleteWhite),
            ),
            Text(
              displayName!.isEmpty ? "User" : displayName!,
              style: AppTextStyles.headerTitleTextStyle(fontSize: 26),
            ),
          ],
        )
      ],
    );
  }
}
