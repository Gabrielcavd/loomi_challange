import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.profile);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: controller.user!.photoURL!.isNotEmpty
            ? Image.file(
                errorBuilder: (context, error, stackTrace) =>
                    const CircleAvatar(
                  radius: 20,
                  backgroundColor: AppTheme.palleteGrey,
                  child: Icon(
                    Icons.person,
                  ),
                ),
                File(controller.user!.photoURL!),
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              )
            : const CircleAvatar(
                radius: 20,
                backgroundColor: AppTheme.palleteGrey,
                child: Icon(
                  Icons.person,
                ),
              ),
      ),
    );
  }
}
