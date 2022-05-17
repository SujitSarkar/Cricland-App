import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/public_controller.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key,this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Obx(()=>CircularProgressIndicator(color: color?? PublicController.pc.toggleLoadingColor())),
    );
  }
}
