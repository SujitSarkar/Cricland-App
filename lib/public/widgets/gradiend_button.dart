import 'package:cricland/public/widgets/decoration.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({Key? key, required this.onTap, required this.child})
      : super(key: key);
  final Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: double.infinity,
      decoration: StDecoration().buttonDecoration.copyWith(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        child: child,
      ),
    );
  }
}
