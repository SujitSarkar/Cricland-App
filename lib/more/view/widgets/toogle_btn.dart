import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:flutter/material.dart';
import '../../../public/variables/config.dart';

class AnimatedToggleButton extends StatefulWidget {
  final List<String> values;
  late  bool toggleValue;
  final double? height;
  final double? fontSize;
  final double width;
  final ValueChanged onToggleCallback;
  AnimatedToggleButton({
    Key? key,
    required this.values,
    required this.onToggleCallback,
    required this.toggleValue,
    this.height,
    this.fontSize,
    required this.width
  }) : super(key: key);

  @override
  _AnimatedToggleButtonState createState() => _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends State<AnimatedToggleButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              widget.onToggleCallback(1);
              setState(() {
                widget.toggleValue=! widget.toggleValue;
                if(widget.values[0]=='English') {
                  PublicController.pc.changeTheme(widget.toggleValue);
                }
              });
            },
            child: Container(
              width: widget.width,
              height: widget.height?? dSize(.12),
              decoration: ShapeDecoration(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(dSize(.1)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  widget.values.length,
                      (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
                    child: Text(
                      widget.values[index],
                      style: TextStyle(
                          fontSize: widget.fontSize?? dSize(.04),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            alignment:  widget.toggleValue
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: const Duration(milliseconds: 350),
            curve: Curves.ease,
            child: Container(
              alignment: Alignment.center,
              width: (widget.width)/2,
              height: widget.height?? dSize(.12),
              decoration: ShapeDecoration(
                  color: AllColor.primaryColor,
                  //shadows: themeProvider.themeMode().shadow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(dSize(.1)))),
              child: Text(
                widget.toggleValue
                    ? widget.values[0]
                    : widget.values[1],
                style: TextStyle(
                    fontSize: widget.fontSize?? dSize(.04), fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
