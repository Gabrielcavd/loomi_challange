import 'package:get/instance_manager.dart';
import 'package:loomi_challange/modules/login/controllers/forgot_password_controller.dart';
import 'package:loomi_challange/modules/login/controllers/login_controller.dart';
import 'package:loomi_challange/modules/login/repositories/login_repository.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginRepository(Get.find(), Get.find()));
    Get.lazyPut<LoginController>(() => LoginController(Get.find()),
        fenix: true);
    Get.lazyPut<ForgotPasswordController>(
        () => ForgotPasswordController(Get.find()),
        fenix: true);
  }
}
