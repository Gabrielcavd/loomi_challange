import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/data/domain/entities/session_user.dart';
import 'package:loomi_challange/core/data/services/shared_preferences_service.dart';

class SessionService extends GetxController {
  final _sessionUser = SessionUser.empty().obs;
  SessionUser get sessionUser => _sessionUser.value;
  Rx<SessionUser> get sessionState => _sessionUser;
  final String sessionUserKey = "sessionUser";
  final SharedPreferencesState prefs;
  SessionService(
    this.prefs,
  );

  @override
  void onInit() async {
    super.onInit();
    await init();
  }

  Future<void> init() async {
    try {
      final sessionData = await prefs.getDataFromKey(sessionUserKey) as String?;

      if (sessionData != null) {
        final session = sessionData;
        if (session.isNotEmpty) {
          _sessionUser.value = SessionUser.fromJson(session);
        }
      } else {
        _sessionUser.value = SessionUser.empty();
      }
    } on TypeError catch (e) {
      debugPrint(e.toString());
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createSessionUser(SessionUser userLogged) async {
    try {
      _sessionUser.value = userLogged;
      await prefs.setString(sessionUserKey, sessionUser.toJson());
      debugPrint("Save session: $sessionUser");
    } on TypeError catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearSessionUser() async {
    try {
      prefs.removeData(sessionUserKey);
      _sessionUser.value = SessionUser.empty();
      debugPrint("Clear session: $sessionUser");
    } on TypeError catch (e) {
      debugPrint(e.toString());
    }
  }

  bool get isLogged => sessionUser.token.isNotEmpty;
}
