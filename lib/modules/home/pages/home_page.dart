import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        getDependency.get<HomeController>(context);
    return SafeArea(
      child: PageBase(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 20),
                  Image.asset(
                    "assets/images/small_logo.png",
                    width: 32,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: FileImage(
                        File(controller.user!.photoURL!),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
