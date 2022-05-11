import 'package:flutter/material.dart';

import '../variables/config.dart';

class ColorTextButton extends StatelessWidget {
  const ColorTextButton({Key? key,required this.onPressed, required this.text, this.buttonColor, this.minimumSize}) : super(key: key);
  final Function() onPressed;
  final String text;
  final Color? buttonColor;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text,style: TextStyle(color: buttonColor??Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,fontSize: dSize(.047))),
      style: ElevatedButton.styleFrom(
          primary: buttonColor !=null
              ?buttonColor!.withOpacity(.3)
              :Theme.of(context).primaryColor.withOpacity(.3),
          minimumSize: minimumSize?? Size(dSize(.35),dSize(.12)),
          elevation: 0.0),
    );
  }
}
