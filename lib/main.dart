import 'package:final_app/splash_screen.dart';
import 'package:final_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:final_app/firebase_options.dart';
import 'firebase_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Bank ',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
