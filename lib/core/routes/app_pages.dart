import 'package:get/get.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/login/bindings/login_bindings.dart';
import 'package:loomi_challange/modules/login/pages/login_page.dart';
import 'package:loomi_challange/modules/sign_up/bindings/sign_up_bindings.dart';
import 'package:loomi_challange/modules/sign_up/pages/complete_sign_up_page.dart';
import 'package:loomi_challange/modules/sign_up/pages/sign_up_page.dart';

class AppPages {
  static const initial = Routes.signUp;
  static final routes = [
    GetPage(
      name: Routes.login,
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.signUp,
      binding: SignUpBindings(),
      page: () => const SignUpPage(),
      children: [
        GetPage(
          name: Routes.completeSignUp,
          page: () => const CompleteSignUpPage(),
        ),
      ],
    ),
  ];
}
