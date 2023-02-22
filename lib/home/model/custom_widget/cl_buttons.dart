// import 'package:cricland/home/model/custom_widget/app_text_style.dart';
// import 'package:cricland/public/variables/colors.dart';
// import 'package:cricland/public/variables/config.dart';
// import 'package:flutter/material.dart';
//
// class CLButton extends StatelessWidget {
//   final Widget child;
//   final bool isFilled;
//   final IconData? iconData;
//   final void Function()? onPressed;
//   final bool isExpanded;
//   final Color buttonColor;
//   final bool hasDesign;
//
//   const CLButton({
//     Key? key,
//     required this.child,
//     this.onPressed,
//     this.iconData,
//     this.isExpanded = false,
//     this.isFilled = false,
//     this.hasDesign = true,
//     this.buttonColor = AllColor.primaryColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       elevation: 0,
//       child: hasDesign
//           ? isFilled
//               ? Container(
//                   height: dSize(.15),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     image: DecorationImage(
//                       image: Image.asset(
//                         "assets/images/buttonwire.png",
//                       ).image,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   child: Center(child: child),
//                 )
//               : Container(
//                   height: dSize(.15),
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     color: Colors.transparent,
//                   ),
//                   child: Center(child: child),
//                 )
//           : child,
//       minWidth: isExpanded ? double.infinity : null,
//       height: dSize(.15),
//       onPressed: onPressed,
//       color: isFilled ? buttonColor : Colors.white,
//       padding: EdgeInsets.zero,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//         side: BorderSide(
//           color: buttonColor,
//           width: 6.0,
//         ),
//       ),
//     );
//   }
// }
