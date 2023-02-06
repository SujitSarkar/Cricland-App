import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/screens/home_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller/public_controller.dart';

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
    Future.delayed(const Duration(milliseconds: 3500))
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
                    fit: BoxFit.fitHeight)),
            child: SizedBox(
                width: size.width * .8,
                child: Lottie.asset('assets/lottie/splash_lottie.json')),
          ));
        });
  }
}
