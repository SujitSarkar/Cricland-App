import 'package:flutter/material.dart';

class BounchingDialog extends StatefulWidget {
  final Widget child;
  final double? height;
  final double? width;
  const BounchingDialog(
      {Key? key, required this.child, this.height, this.width})
      : super(key: key);

  @override
  State<BounchingDialog> createState() => _BounchingDialogState();
}

class _BounchingDialogState extends State<BounchingDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation!,
            child: Container(
              height: widget.height,
              width: widget.width,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
