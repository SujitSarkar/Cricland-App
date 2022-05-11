import 'package:cricland/screens/splash_screen.dart';
import 'package:cricland/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/public_controller.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Variables.statusBarTheme;
  Variables.portraitMood;
  final PublicController pc = Get.put(PublicController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cricland',
      debugShowCheckedModeBanner: false,
      theme: Variables.themeData,
      home: const SplashScreen(),
    );
  }
}