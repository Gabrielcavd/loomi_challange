import 'package:get/instance_manager.dart';
import 'package:loomi_challange/modules/login/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
