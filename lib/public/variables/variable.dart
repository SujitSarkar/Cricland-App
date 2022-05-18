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

  static final lightStatusBarTheme = SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
         statusBarColor: AllColor.appLightBg,
         statusBarBrightness: Brightness.light,
         statusBarIconBrightness: Brightness.dark,
         systemStatusBarContrastEnforced: true
      ));
  static final darkStatusBarTheme = SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
         statusBarColor: AllColor.appDarkBg,
         statusBarBrightness: Brightness.dark,
         statusBarIconBrightness: Brightness.light,
         systemStatusBarContrastEnforced: true
      ));

  static final portraitMood = SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  static final ThemeData lightThemeData = ThemeData(
      primarySwatch: const MaterialColor(0xff03508B, AllColor.primaryColorMap),
      scaffoldBackgroundColor: AllColor.appLightBg,
      appBarTheme: AppBarTheme(
        backgroundColor: AllColor.appDarkBg,
        titleTextStyle: TextStyle(color: AllColor.darkTextColor,fontWeight: FontWeight.bold),
        elevation: 0.0
      ),
      canvasColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AllColor.appLightBg,
        elevation: 0.0,
        showUnselectedLabels: true,
        selectedItemColor: AllColor.primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: Colors.transparent
      ),
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

  static final ThemeData darkThemeData = ThemeData(
      primarySwatch: const MaterialColor(0xff03508B, AllColor.primaryColorMap),
      scaffoldBackgroundColor: AllColor.appDarkBg,
      appBarTheme: AppBarTheme(
          backgroundColor: AllColor.appDarkBg,
          titleTextStyle: TextStyle(color: AllColor.darkTextColor,fontWeight: FontWeight.bold),
          elevation: 0.0
      ),
      canvasColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AllColor.appDarkBg,
        showUnselectedLabels: true,
        elevation: 0.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent
      ),
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