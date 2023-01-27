import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'colors.dart';

class Variables {
  static const List<String> manCategoryList = [
    'Batsmen',
    'Bowlers',
    'Allrounders',
    'Teams'
  ];
  static const List<String> manGameType = ['ODI', 'T20'];
  static const List<String> manGameType2 = ['All', 'ODI', 'T20'];
  static const List<String> playerDetails = [
    'Overview',
    'Matches',
    'Player Info'
  ];
  static const List<String> playerOverview = [
    'Matches',
    'Innings',
    'Wickets',
    'Best'
  ];
  static const List<String> bowlerOverview = [
    'Econ',
    '3 Wkts',
    '5 Wkts',
    'Avg'
  ];
  static const List<String> iccRank = ['SR', 'Maiden', 'ICC Rank', ''];
  static const List<String> playerMatchOverview = [
    'Runs',
    'Inns',
    'Strike Rate',
    'Average'
  ];
  static const List<String> scoreDateMatch = ['Score', 'Date', 'Match'];
  static const List<String> newsCategory = [
    'News',
    'Video',
    'Biography',
  ];
  static const List<String> iplTabsCategory = [
    'Overview',
    'Matches',
    'Squads',
    'Points Table',
    'Info',
  ];
  static const List<String> iplDetailsTabsCategory = [
    'Info',
    // 'Fantasy',
    'Commentary',
    'Live',
    'Scorecard',
    // 'Graphs',
    'Points Table',
  ];
  static const List<String> keyStateTabsCategory = [
    'Most Runs',
    'Most Wickets',
    'Most Sixes',
    'Highest Score',
    'Best Figures',
    'Strike Rate',
    'Best Economy',
    'Best Fantasy Points',
  ];

  static const List<String> teamSquadsTabsCategory = [
    'ENG',
    'NZ',
  ];
  static const List<String> homeTabsCategory = [
    'Live(3)',
    'Home',
    'Upcoming',
    'Finished',
    'Fixtures',
  ];

  static final lightStatusBarTheme = SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AllColor.appLightBg,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true));
  static final darkStatusBarTheme = SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AllColor.appDarkBg,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true));

  static final portraitMood = SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  static final ThemeData lightThemeData = ThemeData(
      primarySwatch: const MaterialColor(0xff03508B, AllColor.primaryColorMap),
      scaffoldBackgroundColor: AllColor.appLightBg,
      appBarTheme: AppBarTheme(
          backgroundColor: AllColor.appDarkBg,
          titleTextStyle: TextStyle(
              color: AllColor.darkTextColor, fontWeight: FontWeight.bold),
          elevation: 0.0),
      canvasColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AllColor.primaryColor,
        elevation: 0.0,
        showUnselectedLabels: true,
        selectedItemColor: AllColor.primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(modalBackgroundColor: Colors.transparent),
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
          overline: TextStyle(fontFamily: "openSans")));

  static final ThemeData darkThemeData = ThemeData(
      primarySwatch: const MaterialColor(0xff03508B, AllColor.primaryColorMap),
      scaffoldBackgroundColor: AllColor.appDarkBg,
      appBarTheme: AppBarTheme(
          backgroundColor: AllColor.appDarkBg,
          titleTextStyle: TextStyle(
              color: AllColor.darkTextColor, fontWeight: FontWeight.bold),
          elevation: 0.0),
      canvasColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AllColor.appDarkBg,
        showUnselectedLabels: true,
        elevation: 0.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(modalBackgroundColor: Colors.transparent),
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
          overline: TextStyle(fontFamily: "openSans")));
}

void showToast(message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    fontSize: 16.0);
