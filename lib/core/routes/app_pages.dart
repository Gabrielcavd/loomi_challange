import 'package:get/get.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/home/bindings/home_bindings.dart';
import 'package:loomi_challange/modules/home/pages/home_page.dart';
import 'package:loomi_challange/modules/login/bindings/login_bindings.dart';
import 'package:loomi_challange/modules/login/pages/forgot_password_instructions_page.dart';
import 'package:loomi_challange/modules/login/pages/forgot_password_page.dart';
import 'package:loomi_challange/modules/login/pages/login_page.dart';
import 'package:loomi_challange/modules/profile/bindings/profile_bindings.dart';
import 'package:loomi_challange/modules/profile/pages/edit_profile_page.dart';
import 'package:loomi_challange/modules/profile/pages/profile_page.dart';
import 'package:loomi_challange/modules/profile/pages/subscription_page.dart';
import 'package:loomi_challange/modules/sign_up/bindings/sign_up_bindings.dart';
import 'package:loomi_challange/modules/sign_up/pages/complete_sign_up_page.dart';
import 'package:loomi_challange/modules/sign_up/pages/sign_up_page.dart';
import 'package:loomi_challange/modules/splash/splash_screen.dart';

class AppPages {
  static const initial = Routes.root;
  static final routes = [
    GetPage(
      name: Routes.root,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: Routes.login,
        binding: LoginBindings(),
        page: () => const LoginPage(),
        children: [
          GetPage(
            name: Routes.forgotPassword,
            page: () => const ForgotPasswordPage(),
            children: [
              GetPage(
                name: Routes.forgotPasswordInstructions,
                page: () => const ForgotPasswordInstructionsPage(),
              ),
            ],
          ),
        ]),
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
    GetPage(
      name: Routes.home,
      binding: HomeBindings(),
      page: () => const HomePage(),
    ),
    GetPage(
        name: Routes.profile,
        binding: ProfileBindings(),
        page: () => const ProfilePage(),
        children: [
          GetPage(
            name: Routes.editProfile,
            page: () => const EditProfilePage(),
          ),
          GetPage(
            name: Routes.seeSubscription,
            page: () => const SubscriptionPage(),
          ),
        ]),
  ];
}
