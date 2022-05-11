import 'package:flutter/material.dart';

import '../variables/color_variable.dart';

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
      child: CircularProgressIndicator(color: color??AllColor.secondaryColor),
    );
  }
}
