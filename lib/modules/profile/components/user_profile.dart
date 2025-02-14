import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/profile_image.dart';
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
        ProfileImage(
          photoURL: photoURL!,
          borderRadius: 50,
          height: 116,
          width: 116,
          iconSize: 40,
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
