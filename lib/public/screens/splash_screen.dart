import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/screens/home_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../home/model/custom_widget/constants.dart';
import '../controller/public_controller.dart';
import '../variables/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offAll(() => const HomeNavPage()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LanguageController langController = Get.find();
    langController.initializeApp(context);
    return GetBuilder<PublicController>(
        init: PublicController(),
        builder: (pc) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lottie/splash_lottie.json'),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Crickland',
                          textStyle: TextStyle(
                              fontSize: dSize(.09),
                              fontWeight: FontWeight.w900,
                              color: const Color(0xffFF002D)),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 100,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ],
                ),
              )
              );
        });
  }
}
