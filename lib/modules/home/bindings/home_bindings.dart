import 'package:get/get.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
