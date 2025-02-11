import 'package:get/get.dart';
import 'package:loomi_challange/modules/profile/controllers/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(Get.find()));
  }
}
