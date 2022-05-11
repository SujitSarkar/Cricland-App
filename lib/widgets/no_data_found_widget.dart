import 'package:flutter/material.dart';

import '../variables/config.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({Key? key, this.mgs, this.textColor}) : super(key: key);
  final String? mgs;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
            mgs??'No data found !',
            style: TextStyle(
              color: textColor?? const Color(0xffF0A732),
              fontSize: dSize(.05)
            )));
  }
}
