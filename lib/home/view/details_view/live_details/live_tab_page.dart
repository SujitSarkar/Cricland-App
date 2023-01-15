import 'dart:convert';

import 'package:cricland/home/controller/home_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart';
import '../../../model/monk/monk_league_model.dart';
import 'package:cricland/public/controller/api_service.dart';

import '../../../model/monk/monk_vanue_model.dart';
class LiveTabScreen extends StatefulWidget {
  const LiveTabScreen({Key? key}) : super(key: key);

  @override
  _LiveTabScreenState createState() => _LiveTabScreenState();
}

class _LiveTabScreenState extends State<LiveTabScreen> {
  int? selectedIndex;
  double containerHeight=150;

  var leagueName;
  var venue;
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
      builder: (homeController) {
         return SingleChildScrollView(
           child: Column(
             children: [

               ListView.builder(
                         physics: const BouncingScrollPhysics(),
                         itemCount: 1,
                         shrinkWrap: true,
                         itemBuilder: (context, index) {
                           return  Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 FutureBuilder(
                                     future:  ApiService.instance.apiCall(
                                         execute: () async {
                                           return   await ApiService.instance
                                               .getWithoutHeader(ApiEndpoints.monkLeague+"3"+ApiEndpoints.monkAPIToken);
                                         },
                                         onSuccess: (response) {

                                           return
                                           setState((){
                                             leagueName = response["data"]["name"];

                                           });
                                         },
                                         onError: (error) {
                                           print(error.toString());

                                         }),
                                     builder: (context, snapshot) {
                                       return Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Row(
                                             children:  [
                                               Icon(Icons.pin_end),
                                               Text(" $leagueName"),
                                             ],
                                           ),
                                           IconButton(onPressed: (){
                                             setState(() {
                                               selectedIndex = index;

                                               // containerHeight==150?containerHeight=0: containerHeight==150;
                                             });
                                           }, icon: Icon(selectedIndex==index?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined),)

                                         ],
                                       );
                                     }
                                 ),
                                 AnimatedContainer(
                                   duration: const Duration(microseconds: 100),
                                   height: selectedIndex ==index?containerHeight:0,
                                   child: Card(
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           FutureBuilder(
                                             future: homeController.getMonkVanue("9"),

                                             // ApiService.instance.apiCall(
                                             //     execute: () async {
                                             //       return   await ApiService.instance
                                             //           .getWithoutHeader(ApiEndpoints.monkVanue+"9"+ApiEndpoints.monkAPIToken);
                                             //     },
                                             //     onSuccess: (response) {
                                             //
                                             //       return
                                             //         setState((){
                                             //           leagueName = response["data"]["name"];
                                             //
                                             //         });
                                             //     },
                                             //     onError: (error) {
                                             //       print(error.toString());
                                             //
                                             //     }),
                                             builder: (context, snapshot) {
                                               print("Snap Data: ${(snapshot.hasData)}");
                                               if(snapshot.hasData){
                                                 return Text("snapshot.data");
                                               }
                                               else{
                                                 return CircularProgressIndicator();
                                               }
                                             }
                                           ),
                                           IntrinsicHeight(
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Column(
                                                   children: [
                                                     Row(
                                                       children: const [
                                                         Icon(Icons.ice_skating),
                                                         Text("WEL 102-6 15.1"),
                                                         Icon(Icons.sports_cricket),
                                                       ],
                                                     ),

                                                     Row(
                                                       children: const [
                                                         Icon(Icons.ice_skating),
                                                         Text("WEL 102-6 15.1"),
                                                         Icon(Icons.sports_cricket),
                                                       ],
                                                     ),

                                                   ],
                                                 ),
                                                 const VerticalDivider(
                                                   width: 5,
                                                   color: Colors.red,
                                                   thickness: 2,
                                                 ),
                                                 Padding(
                                                   padding: const EdgeInsets.all(18.0),
                                                   child: Row(
                                                     children: const [
                                                       Icon(Icons.do_not_disturb_on_total_silence),
                                                       Text("Live"),
                                                     ],
                                                   ),
                                                 )
                                               ],
                                             ),
                                           ),
                                           const Text("OTG opt to bowl"),
                                         ],),
                                     ),),
                                 )
                               ],
                             ),
                           );
                }),
             ],
           ),
         );

            // homeController.loading.value
            //   ? const Center(child: CircularProgressIndicator())
            //   : homeController.liveMatchesModel.typeMatches != null
            //       ? SingleChildScrollView(
            //           child: Container(
            //             decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.only(
            //                 topRight: Radius.circular(50),
            //                 topLeft: Radius.circular(50),
            //               ),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   const SizedBox(
            //                     height: 5,
            //                   ),
            //                   ListView.builder(
            //                     physics: const BouncingScrollPhysics(),
            //                     itemCount: homeController
            //                         .liveMatchesModel.typeMatches!.length,
            //                     shrinkWrap: true,
            //                     itemBuilder: (context, index) {
            //                       var headerLink = homeController
            //                           .liveMatchesModel
            //                           .typeMatches![index]
            //                           .seriesMatches!
            //                           .first
            //                           .seriesAdWrapper!;
            //                       return GestureDetector(
            //                           onTap: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                 builder: (_) => LiveDetailsScreen(
            //                                   state: headerLink.matches!.first
            //                                       .matchInfo!.status!,
            //                                   teamS2Name:
            //                                       "${headerLink.matches!.first.matchInfo!.team2!.teamSName}",
            //                                   matchID:
            //                                       "${headerLink.matches!.first.matchInfo!.matchId}",
            //                                   teamS1Name:
            //                                       "${headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchInfo!.team1!.teamSName : headerLink.matches!.first.matchInfo!.team2!.teamSName}",
            //                                   matchDesc:
            //                                       "${headerLink.matches!.first.matchInfo!.matchDesc}",
            //                                   team1RunWicket:
            //                                       "${headerLink.matches!.first.matchScore != null ? headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.runs : headerLink.matches!.first.matchScore!.team2Score!.inngs1!.runs : ""}-${headerLink.matches!.first.matchScore != null ? headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.wickets : headerLink.matches!.first.matchScore!.team1Score!.inngs1!.wickets : ""}",
            //                                   winningStatus:
            //                                       "${headerLink.matches!.first.matchInfo!.status}",
            //                                   team2RunWicket:
            //                                       "${headerLink.matches!.first.matchScore != null ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.runs : ""}-${headerLink.matches!.first.matchScore != null ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.wickets : ""}",
            //                                   team1Over: headerLink.matches!.first
            //                                               .matchScore !=
            //                                           null
            //                                       ? "${headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.overs : headerLink.matches!.first.matchScore!.team2Score!.inngs1!.overs}"
            //                                       : "",
            //                                   team2Over: headerLink.matches!.first
            //                                               .matchScore !=
            //                                           null
            //                                       ? "${headerLink.matches!.first.matchScore!.team2Score!.inngs1!.overs}"
            //                                       : "",
            //                                   team1ImageID: headerLink.matches!
            //                                               .first.matchScore !=
            //                                           null
            //                                       ? "${headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchInfo!.team1!.imageId : headerLink.matches!.first.matchInfo!.team2!.imageId}"
            //                                       : "",
            //                                   team2ImageID: headerLink.matches!
            //                                               .first.matchScore !=
            //                                           null
            //                                       ? "${headerLink.matches!.first.matchInfo!.team2!.imageId}"
            //                                       : "",
            //                                   seriesID: "${headerLink.seriesId}",
            //                                 ),
            //                               ),
            //                             );
            //                           },
            //                           child: LiveCardTile(
            //                             title: "${headerLink.seriesName}",
            //                             leadingOvers: headerLink
            //                                         .matches!.first.matchScore !=
            //                                     null
            //                                 ? " ${headerLink.matches!.first.matchScore!.team1Score!.inngs1!.overs!}"
            //                                 : "",
            //                             trailingOvers: headerLink
            //                                         .matches!.first.matchScore !=
            //                                     null
            //                                 ? "${headerLink.matches!.first.matchScore!.team2Score!.inngs1!.overs!}"
            //                                 : "",
            //                             trailingRuns: headerLink
            //                                         .matches!.first.matchScore !=
            //                                     null
            //                                 ? "${headerLink.matches!.first.matchScore!.team2Score!.inngs1!.runs!}"
            //                                 : "",
            //                             trailingTeamUrl:
            //                                 "${headerLink.matches!.first.matchInfo!.team2!.imageId}",
            //                             leadingCountryName:
            //                                 "${headerLink.matches!.first.matchInfo!.team1!.teamSName}",
            //                             leadingRuns: headerLink
            //                                         .matches!.first.matchScore !=
            //                                     null
            //                                 ? "${headerLink.matches!.first.matchScore!.team1Score!.inngs1!.runs!}"
            //                                 : "",
            //                             needText:
            //                                 "${headerLink.matches!.first.matchInfo!.status}",
            //                             trailingCountryName:
            //                                 "${headerLink.matches!.first.matchInfo!.team2!.teamSName}",
            //                             leadingTeamUrl:
            //                                 "${headerLink.matches!.first.matchInfo!.team1!.imageId}",
            //                             currentBatTeam: headerLink
            //                                         .matches!.first.matchScore !=
            //                                     null
            //                                 ? headerLink.matches!.first.matchInfo!
            //                                     .currBatTeamId!
            //                                 : 0,
            //                             leadingTeamId: headerLink
            //                                         .matches!.first.matchScore !=
            //                                     null
            //                                 ? headerLink.matches!.first.matchInfo!
            //                                     .team1!.teamId!
            //                                 : 1,
            //                             trailingTeamId: headerLink
            //                                         .matches!.first.matchScore !=
            //                                     null
            //                                 ? headerLink.matches!.first.matchInfo!
            //                                     .team2!.teamId!
            //                                 : 1,
            //                           ));
            //                       //LiveCart(context);
            //                     },
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         )
            //       : const Center(child: Text("No Match Available"));
        },

    );
  }
  Widget vanueTile(MonkVanueModel? vanueModel){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        FittedBox(child: Text(" ${vanueModel!.data!.city}}",style: TextStyle(fontSize: 12 ),),),
        Icon(Icons.pin_drop),
      ],
    );

  }
}
