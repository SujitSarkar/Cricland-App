import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'colors.dart';

class Variables {
  //static const String baseUrl = 'http://tashfia.binduitsolutions.com/api/';
  // final Map<String, String> authHeader = {
  //   "Content-Type": "application/json",
  //   'Authorization': 'Bearer ${PublicController.pc.loginResponse.value.token}',
  // };

  static const List<String> manCategoryList = ['Team','Batter','Bowler','All Rounder'];
  static const List<String> manGameType = ['ODI','T20','Test'];
  static const List<String> manGameType2 = ['All','ODI','T20','Test','100B'];
  static const List<String> playerDetails = ['Overview','Matches','News','Player Info'];
  static const List<String> playerOverview = ['Matches','Innings','Wickets', 'Best'];
  static const List<String> bowlerOverview = ['Econ','3 Wkts','5 Wkts', 'Avg'];
  static const List<String> iccRank = ['SR','Maiden','ICC Rank',''];
  static const List<String> playerMatchOverview = ['Runs','Inns','Strike Rate','Average'];
  static const List<String> scoreDateMatch = ['Score','Date','Match'];

  static final lightStatusBarTheme = SystemChrome.setSystemUIOverlayStyle(
       const SystemUiOverlayStyle(
         statusBarColor: AllColor.appLightBg,
         statusBarBrightness: Brightness.light,
         statusBarIconBrightness: Brightness.dark,
         systemStatusBarContrastEnforced: true
      ));
  static final darkStatusBarTheme = SystemChrome.setSystemUIOverlayStyle(
       const SystemUiOverlayStyle(
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AllColor.appLightBg,
        elevation: 0.0,
        showUnselectedLabels: true,
        selectedItemColor: AllColor.primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AllColor.appDarkBg,
        showUnselectedLabels: true,
        elevation: 0.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
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

  static String aboutSakib = 'Shakib Al Hasan made his test debut in 2007 against India. His breakthrough came in the '
      'Test against New Zealand in Chittagong in 2008. He picked up 7/36, which to date is the best figure by a Bangladeshi '
      'bowler. In the 2012 Asia Cup, Shakib scored 237 runs, including three fifties, and took six wickets. Bangladesh '
      'progressed to the tournament\'s final for the first time, where they lost to Pakistan by two runs. Shakib Al Hasan\n\n'
      ' received many awards for his performance in the game. He was awarded the Player of the Tournament award in the 2019 '
      'Cricket World Cup for hitting back to back centuries and half-centuries for his country.[10] He ended up as 3rd most'
      ' run-scorer in the tournament with 606 runs in total.[11] He has received 31 man-of-the-match awards and 16 '
      'man-of-the-series awards in all formats.[12] Currently, he holds the 3rd most Player of the tournament awards in\n\n'
      ' all forms after Sachin Tendulkar and Virat Kohli.[13]Between 2009 and 2022, he captained the Bangladesh cricket '
      'team in 85 matches across all three formats.Shakib is a vital cog in Bangladesh\'s line-up as a genuine all-rounder.'
      ' He has been a consistent performer for his country over the years. Shakib was ranked No. 1 among the all-rounders by\n\n '
      'the ICC thanks to his consistency. He is a very controversial figure in Bangladeshi cricket history, always making at '
      'the top of the headlines for aggressive behavior inside and outside of the field. He is the most followed person on'
      ' Facebook from Bangladesh, with more than 15.5 million followers.[14] As of March 2022, Shakib holds the record for'
      ' the most men\'s Twenty20 International wickets, at 119.';


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