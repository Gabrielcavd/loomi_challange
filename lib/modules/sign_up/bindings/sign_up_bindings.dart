import 'package:get/get.dart';
import 'package:loomi_challange/modules/sign_up/controller/sign_up_controller.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
