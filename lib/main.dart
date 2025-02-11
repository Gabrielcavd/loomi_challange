import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loomi_challange/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //     apiKey: "AIzaSyAHfsGU0-XC1rWd2PiBe245eOeethkP2tQ",
      //     appId: "1:787952710825:android:d65eb905a7dcfac58b25b8",
      //     messagingSenderId: "787952710825",
      //     projectId: "untold-app-prod"),
      );
  runApp(
    const MainApp(),
  );
}
