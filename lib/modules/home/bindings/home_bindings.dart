import 'package:get/get.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';
import 'package:loomi_challange/modules/home/repositories/home_repository.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepository(Get.find(), Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
