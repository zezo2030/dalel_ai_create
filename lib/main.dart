import 'package:dalel_ai/app/dalel_app.dart';
import 'package:dalel_ai/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'core/services/service_locator.dart';
import 'core/database/cache/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupServiceLocator();
  getIt<CacheHelper>().init();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  runApp(const DalelAI());
}
