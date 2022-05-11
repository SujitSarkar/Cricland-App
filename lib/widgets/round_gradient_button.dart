import 'package:flutter/material.dart';
import '../../variables/config.dart';

class RoundGradientButton extends StatelessWidget {
  const RoundGradientButton({Key? key,required this.onTab, required this.child}) : super(key: key);
  final Function() onTab;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(dSize(.04)),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.lightBlue,
                  Colors.cyanAccent.shade400,
                  //Color(0xff16CBC9), Color(0xff1FEA9E)
                ]),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  offset: const Offset(0, 10),
                  blurRadius: 8)
            ]),
        child: child,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(100)),
    );
  }
}
