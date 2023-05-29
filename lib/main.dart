import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/more/controller/more_controller.dart';
import 'package:cricland/more/controller/ranking_controller.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/screens/notification_screen.dart';
import 'package:cricland/public/screens/splash_screen.dart';
import 'package:cricland/public/service/local_notification_service.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb
        ? const FirebaseOptions(
            apiKey: "AIzaSyAXH46EheF_v8Sb0mzXB3ye-gwNkLraG7o",
            appId: "1:788456208019:web:3fe44b77e8b2d5186d3f66",
            messagingSenderId: "788456208019",
            projectId: "cricland",
          )
        : null,
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // if (Platform.isIOS) {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // } else {
  //   await Firebase.initializeApp();
  // }
  Variables.portraitMood;
  Variables.darkStatusBarTheme;
  Get.put(PublicController());
  Get.put(LanguageController());
  Get.put(HomeController());
  Get.put(MoreController());
  Get.put(RankingController());

  if (!kIsWeb) {
    NotificationService.initialize();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _fcmInit();
    }
  }

  Future<void> _fcmInit() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      Navigator.push(
          navigatorKey.currentState!.context,
          MaterialPageRoute(
              builder: (context) => NotificationScreen(
                  title: message.notification!.title,
                  body: message.notification!.body)));
    });

    ///When App Running
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print('::::::::::::::FCM(On Running)::::::::::::::');
      }
      if (message.notification != null) {
        NotificationService.display(message);
        print('Title: ${message.notification!.title}');
        print('Body: ${message.notification!.body}');
      }
    });
  }

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
