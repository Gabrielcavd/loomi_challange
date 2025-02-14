import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/profile_image.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        controller.goToProfile(context);
      },
      child: ProfileImage(
        photoURL: controller.user!.photoURL!,
      ),
    );
  }
}
