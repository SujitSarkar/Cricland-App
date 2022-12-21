// import 'package:cricland/IPL/view/details_view/best_economy_tab.dart';
// import 'package:cricland/IPL/view/details_view/best_fantacy_point_tab.dart';
// import 'package:cricland/IPL/view/details_view/best_figure_tab.dart';
// import 'package:cricland/IPL/view/details_view/highest_score_tab.dart';
// import 'package:cricland/IPL/view/details_view/key_state_screen.dart';
// import 'package:cricland/IPL/view/details_view/most_runs_tab.dart';
// import 'package:cricland/IPL/view/details_view/most_sixes_tab.dart';
// import 'package:cricland/IPL/view/details_view/most_wickets_tab.dart';
// import 'package:cricland/IPL/view/details_view/strike_rate_tab.dart';
// import 'package:cricland/home/view/widgets/fantasy_profile_card.dart';
// import 'package:cricland/more/view/widgets/card_tile.dart';
// import 'package:cricland/public/controller/public_controller.dart';
// import 'package:cricland/public/variables/config.dart';
// import 'package:cricland/public/variables/variable.dart';
// import 'package:flutter/material.dart';
//
// class FantasyView extends StatefulWidget {
//   const FantasyView({Key? key}) : super(key: key);
//
//   @override
//   _FantasyViewState createState() => _FantasyViewState();
// }
//
// class _FantasyViewState extends State<FantasyView> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     text: 'Top Fantasy Points',
//                     style: TextStyle(
//                       fontWeight: FontWeight.normal,
//                       fontSize: dSize(.04),
//                       color: PublicController.pc.toggleTextColor(),
//                     ),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: '     *  Live',
//                         style: TextStyle(
//                           fontWeight: FontWeight.normal,
//                           fontSize: dSize(.04),
//                           color: Colors.redAccent,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "See All",
//                       style: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         fontSize: dSize(.04),
//                         color: PublicController.pc.toggleTextColor(),
//                       ),
//                     ),
//                     const Icon(
//                       Icons.arrow_forward_ios_sharp,
//                       size: 15,
//                     )
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 200,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   itemCount: 5,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: MoreCard(
//                           child: FantasyProfileCardTile(
//                         title: '',
//                         onTap: () {},
//                       )),
//                     );
//                   }),
//             ),
//             ListTile(
//               leading: Text(
//                 "Player State in Series",
//                 style: TextStyle(
//                   fontWeight: FontWeight.normal,
//                   fontSize: dSize(.04),
//                   color: PublicController.pc.toggleTextColor(),
//                 ),
//               ),
//               trailing: Text(
//                 "Analysis >",
//                 style: TextStyle(
//                   fontWeight: FontWeight.normal,
//                   fontSize: dSize(.04),
//                   color: PublicController.pc.toggleTextColor(),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 50,
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: Variables.keyStateTabsCategory.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(5),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 Variables.keyStateTabsCategory[index],
//                                 style: TextStyle(
//                                     color:
//                                         PublicController.pc.toggleTextColor()),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//             ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 itemCount: Variables.keyStateTabsCategory.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(5),
//                                   ),
//                                 ),
//                                 child: Image.asset(
//                                   'assets/player.png',
//                                   height: 100,
//                                   width: 100,
//                                 )),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     'Devid Miller',
//                                     style: TextStyle(
//                                         color: PublicController.pc
//                                             .toggleTextColor()),
//                                   ),
//                                   Text(
//                                     'SA - Batter',
//                                     style: TextStyle(
//                                         color: PublicController.pc
//                                             .toggleTextColor()),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Text(
//                               "64 Runs",
//                               style: TextStyle(
//                                   color: PublicController.pc.toggleTextColor()),
//                             ),
//                             Text(
//                               "3 Inns",
//                               style: TextStyle(
//                                   color: PublicController.pc.toggleTextColor()),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
