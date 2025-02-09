// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';

class UploadImageComponent extends StatelessWidget {
  const UploadImageComponent(
      {super.key, required this.onTap, required this.imagePath});
  final void Function() onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imagePath != null
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.file(
                      File(imagePath!),
                      width: 116,
                      height: 116,
                      fit: BoxFit.cover,
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
        SizedBox(width: 15),
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
