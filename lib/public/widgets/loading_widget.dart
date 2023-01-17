import 'package:cricland/public/controller/public_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final PublicController pc = Get.find();
    return Container(
        color: Colors.black38,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Obx(
          () => SpinKitFadingCircle(
            color: pc.isLight.value
                ? Theme.of(context).primaryColor
                : Colors.white,
            size: MediaQuery.of(context).size.width * .15,
          ),
        ));
  }
}
