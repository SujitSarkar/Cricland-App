import 'package:cricland/more/controller/more_controller.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/screens/splash_screen.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //   apiKey: "AIzaSyAXH46EheF_v8Sb0mzXB3ye-gwNkLraG7o",
      //   appId: "1:788456208019:web:3fe44b77e8b2d5186d3f66",
      //   messagingSenderId: "788456208019",
      //   projectId: "cricland",
      // ),
      );
  Variables.portraitMood;
  Variables.darkStatusBarTheme;
  Get.put(PublicController());
  Get.put(LanguageController());
  Get.put(MoreController());
  runApp(const MyApp()
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(),
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(builder: (pc) {
      return GetMaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Cricland',
          debugShowCheckedModeBanner: false,
          theme: pc.toggleTheme(),
          home: const SplashScreen());
    });
  }
}
