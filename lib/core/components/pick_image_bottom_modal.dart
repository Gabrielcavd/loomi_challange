// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet(
      {super.key, required this.onTapPhoto, required this.onTapGallery});
  final void Function() onTapPhoto;
  final void Function() onTapGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 255,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.lightPurple,
                ),
              ),
              Text(
                "CHOOSE IMAGE",
                style: TextStyle(
                  color: AppTheme.palleteWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PickOption(
                onTap: onTapPhoto,
                backgroundColor: AppTheme.purplePrimary.shade900,
                borderColor: AppTheme.lightPurple,
                title: "Take a photo",
                icon: CustomIcons.camera(),
              ),
              PickOption(
                onTap: onTapGallery,
                backgroundColor: AppTheme.darkBlack.shade200,
                borderColor: AppTheme.palleteGrey2,
                title: "Choose from gallery",
                titleWidth: 95,
                icon: Icon(
                  Icons.photo_rounded,
                  color: AppTheme.palleteGrey2,
                  size: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PickOption extends StatelessWidget {
  const PickOption(
      {super.key,
      required this.backgroundColor,
      required this.borderColor,
      required this.title,
      required this.icon,
      this.titleWidth = 45,
      required this.onTap});
  final Color backgroundColor;
  final Color borderColor;
  final String title;
  final double titleWidth;
  final Widget icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor),
        ),
        width: 135,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 10),
            SizedBox(
              width: titleWidth,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle(color: AppTheme.darkGrey2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
