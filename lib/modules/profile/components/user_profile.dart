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
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: photoURL!.isNotEmpty
              ? Image.file(
                  errorBuilder: (context, error, stackTrace) =>
                      const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.palleteGrey,
                    child: Icon(
                      Icons.person,
                      size: 58,
                    ),
                  ),
                  File(photoURL!),
                  width: 116,
                  height: 116,
                  fit: BoxFit.cover,
                )
              : const CircleAvatar(
                  radius: 50,
                  backgroundColor: AppTheme.palleteGrey,
                  child: Icon(
                    Icons.person,
                    size: 58,
                  ),
                ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, ",
              style: AppTextStyles.textStyle(color: AppTheme.palleteWhite),
            ),
            SizedBox(
              width: 230,
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                displayName!.isEmpty ? "User" : displayName!,
                style: AppTextStyles.headerTitleTextStyle(fontSize: 26),
              ),
            ),
          ],
        )
      ],
    );
  }
}
