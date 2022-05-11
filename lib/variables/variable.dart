import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'color_variable.dart';

class Variables {
  //static const String baseUrl = 'http://tashfia.binduitsolutions.com/api/';
  // final Map<String, String> authHeader = {
  //   "Content-Type": "application/json",
  //   'Authorization': 'Bearer ${PublicController.pc.loginResponse.value.token}',
  // };

  static var statusBarTheme = SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark
      ));

  static var portraitMood = SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  static ThemeData themeData = ThemeData(
      primarySwatch: const MaterialColor(0xffE9118F, AllColor.primaryColorMap),
      scaffoldBackgroundColor: AllColor.appBgColor,
      canvasColor: Colors.transparent,
      fontFamily: 'openSans',
      textTheme: const TextTheme(
          headline1: TextStyle(fontFamily: "openSans"),
          headline2: TextStyle(fontFamily: "openSans"),
          headline3: TextStyle(fontFamily: "openSans"),
          headline4: TextStyle(fontFamily: "openSans"),
          headline5: TextStyle(fontFamily: "openSans"),
          headline6: TextStyle(fontFamily: "openSans"),
          subtitle1: TextStyle(fontFamily: "openSans"),
          subtitle2: TextStyle(fontFamily: "openSans"),
          bodyText1: TextStyle(fontFamily: "openSans"),
          bodyText2: TextStyle(fontFamily: "openSans"),
          caption: TextStyle(fontFamily: "openSans"),
          button: TextStyle(fontFamily: "openSans"),
          overline: TextStyle(fontFamily: "openSans")
      )
  );

}

void showToast(message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    fontSize: 16.0
);

// DateTime today12Am(){
//   DateTime dt = DateTime.now();
//   return DateTime.parse("${dt.year}"
//       "-""${dt.month.toString().length==1?'0${dt.month}':dt.month}"
//       "-""${dt.day.toString().length==1?'0${dt.day}':dt.day}"
//       " 12:00:00");
// }
//
// DateTime today23Pm(){
//   DateTime dt = DateTime.now();
//   return DateTime.parse("${dt.year}"
//       "-""${dt.month.toString().length==1?'0${dt.month}':dt.month}"
//       "-""${dt.day.toString().length==1?'0${dt.day}':dt.day}"
//       " 23:59:59");
// }