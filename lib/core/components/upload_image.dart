import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';

class UploadImageComponent extends StatelessWidget {
  const UploadImageComponent(
      {super.key,
      required this.onTap,
      required this.imagePath,
      this.mainAxisAlignment});
  final void Function() onTap;
  final String? imagePath;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        imagePath != null
            ? ChangeImageComponent(
                onTap: onTap,
                imagePath: imagePath,
              )
            : InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: onTap,
                child: Container(
                  width: 116,
                  height: 116,
                  padding: const EdgeInsets.all(45),
                  decoration: BoxDecoration(
                    color: AppTheme.purplePrimary.shade900,
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: CustomIcons.camera(),
                ),
              ),
        const SizedBox(width: 15),
        SizedBox(
          width: 92,
          child: RichText(
            text: TextSpan(
              text: "CHOOSE IMAGE",
              style: AppTextStyles.textStyle(
                fontSize: 12,
                color: AppTheme.palleteWhite,
              ),
              children: [
                TextSpan(
                  text:
                      '\nA square .jpg, .gif, or .png image 200x200 or larger',
                  style: AppTextStyles.textStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                    fontSize: 10,
                    color: AppTheme.palleteWhite.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChangeImageComponent extends StatelessWidget {
  const ChangeImageComponent({super.key, required this.onTap, this.imagePath});
  final void Function() onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: imagePath!.isNotEmpty
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
                  File(imagePath!),
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
        Positioned(
          right: -10,
          bottom: -10,
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: AppTheme.palleteGrey4.shade800,
              child: CustomIcons.camera(),
            ),
          ),
        )
      ],
    );
  }
}
