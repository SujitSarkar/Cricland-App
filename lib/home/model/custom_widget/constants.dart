import 'package:cricland/public/variables/colors.dart';
import 'package:flutter/material.dart';

class CLTextStyle {
  static const TextStyle CLHeader = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: "Typography",
    fontSize: 30,
    color: AllColor.primaryColor,
  );
  static const TextStyle CLHeaderWhite = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: "Typography",
    fontSize: 30,
    color: AllColor.lightCardColor,
  );

  static const TextStyle CLSubHeader = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    fontFamily: "openSans",
    color: AllColor.lightCardColor,
  );
  static const TextStyle CLSubHeaderSecondery = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 17,
    fontFamily: "openSans",
    color: AllColor.primaryColor,
  );
  static const TextStyle CLSubHeaderWhite = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    fontFamily: "openSans",
    color: Colors.white,
  );

  static const TextStyle CLBodytext = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    fontFamily: "openSans",
    color: AllColor.appLightBg,
  );
  static const TextStyle CLBodytextWhite = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    fontFamily: "openSans",
    color: AllColor.lightCardColor,
  );

  static TextStyle testFormLettering = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    fontFamily: "openSans",
    color: AllColor.lightTextColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    fontFamily: "openSans",
    color: AllColor.primaryColor,
  );
}

const Icon backButton = Icon(
  Icons.arrow_back_ios,
  color: Colors.black,
  size: 20,
);
const Icon menuButton = Icon(
  Icons.menu_outlined,
  color: Colors.black,
  size: 20,
);
