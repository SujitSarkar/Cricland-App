import 'package:flutter/material.dart';

class AllColor{
  static const Color primaryColor= Color(0xff03508B);
  static Color hintColor= Colors.grey.shade400;
  static Color lightTextColor= Colors.grey.shade900;
  static Color darkTextColor= Colors.white70;
  static Color appLightBg= const Color(0xffF3F6F3);
  static Color appDarkBg= const Color(0xff091418);
  static Color cardColor= const Color(0xff13242C);

  static const Map<int, Color> primaryColorMap = {
    50: Color.fromRGBO(3, 80, 139, .1),
    100: Color.fromRGBO(3, 80, 139, .2),
    200: Color.fromRGBO(3, 80, 139, .3),
    300: Color.fromRGBO(3, 80, 139, .4),
    400: Color.fromRGBO(3, 80, 139, .5),
    500: Color.fromRGBO(3, 80, 139, .6),
    600: Color.fromRGBO(3, 80, 139, .7),
    700: Color.fromRGBO(3, 80, 139, .8),
    800: Color.fromRGBO(3, 80, 139, .9),
    900: Color.fromRGBO(3, 80, 139, 1),
  };
}