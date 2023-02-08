import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/screens/home_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller/public_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  Future<void> _initData() async {
    Future.delayed(const Duration(milliseconds: 2500))
        .then((value) => Get.offAll(() => const HomeNavPage()));
  }

  @override
  Widget build(BuildContext context) {
    final LanguageController langController = Get.find();
    final Size size = MediaQuery.of(context).size;
    langController.initializeApp(context);
    return GetBuilder<PublicController>(
        init: PublicController(),
        builder: (pc) {
          return Scaffold(
              body: Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/splash_bg_image.jpg'),
                    fit: BoxFit.cover)),
            child: SizedBox(
                width: size.width * .8,
                child: Lottie.asset('assets/lottie/splash_lottie.json')),
          ));
        });
  }
}
