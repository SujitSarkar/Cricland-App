// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cricland/home/controller/home_controller.dart';
// import 'package:cricland/public/controller/api_endpoints.dart';
// import 'package:cricland/public/controller/public_controller.dart';
// import 'package:cricland/public/variables/config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// class CommentaryProfileCardTile extends StatelessWidget {
//   final String playerName;
//   final String playerImage;
//   final String run;
//   final String bol;
//
//   final Function() onTap;
//   const CommentaryProfileCardTile({
//     Key? key,
//     required this.playerName,
//     required this.onTap,
//     required this.playerImage,
//     required this.run,
//     required this.bol,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (homeController) {
//       return Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 80,
//               width: 80,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                     image: CachedNetworkImageProvider(
//                       ApiEndpoints.imageMidPoint +
//                           playerImage +
//                           ApiEndpoints.imageLastPoint,
//                       headers: ApiEndpoints.headers,
//                     ),
//                     fit: BoxFit.fill),
//               ),
//             ),
//             // Image.asset(
//             //   'assets/player.png',
//             //   height: 80,
//             //   width: 80,
//             // ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               playerName,
//               style: TextStyle(
//                   fontSize: dSize(.03),
//                   fontWeight: FontWeight.w500,
//                   color: PublicController.pc.toggleTextColor()),
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   run,
//                   style: TextStyle(
//                       fontSize: dSize(.04),
//                       fontWeight: FontWeight.w500,
//                       color: PublicController.pc.toggleTextColor()),
//                 ),
//                 Text(
//                   bol,
//                   style: TextStyle(
//                       fontSize: dSize(.04),
//                       fontWeight: FontWeight.bold,
//                       color: PublicController.pc.toggleTextColor()),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
