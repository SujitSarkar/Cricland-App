import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class CLTextStyle {
  TextStyle moreTitleStyle = TextStyle(
      fontSize: dSize(.042),
      fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  TextStyle menuBarTextStyle = TextStyle(
    fontFamily: "openSans",
    fontSize: dSize(.03),
    fontWeight: FontWeight.w500,
    color: PublicController.pc.toggleTextColor(),
  );

  TextStyle nameTextStyle = TextStyle(
    fontFamily: "openSans",
    fontSize: dSize(.04),
    color: PublicController.pc.toggleTextColor(),
  );

  TextStyle paragraphTextStyle = TextStyle(
    fontSize: dSize(.02),
    fontFamily: "openSans",
    color: PublicController.pc.toggleTextColor(),
  );

  TextStyle optionTextStyle = TextStyle(
    fontSize: dSize(.04),
    fontFamily: "openSans",
    color: PublicController.pc.toggleTextColor(),
  );

  TextStyle paragraphHeadLineTextStyle = TextStyle(
    fontSize: dSize(.04),
    fontFamily: "openSans",
    color: PublicController.pc.toggleTextColor(),
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
  size: dSize(.04),
);
Icon menuButton = Icon(
  Icons.menu_outlined,
  color: PublicController.pc.toggleTextColor(),
  size: dSize(.04),
);
