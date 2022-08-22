import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class CLTextStyle {
  static const TextStyle menuBarTextStyle = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: "CarterOne",
    fontSize: 12,
  );

  static const TextStyle nameTextStyle = TextStyle(
    fontFamily: "Shrikhand",
    fontSize: 12,
  );

  static const TextStyle paragraphTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: "KdamThmorPro",
  );

  static const TextStyle optionTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: "CarterOne",
  );

  static const TextStyle paragraphHeadLineTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: "AbrilFatface",
  );
  // static TextStyle CLHeader = TextStyle(
  //   fontWeight: FontWeight.w900,
  //   fontFamily: "openSans",
  //   fontSize: 30,
  //   color: PublicController.pc.toggleTextColor(),
  // );
  //
  // static TextStyle CLSubHeader = TextStyle(
  //   fontSize: dSize(.04),
  //   fontFamily: "openSans",
  //   color: PublicController.pc.toggleTextColor(),
  // );
  // static TextStyle CLBodytext = TextStyle(
  //   fontWeight: FontWeight.w500,
  //   fontSize: 15,
  //   fontFamily: "openSans",
  //   color: PublicController.pc.toggleTextColor(),
  // );
  //
  // static TextStyle testFormLettering = TextStyle(
  //   fontWeight: FontWeight.w500,
  //   fontSize: 12,
  //   fontFamily: "openSans",
  //   color: PublicController.pc.toggleTextColor(),
  // );
  //
  // static TextStyle buttonText = TextStyle(
  //   fontWeight: FontWeight.bold,
  //   fontSize: 15,
  //   fontFamily: "openSans",
  //   color: PublicController.pc.toggleTextColor(),
  // );
}

Icon backButton = Icon(
  Icons.arrow_back_ios,
  color: PublicController.pc.toggleTextColor(),
  size: 20,
);
Icon menuButton = Icon(
  Icons.menu_outlined,
  color: PublicController.pc.toggleTextColor(),
  size: 20,
);
