// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/widgets.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/modules/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller =
        getDependency.get<LoginController>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: PageBase(),
    );
  }
}
