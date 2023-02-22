// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cricland/IPL/view/details_view/live_progeress_bottom_sheet.dart';
// import 'package:cricland/home/controller/home_controller.dart';
// import 'package:cricland/home/model/custom_widget/app_text_style.dart';
// import 'package:cricland/home/view/widgets/head_to_head_tile.dart';
// import 'package:cricland/home/view/widgets/real_time_win_card.dart';
// import 'package:cricland/more/view/widgets/card_tile.dart';
// import 'package:cricland/public/controller/public_controller.dart';
// import 'package:cricland/public/variables/config.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import '../../../../public/controller/api_endpoints.dart';
// import '../../widgets/weather_card_tile.dart';
//
// class UpcomingLiveView extends StatefulWidget {
//   final String team1ImageID;
//   final String team2ImageID;
//   final int selectedIndex;
//
//   const UpcomingLiveView({
//     Key? key,
//     required this.team1ImageID,
//     required this.team2ImageID,
//     required this.selectedIndex,
//   }) : super(key: key);
//
//   @override
//   _UpcomingLiveViewState createState() => _UpcomingLiveViewState();
// }
//
// class _UpcomingLiveViewState extends State<UpcomingLiveView> {
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (homeController) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               LiveWinCardTile(
//                 selectedIndex: widget.selectedIndex,
//                 onTap: () {
//                   _showSquadsSheet(context);
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Match Preview",
//                 style: CLTextStyle().nameTextStyle.copyWith(
//                   fontSize: 15,
//                   color: PublicController.pc.toggleTextColor(),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               // WeatherCardTile(
//               //   title: '',
//               //   onTap: () {},
//               // ),
//               MoreCard(
//                 child: HeadToHeadCardTile(
//                   leadingWidget: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 25,
//                           width: 25,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 image: CachedNetworkImageProvider(
//                                   ApiEndpoints.imageMidPoint +
//                                       widget.team1ImageID +
//                                       ApiEndpoints.imageLastPoint,
//                                   headers: ApiEndpoints.headers,
//                                 ),
//                                 fit: BoxFit.fill),
//                           ),
//                         ),
//                         // Image.asset(
//                         //   'assets/bd_flag.png',
//                         //   height: 25,
//                         //   width: 25,
//                         // ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Container(
//                           height: 25,
//                           width: 25,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 image: CachedNetworkImageProvider(
//                                   ApiEndpoints.imageMidPoint +
//                                       widget.team2ImageID +
//                                       ApiEndpoints.imageLastPoint,
//                                   headers: ApiEndpoints.headers,
//                                 ),
//                                 fit: BoxFit.fill),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   title: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       text:
//                           "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![widget.selectedIndex].seriesAdWrapper!.matches![0].matchInfo!.team1!.teamSName}",
//                       style: CLTextStyle().nameTextStyle,
//                       children: <TextSpan>[
//                         const TextSpan(
//                           text: ' vs ',
//                         ),
//                         TextSpan(
//                           text:
//                               "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![widget.selectedIndex].seriesAdWrapper!.matches![0].matchInfo!.team2!.teamSName}",
//                         ),
//                       ],
//                     ),
//                   ),
//                   trailingWidget: Text("Head to Head",
//                       style: CLTextStyle().paragraphHeadLineTextStyle),
//                   onTap: () {},
//                 ),
//               ),
//               homeController.scoreCardModel.scoreCard != null
//                   ? Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(5),
//                         ),
//                         color: Colors.white,
//                       ),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             leading: Container(
//                               width: 50,
//                               height: 35,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.rectangle,
//                                 image: DecorationImage(
//                                     image: CachedNetworkImageProvider(
//                                       ApiEndpoints.imageMidPoint +
//                                           widget.team1ImageID +
//                                           ApiEndpoints.imageLastPoint,
//                                       headers: ApiEndpoints.headers,
//                                     ),
//                                     fit: BoxFit.fill),
//                               ),
//                             ),
//                             trailing: RichText(
//                               text: TextSpan(
//                                 text:
//                                     "${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.runs}-${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.wickets}",
//                                 style: CLTextStyle().nameTextStyle.copyWith(
//                                   fontSize: dSize(.045),
//                                   color: PublicController.pc.toggleTextColor(),
//                                 ),
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text:
//                                         "(${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.ballNbr} b)",
//                                     style: CLTextStyle().nameTextStyle.copyWith(
//                                       fontSize: dSize(.03),
//                                       color:
//                                           PublicController.pc.toggleTextColor(),
//                                     ),
//                                   ),
//                                   // TextSpan(text: ' world!'),
//                                 ],
//                               ),
//                             ),
//                             title: RichText(
//                               text: TextSpan(
//                                 text: homeController.scoreCardModel.scoreCard!
//                                     .first.batTeamDetails!.batTeamShortName,
//                                 style: CLTextStyle().nameTextStyle.copyWith(
//                                   fontSize: dSize(.045),
//                                   color: PublicController.pc.toggleTextColor(),
//                                 ),
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text: homeController.scoreCardModel
//                                                 .scoreCard!.first.inningsId ==
//                                             1
//                                         ? "  1st Innings"
//                                         : "  2nd Innings",
//                                     style: CLTextStyle().nameTextStyle.copyWith(
//                                       fontSize: dSize(.03),
//                                       color:
//                                           PublicController.pc.toggleTextColor(),
//                                     ),
//                                   ),
//                                   // TextSpan(text: ' world!'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: homeController
//                                   .scoreCardModel
//                                   .scoreCard!
//                                   .first
//                                   .batTeamDetails!
//                                   .batsmenData!
//                                   .length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Column(
//                                   children: [
//                                     const Divider(
//                                       color: Colors.grey,
//                                       height: 1,
//                                     ),
//                                     ListTile(
//                                       trailing: RichText(
//                                         text: TextSpan(
//                                           text:
//                                               "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].runs}",
//                                           style: CLTextStyle().nameTextStyle
//                                               .copyWith(
//                                             fontSize: dSize(.03),
//                                             color: PublicController.pc
//                                                 .toggleTextColor(),
//                                           ),
//                                           children: <TextSpan>[
//                                             TextSpan(
//                                               text:
//                                                   "(${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].balls})",
//                                               style: CLTextStyle().nameTextStyle
//                                                   .copyWith(
//                                                 fontSize: dSize(.035),
//                                                 color: PublicController.pc
//                                                     .toggleTextColor(),
//                                               ),
//                                             ),
//                                             // TextSpan(text: ' world!'),
//                                           ],
//                                         ),
//                                       ),
//                                       title: Text(
//                                         "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].batName}",
//                                         style:
//                                             CLTextStyle().nameTextStyle.copyWith(
//                                           fontSize: dSize(.03),
//                                           color: PublicController.pc
//                                               .toggleTextColor(),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               }),
//                         ],
//                       ),
//                     )
//                   : SizedBox(),
//               homeController.scoreCardModel.scoreCard != null
//                   ? Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(5),
//                         ),
//                         color: Colors.white,
//                       ),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             leading: Container(
//                               width: 50,
//                               height: 35,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.rectangle,
//                                 image: DecorationImage(
//                                     image: CachedNetworkImageProvider(
//                                       ApiEndpoints.imageMidPoint +
//                                           widget.team2ImageID +
//                                           ApiEndpoints.imageLastPoint,
//                                       headers: ApiEndpoints.headers,
//                                     ),
//                                     fit: BoxFit.fill),
//                               ),
//                             ),
//                             trailing: RichText(
//                               text: TextSpan(
//                                 text: "162-4",
//                                 style: CLTextStyle().nameTextStyle.copyWith(
//                                   fontSize: dSize(.045),
//                                   color: PublicController.pc.toggleTextColor(),
//                                 ),
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text: "(94 b) ",
//                                     style: CLTextStyle().nameTextStyle.copyWith(
//                                       fontSize: dSize(.03),
//                                       color:
//                                           PublicController.pc.toggleTextColor(),
//                                     ),
//                                   ),
//                                   // TextSpan(text: ' world!'),
//                                 ],
//                               ),
//                             ),
//                             title: RichText(
//                               text: TextSpan(
//                                 text: "NS",
//                                 style: CLTextStyle().nameTextStyle.copyWith(
//                                   fontSize: dSize(.045),
//                                   color: PublicController.pc.toggleTextColor(),
//                                 ),
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text: "  2nd Innings",
//                                     style: CLTextStyle().nameTextStyle.copyWith(
//                                       fontSize: dSize(.03),
//                                       color:
//                                           PublicController.pc.toggleTextColor(),
//                                     ),
//                                   ),
//                                   // TextSpan(text: ' world!'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: homeController
//                                   .scoreCardModel
//                                   .scoreCard![1]
//                                   .batTeamDetails!
//                                   .batsmenData!
//                                   .length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Column(
//                                   children: [
//                                     const Divider(
//                                       color: Colors.grey,
//                                       height: 1,
//                                     ),
//                                     ListTile(
//                                       trailing: RichText(
//                                         text: TextSpan(
//                                           text:
//                                               "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].runs}",
//                                           style: CLTextStyle().nameTextStyle
//                                               .copyWith(
//                                             fontSize: dSize(.03),
//                                             color: PublicController.pc
//                                                 .toggleTextColor(),
//                                           ),
//                                           children: <TextSpan>[
//                                             TextSpan(
//                                               text:
//                                                   "(${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].balls})",
//                                               style: CLTextStyle().nameTextStyle
//                                                   .copyWith(
//                                                 fontSize: dSize(.03),
//                                                 color: PublicController.pc
//                                                     .toggleTextColor(),
//                                               ),
//                                             ),
//                                             // TextSpan(text: ' world!'),
//                                           ],
//                                         ),
//                                       ),
//                                       title: Text(
//                                         "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].batName}",
//                                         style:
//                                             CLTextStyle().nameTextStyle.copyWith(
//                                           fontSize: dSize(.03),
//                                           color: PublicController.pc
//                                               .toggleTextColor(),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               }),
//                         ],
//                       ),
//                     )
//                   : SizedBox(),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Next Matches",
//                 style: CLTextStyle().nameTextStyle.copyWith(
//                   fontSize: dSize(.04),
//                   color: PublicController.pc.toggleTextColor(),
//                 ),
//               ),
//               homeController.seriesMatchListModel.matchDetails != null
//                   ? ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: homeController
//                           .seriesMatchListModel.matchDetails!.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         // print(
//                         //     "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.seriesName}");
//
//                         return homeController.seriesMatchListModel
//                                     .matchDetails![index].matchDetailsMap ==
//                                 null
//                             ? const SizedBox()
//                             : Card(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Flexible(
//                                             child: Text(
//                                               "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.matchDesc}, ${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.seriesName}",
//                                               style: CLTextStyle().nameTextStyle
//                                                   .copyWith(
//                                                 fontSize: dSize(.03),
//                                                 color: PublicController.pc
//                                                     .toggleTextColor(),
//                                               ),
//                                             ),
//                                           ),
//                                           Icon(Icons.notifications),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       IntrinsicHeight(
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Container(
//                                                       height: 30,
//                                                       width: 30,
//                                                       decoration: BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         color: Colors.white,
//                                                         image: DecorationImage(
//                                                             image:
//                                                                 CachedNetworkImageProvider(
//                                                               ApiEndpoints
//                                                                       .imageMidPoint +
//                                                                   "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team1!.imageId}" +
//                                                                   ApiEndpoints
//                                                                       .imageLastPoint,
//                                                               headers:
//                                                                   ApiEndpoints
//                                                                       .headers,
//                                                             ),
//                                                             fit: BoxFit.fill,
//                                                             filterQuality:
//                                                                 FilterQuality
//                                                                     .low),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5,
//                                                     ),
//                                                     Text(
//                                                       "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team1!.teamName}",
//                                                       style: CLTextStyle()
//                                                           .nameTextStyle
//                                                           .copyWith(
//                                                         fontSize: dSize(.03),
//                                                         color: PublicController
//                                                             .pc
//                                                             .toggleTextColor(),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Container(
//                                                       height: 30,
//                                                       width: 30,
//                                                       decoration: BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         color: Colors.white,
//                                                         image: DecorationImage(
//                                                             image:
//                                                                 CachedNetworkImageProvider(
//                                                               ApiEndpoints
//                                                                       .imageMidPoint +
//                                                                   "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team2!.imageId}" +
//                                                                   ApiEndpoints
//                                                                       .imageLastPoint,
//                                                               headers:
//                                                                   ApiEndpoints
//                                                                       .headers,
//                                                             ),
//                                                             fit: BoxFit.fill,
//                                                             filterQuality:
//                                                                 FilterQuality
//                                                                     .low),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5,
//                                                     ),
//                                                     Text(
//                                                       "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team2!.teamName}",
//                                                       style: CLTextStyle()
//                                                           .nameTextStyle
//                                                           .copyWith(
//                                                         fontSize: dSize(.03),
//                                                         color: PublicController
//                                                             .pc
//                                                             .toggleTextColor(),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(),
//                                             SizedBox(),
//                                             VerticalDivider(
//                                               width: 1,
//                                               color: Colors.black,
//                                             ),
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   "Tomorrow",
//                                                   style: CLTextStyle()
//                                                       .paragraphTextStyle
//                                                       .copyWith(
//                                                     fontSize: dSize(.03),
//                                                     color: PublicController.pc
//                                                         .toggleTextColor(),
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   "07:00 PM",
//                                                   style: CLTextStyle()
//                                                       .paragraphTextStyle
//                                                       .copyWith(
//                                                     fontSize: dSize(.03),
//                                                     color: PublicController.pc
//                                                         .toggleTextColor(),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                       })
//                   : SizedBox(),
//             ],
//           ),
//         ),
//       );
//     });
//   }
//
//   void _showSquadsSheet(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (_) => StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//               return const FractionallySizedBox(
//                 heightFactor: 2.4,
//                 child: ProgressBottomSheet(),
//               );
//             }));
//   }
// }
