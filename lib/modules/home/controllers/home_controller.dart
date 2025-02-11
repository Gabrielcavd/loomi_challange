import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/data/services/firebase_auth_service.dart';

class HomeController extends GetxController {
  HomeController(this._firebaseAuthService);
  final FirebaseAuthService _firebaseAuthService;
  late User? user;

  @override
  void onInit() {
    super.onInit();
    user = _firebaseAuthService.firebaseAuth.currentUser;
  }
}
