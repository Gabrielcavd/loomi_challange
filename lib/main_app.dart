import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:loomi_challange/core/bindings/global_bindings.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(Theme.of(context).textTheme);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBindings(),
      theme: theme.lightTheme(),
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
