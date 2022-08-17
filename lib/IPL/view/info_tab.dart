// import 'package:cricland/IPL/view/widgets/info_card_tile.dart';
// import 'package:cricland/public/controller/public_controller.dart';
// import 'package:cricland/public/variables/config.dart';
// import 'package:flutter/material.dart';
//
// class InfoTab extends StatefulWidget {
//   const InfoTab({Key? key}) : super(key: key);
//
//   @override
//   _InfoTabState createState() => _InfoTabState();
// }
//
// class _InfoTabState extends State<InfoTab> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "T20",
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontSize: dSize(.05),
//                 color: PublicController.pc.toggleTextColor(),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                   border: Border.all(width: 1, color: Colors.grey)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "IPL 2022 Winner",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 fontSize: dSize(.03),
//                                 color: PublicController.pc.toggleTextColor(),
//                               ),
//                             ),
//                             Text("🏆"),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Image.asset(
//                               'assets/t20.png',
//                               height: 30,
//                               width: 30,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Gujarat Titans",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 fontSize: dSize(.04),
//                                 color: PublicController.pc.toggleTextColor(),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     ),
//                     Text(
//                       "#1",
//                       style: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         fontSize: dSize(.07),
//                         color: PublicController.pc.toggleTextColor(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                   border: Border.all(width: 1, color: Colors.grey)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           "Player of the Series",
//                           style: TextStyle(
//                             fontWeight: FontWeight.normal,
//                             fontSize: dSize(.03),
//                             color: PublicController.pc.toggleTextColor(),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Image.asset(
//                               'assets/player.png',
//                               height: 50,
//                               width: 50,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "J Buttler",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: dSize(.04),
//                                     color:
//                                         PublicController.pc.toggleTextColor(),
//                                   ),
//                                 ),
//                                 Text(
//                                   "Rajasthan Royals",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: dSize(.02),
//                                     color:
//                                         PublicController.pc.toggleTextColor(),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             InfoCardTile(
//               series: '',
//               duration: "",
//               format: "",
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
