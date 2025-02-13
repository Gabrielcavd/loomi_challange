import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class InternetService extends GetxController {
  static Connectivity connectivity = Connectivity();
  static late List<ConnectivityResult> connectivityStatus;
  bool get internetOff => connectivityStatus.first == ConnectivityResult.none;

  @override
  void onInit() async {
    super.onInit();
    connectivity.onConnectivityChanged.listen(_updateConnectivityStatus);
    connectivityStatus = await connectivity.checkConnectivity();
  }

  void _updateConnectivityStatus(List<ConnectivityResult> connectivityResult) {
    debugPrint(connectivityResult.toString());
    connectivityStatus = connectivityResult;
    if (connectivityResult[0] == ConnectivityResult.none) {
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        borderRadius: 16,
        messageText: const Row(
          children: [
            Text(
              "No connection",
              style: TextStyle(
                color: AppTheme.palleteWhite,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Try again",
              style: TextStyle(
                color: AppTheme.lightPurple,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        icon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/images/small_logo.png",
            width: 18,
          ),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        overlayColor: AppTheme.palleteWhite,
        maxWidth: 250,
        backgroundColor: AppTheme.darkGreyPrimary,
        duration: const Duration(seconds: 10000),
      );
    } else {
      if (Get.isDialogOpen!) {
        Get.back();
      }
    }
  }
}
