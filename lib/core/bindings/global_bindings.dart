import 'package:get/instance_manager.dart';
import 'package:loomi_challange/core/data/http/base_http_client.dart';
import 'package:loomi_challange/core/data/http/dio_http_client.dart';
import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';
import 'package:loomi_challange/core/data/services/session_service.dart';
import 'package:loomi_challange/core/data/services/shared_preferences_service.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseAuthService>(FirebaseAuthService(), permanent: true);
    Get.put<SharedPreferencesState>(SharedPreferencesState(), permanent: true);
    Get.put<SessionService>(SessionService(Get.find()), permanent: true);
    Get.put<BaseHttpClient>(DioHttpClient(), permanent: true);
  }
}
