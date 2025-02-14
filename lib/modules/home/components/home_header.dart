import 'package:flutter/material.dart';
import 'package:loomi_challange/modules/home/components/profile_icon.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 20),
          Image.asset(
            "assets/images/small_logo.png",
            width: 32,
          ),
          ProfileIcon(controller: controller),
        ],
      ),
    );
  }
}
