import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/screens/splash_screen.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Variables.portraitMood;
  final PublicController pc = Get.put(PublicController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(
      builder: (pc) {
        pc.toggleStatusBar(); //statusBar Theme
        return GetMaterialApp(
          title: 'Cricland',
          debugShowCheckedModeBanner: false,
          theme: pc.toggleTheme(),
          home: const SplashScreen(),
        );
      }
    );
  }
}