import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/over_summery_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../public/controller/api_endpoints.dart';
import '../../../../../public/controller/public_controller.dart';
import '../../../../../public/variables/config.dart';
import '../../../../../public/variables/variable.dart';
import '../../../../../public/widgets/app_text_style.dart';
import '../../../../../public/widgets/decoration.dart';
import '../../../../model/rapid_model/recent_match_model.dart';

class TeamInfoScreen extends StatefulWidget {
  final RapidTeam team;
  const TeamInfoScreen({Key? key,required this.team}) : super(key: key);

  @override
  State<TeamInfoScreen> createState() => _TeamInfoScreenState();
}

class _TeamInfoScreenState extends State<TeamInfoScreen>   with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: Variables.playerDetails.length,
        vsync: this);
    // fetchTabData();
    //
    // print("Match ID : ${widget.rapidMatch.matchInfo!.matchId}");

    // fetchData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              flexibleSpace: Container(decoration: StDecoration().sliverAppbarGradient),
              elevation: 0,
              // title:innerBoxIsScrolled? const SizedBox(): RichText(
              //   text: TextSpan(
              //     text: "{widget.rapidMatch.matchInfo!.team1!.teamSName}",
              //     style: AppTextStyle().largeTitleStyle.copyWith(color: Colors.white),
              //     children: const <TextSpan>[
              //       TextSpan(
              //           text: '  VS  ',
              //           style: TextStyle(fontWeight: FontWeight.normal)),
              //       TextSpan(
              //         text: "{widget.rapidMatch.matchInfo!.team2!.teamSName}",
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       TextSpan(
              //         text: ", {widget.rapidMatch.matchInfo!.matchDesc}",
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
              // actions: [
              //   innerBoxIsScrolled? const SizedBox(): const Icon(
              //     Icons.push_pin_outlined,
              //     color: Colors.white,
              //   ),
              //   innerBoxIsScrolled? const SizedBox():   const Icon(
              //     Icons.settings,
              //     color: Colors.white,
              //   ),
              // ],
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(dSize(.47 )),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: StDecoration().sliverAppbarGradient,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,

                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    ApiEndpoints.imageMidPoint +
                                        "${widget.team.imageId}" +
                                        ApiEndpoints.imageLastPoint,
                                    headers: ApiEndpoints.headers,
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         SizedBox(
                          //           width: 10,
                          //         ),
                          //         GestureDetector(
                          //           onTap: (){
                          //             Navigator.push(context, MaterialPageRoute(builder: (_)=>TeamInfoScreen(),),);
                          //           },
                          //           child: Container(
                          //             height: 40,
                          //             width: 40,
                          //             decoration: BoxDecoration(
                          //               shape: BoxShape.circle,
                          //               image: DecorationImage(
                          //                   image: CachedNetworkImageProvider(
                          //                     ApiEndpoints.imageMidPoint +
                          //                         "{widget.rapidMatch.matchInfo!.team1!.imageId}" +
                          //                         ApiEndpoints.imageLastPoint,
                          //                     headers: ApiEndpoints.headers,
                          //                   ),
                          //                   fit: BoxFit.fill),
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           width: 10,
                          //         ),
                          //         Column(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Text("${widget.rapidMatch.matchInfo!.team1!.teamSName}",
                          //                 style: AppTextStyle().largeTitleStyle.copyWith(
                          //                   color: Colors.white,
                          //                   fontSize: dSize(.05),
                          //                 )),
                          //             widget.rapidMatch.matchScore != null?     RichText(
                          //               text: TextSpan(
                          //                 text: "${widget.rapidMatch.matchScore!.team1Score!.inngs1!.runs}-${widget.rapidMatch.matchScore!.team1Score!.inngs1!.wickets}",
                          //                 style: AppTextStyle().paragraphTextStyle.copyWith(
                          //                     fontSize: dSize(.03), color: Colors.white),
                          //                 children: <TextSpan>[
                          //                   TextSpan(
                          //                     text: " (${widget.rapidMatch.matchScore!.team1Score!.inngs1!.overs})",
                          //                     style: AppTextStyle().paragraphTextStyle
                          //                         .copyWith(
                          //                         fontSize: dSize(.025),
                          //                         color: Colors.white),
                          //                   ),
                          //                   // TextSpan(text: ' world!'),
                          //                 ],
                          //               ),
                          //             ):SizedBox(),
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //     Icon(
                          //       Icons.bolt,
                          //       color: Colors.white,
                          //     ),
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         Column(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           crossAxisAlignment: CrossAxisAlignment.end,
                          //           children: [
                          //             Text(
                          //               "${widget.rapidMatch.matchInfo!.team2!.teamSName}",
                          //               style: AppTextStyle().largeTitleStyle.copyWith(
                          //                 color: Colors.white,
                          //                 fontSize: dSize(.05),
                          //               ),
                          //             ),
                          //             widget.rapidMatch.matchScore != null?     RichText(
                          //               text: TextSpan(
                          //                 text: "(${widget.rapidMatch.matchScore!.team2Score!.inngs1!.overs}) ",
                          //                 style: AppTextStyle().paragraphTextStyle.copyWith(
                          //                   color: Colors.white,
                          //                   fontSize: dSize(.025),
                          //                 ),
                          //                 children: <TextSpan>[
                          //                   TextSpan(
                          //                     text: "${widget.rapidMatch.matchScore!.team2Score!.inngs1!.runs}-${widget.rapidMatch.matchScore!.team2Score!.inngs1!.wickets}",
                          //                     style:
                          //                     AppTextStyle().paragraphTextStyle.copyWith(
                          //                       color: Colors.white,
                          //                       fontSize: dSize(.04),
                          //                     ),
                          //                   ),
                          //                   // TextSpan(text: ' world!'),
                          //                 ],
                          //               ),
                          //             ):SizedBox(),
                          //           ],
                          //         ),
                          //         SizedBox(
                          //           width: 10,
                          //         ),
                          //         Container(
                          //           height: 40,
                          //           width: 40,
                          //           decoration: BoxDecoration(
                          //             shape: BoxShape.circle,
                          //             image: DecorationImage(
                          //                 image: CachedNetworkImageProvider(
                          //                   ApiEndpoints.imageMidPoint +
                          //                       "${widget.rapidMatch.matchInfo!.team2!.imageId}" +
                          //                       ApiEndpoints.imageLastPoint,
                          //                   headers: ApiEndpoints.headers,
                          //                 ),
                          //                 fit: BoxFit.fill),
                          //           ),
                          //         ),
                          //         const SizedBox(
                          //           width: 10,
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        ApiEndpoints.imageMidPoint +
                                            "${widget.team.imageId}" +
                                            ApiEndpoints.imageLastPoint,
                                        headers: ApiEndpoints.headers,
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                "${widget.team.teamName}",
                                style: AppTextStyle().largeTitleStyle
                                    .copyWith(color: Colors.orange, fontSize: 15),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    TabBar(
                      onTap: (covariant) async {
                        final prefs = await SharedPreferences.getInstance();
                        setState(() => _tabController.index = covariant);
                        await prefs.setInt("tabIndex", _tabController.index);
                      },
                      isScrollable: true,
                      controller: _tabController,
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(dSize(.02)),
                              topRight: Radius.circular(dSize(.02))),
                          color: PublicController.pc.toggleTabColor()),
                      unselectedLabelColor: Colors.white70,
                      indicatorSize: TabBarIndicatorSize.label,
                      physics: const BouncingScrollPhysics(),
                      tabs: Variables.playerDetails.map<Widget>((String item) {
                        print(item);

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: dSize(.01), horizontal: dSize(.02)),
                          child: Text(
                            item,
                          ),
                        );
                      }).toList(),
                    ),

                  ],
                ),
              ),

            ),
          ];

        }, body: Container(),
        // body:
        // Column(
        //   children: [
        //
        //     Expanded(
        //       child: TabBarView(
        //         controller: _tabController,
        //         children: <Widget>[
        //           InfoView(
        //
        //             rapidMatch: widget.rapidMatch,
        //           ),
        //           CommentaryView(
        //             matchId:"${widget.rapidMatch.matchInfo!.matchId}",
        //           ),
        //           LiveView(
        //             team1ImageID: "${widget.rapidMatch.matchInfo!.team1!.imageId}",
        //             team2ImageID: "${widget.rapidMatch.matchInfo!.team2!.imageId}",
        //             matchId: "${widget.rapidMatch.matchInfo!.matchId}",
        //             state: '',
        //           ),
        //           ScoreCardView(
        //             matchId: "${widget.rapidMatch.matchInfo!.matchId}",
        //           ),
        //           PointTableView(
        //             matchId: "${widget.rapidMatch.matchInfo!.matchId}",
        //             seriesId: "${widget.rapidMatch.matchInfo!.seriesId}",
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),





    );
  }
}
