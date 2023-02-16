import 'package:cricland/public/controller/public_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black38,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Obx(
          () => SpinKitFadingCircle(
            color: PublicController.pc.isLight.value
                ? Theme.of(context).primaryColor
                : Colors.white,
            size: MediaQuery.of(context).size.width * .15,
          ),
        ));
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Obx(
          () => SpinKitFadingCircle(
        color: PublicController.pc.isLight.value
            ? Theme.of(context).primaryColor
            : Colors.white,
        size: MediaQuery.of(context).size.width * .15,
      ),
    ));
  }
}

