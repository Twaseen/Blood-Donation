import 'package:final_app/authentication_repository.dart';
import 'package:final_app/dashboard.dart';
import 'package:final_app/firebase_options.dart';
import 'package:final_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:final_app/splash_screen.dart';
import '1stpage.dart';
import 'package:get/get.dart';
import 'package:final_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthenticationRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
      title: 'Blood Bank ',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      themeMode: ThemeMode.system,
      home: dashboard(), // Assuming that your dashboard is the starting screen
    );
  }
}
