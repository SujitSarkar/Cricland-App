import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  TextStyle tileStyle = TextStyle(
      fontSize: dSize(.042),
      fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  TextStyle largeTitleStyle = TextStyle(
    fontSize: dSize(.04),
    fontFamily: "openSans",
    color: PublicController.pc.toggleTextColor(),
  );

  TextStyle largeTitleBoldStyle = TextStyle(
    fontSize: dSize(.04),
    fontFamily: "openSans",
    fontWeight: FontWeight.bold,
    color: PublicController.pc.toggleTextColor(),
  );

  TextStyle titleTextStyle = TextStyle(
      fontSize: dSize(.038),
      fontFamily: "openSans",
      color: PublicController.pc.toggleTextColor());

  TextStyle titleTextBoldStyle = TextStyle(
      fontSize: dSize(.038),
      fontFamily: "openSans",
      fontWeight: FontWeight.bold,
      color: PublicController.pc.toggleTextColor());

  TextStyle bodyTextStyle = TextStyle(
    fontSize: dSize(.032),
    fontFamily: "openSans",
    color: PublicController.pc.toggleTextColor(),
  );

  TextStyle boldBodyTextStyle = TextStyle(
    fontSize: dSize(.032),
    fontFamily: "openSans",
    color: PublicController.pc.toggleTextColor(),
  );

  TextStyle paragraphTextStyle = TextStyle(
    fontSize: dSize(.03),
    fontFamily: "openSans",
    color: PublicController.pc.toggleTextColor(),
  );

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
