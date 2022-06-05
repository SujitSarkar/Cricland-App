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
  await Firebase.initializeApp();
  Variables.portraitMood;
  Variables.darkStatusBarTheme;
  final PublicController pc = Get.put(PublicController());
  final LanguageController lc = Get.put(LanguageController());
  final MoreController mc = Get.put(MoreController());
  runApp(MyApp()
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
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          title: 'Cricland',
          debugShowCheckedModeBanner: false,
          theme: pc.toggleTheme(),
          home: const SplashScreen());
    });
  }
}
