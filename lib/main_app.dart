import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/bindings/global_bindings.dart';
import 'package:loomi_challange/core/data/services/session_service.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/core/routes/app_pages.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(Theme.of(context).textTheme);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBindings(),
      theme: theme.darkTheme(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      onReady: () {
        final sessionState = getDependency.get<SessionService>(context);
        ever(sessionState.sessionState, (userSession) {
          if (!sessionState.isLogged) {
            navigator?.pushNamedAndRemoveUntil(
              Routes.signUp,
              ModalRoute.withName(Routes.signUp),
            );
          } else {
            // navigator?.pushNamedAndRemoveUntil(
            //   Routes.chat,
            //   ModalRoute.withName(Routes.chat),
            // );
            print("USER LOGGED");
          }
        });
      },
    );
  }
}
