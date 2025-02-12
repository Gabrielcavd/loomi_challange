import 'package:get/get.dart';
import 'package:loomi_challange/modules/profile/controllers/change_password_controller.dart';
import 'package:loomi_challange/modules/profile/controllers/edit_profile_controller.dart';
import 'package:loomi_challange/modules/profile/controllers/profile_controller.dart';
import 'package:loomi_challange/modules/profile/repositories/profile_repository.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepository>(() => ProfileRepository(Get.find()));
    Get.lazyPut<EditProfileController>(() => EditProfileController(Get.find()),
        fenix: true);
    Get.lazyPut<ChangePasswordController>(
        () => ChangePasswordController(Get.find()),
        fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(Get.find()));
  }
}
