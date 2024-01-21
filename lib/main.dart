import 'package:final_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_app/authentication_repository.dart';
import 'package:final_app/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthenticationRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Bank ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const Dashboard(),
    );
    import 'package:final_app/splash_screen.dart';
    import 'package:flutter/material.dart';
    import 'package:final_app/authentication_repository.dart';
    import 'package:final_app/dashboard.dart';
    import 'package:firebase_core/firebase_core.dart';
    import 'package:get/get.dart';

    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      Get.put(AuthenticationRepository());
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return GetMaterialApp(
    title: 'Blood Bank ',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    home: SplashScreen(),
    );
    }
    } }
}