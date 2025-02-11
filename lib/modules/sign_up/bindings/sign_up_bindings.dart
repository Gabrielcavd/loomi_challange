import 'package:get/get.dart';
import 'package:loomi_challange/modules/sign_up/controller/sign_up_controller.dart';
import 'package:loomi_challange/modules/sign_up/repositories/sign_up_repository.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpRepository>(
        () => SignUpRepository(Get.find(), Get.find()));
    Get.lazyPut<SignUpController>(() => SignUpController(Get.find()));
  }
}
