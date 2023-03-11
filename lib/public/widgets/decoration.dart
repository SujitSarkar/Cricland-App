import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:flutter/material.dart';
import '../variables/config.dart';

class StDecoration {
  BoxDecoration loginRegDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(dSize(.8)),
          bottomRight: Radius.circular(dSize(.8))),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(2, 3),
            blurRadius: 10)
      ]);

  BoxDecoration sliverAppbarGradient = PublicController.pc.isLight.value
      ? BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.green.shade900,
            const Color(0xffFA9C2D),
          ],
        ))
      : const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AllColor.darkCardColor,
            AllColor.darkCardColor,
          ],
        ));

  BoxDecoration buttonDecoration = PublicController.pc.isLight.value
      ? BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.green.shade900,
            const Color(0xffFA9C2D),
          ],
        ))
      : BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.grey.shade600,
            Colors.grey.shade600,
          ],
        ));

  LinearGradient tabBarGradient = PublicController.pc.isLight.value
      ? LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.green.shade900,
            const Color(0xffFA9C2D),
          ],
        )
      : LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.grey.shade600,
            Colors.grey.shade600,
          ],
        );

  List<Color> navBarUnselectedIconColor = PublicController.pc.isLight.value
      ? [Colors.grey, Colors.grey]
      : [Colors.white, Colors.white];
}
