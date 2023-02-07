import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/details_view/key_state_screen.dart';
import 'package:cricland/IPL/view/matches_tab.dart';
import 'package:cricland/IPL/view/squad_bottom_sheet_screen.dart';
import 'package:cricland/IPL/view/widgets/featured_match_tile.dart';
import 'package:cricland/IPL/view/widgets/highest_score_&_six_card.dart';
import 'package:cricland/IPL/view/widgets/info_card_tile.dart';
import 'package:cricland/IPL/view/widgets/most_run_card.dart';
import 'package:cricland/IPL/view/widgets/most_wickets_card.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/details_view/home_details/home_details_screen.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_info_man.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../home/view/widgets/point_table_tile.dart';
import '../../more/view/icc_man_ranking/player_details/player_details_man.dart';
import '../../public/variables/colors.dart';

class OverViewTab extends StatefulWidget {


  const OverViewTab({Key? key}) : super(key: key);

  @override
  _OverViewTabState createState() => _OverViewTabState();
}

class _OverViewTabState extends State<OverViewTab> {
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Featured Matches",
                            style: CLTextStyle().nameTextStyle.copyWith(
                              fontSize: dSize(.04),
                              color: PublicController.pc.toggleTextColor(),
                            )),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "All Matches >",
                            style: CLTextStyle().nameTextStyle.copyWith(
                              fontSize: dSize(.04),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        )
                      ],
                    ),
                 ListView.builder(
                            itemCount: homeController
                                .rapidSeriesMatchList.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return  GestureDetector(
                                onTap: (){
                                  print(homeController
                                      .rapidSeriesMatchList[index].matchInfo!.team1!.imageId!);
                                },
                                child: FeaturedMatchTile(
                                  seriesMatch:homeController
                                      .rapidSeriesMatchList[index]),
                              );

                            }),
                    ListTile(
                      leading: Text("Point Table",
                          style:
                          CLTextStyle().paragraphHeadLineTextStyle.copyWith(
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          )),
                    ),
                    PointTableTile(

                    ),
                    // ListTile(
                    //     leading: Text("Key Stats",
                    //         style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
                    //           fontSize: dSize(.04),
                    //           color: PublicController.pc.toggleTextColor(),
                    //         )),
                    //     trailing: TextButton(
                    //       onPressed: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (_) => KeyStateScreen(),
                    //           ),
                    //         );
                    //       },
                    //       child: Text("See All >",
                    //           style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
                    //             fontSize: dSize(.04),
                    //             color: PublicController.pc.toggleTextColor(),
                    //           )),
                    //     )),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       for (var i = 0; i <= 5; i++)
                    //         MostRunCard(
                    //           onTap: () {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (_) => KeyStateScreen(),
                    //               ),
                    //             );
                    //           },
                    //           title: 'Most Runs',
                    //           playerImageUrl: 'assets/player.png',
                    //           playerName: 'J Buttler',
                    //           teamName: 'Rajasthan Royals',
                    //           runs: '863',
                    //         ),
                    //     ],
                    //   ),
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: MostWicketsCard(
                    //         onTap: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (_) => KeyStateScreen(),
                    //             ),
                    //           );
                    //         },
                    //         title: 'Most Wickets >',
                    //         playerImageUrl: 'assets/player.png',
                    //         playerName: 'RR',
                    //         teamName: 'Y Chahal',
                    //         wickets: '27',
                    //       ),
                    //     ),
                    //   const  SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //       child: MostWicketsCard(
                    //         onTap: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (_) => KeyStateScreen(),
                    //             ),
                    //           );
                    //         },
                    //         title: 'Most Wickets >',
                    //         playerImageUrl: 'assets/player.png',
                    //         playerName: 'RR',
                    //         teamName: 'Y Chahal',
                    //         wickets: '27',
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // HighestScoreSix(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (_) => KeyStateScreen(),
                    //       ),
                    //     );
                    //   },
                    //   title: 'Highest Score',
                    //   playerName: 'J Buttler',
                    //   teamName: 'RR',
                    //   number: '863',
                    //   numberFor: 'Runs',
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // HighestScoreSix(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (_) => KeyStateScreen(),
                    //       ),
                    //     );
                    //   },
                    //   title: 'Most Sixes >',
                    //   playerName: 'J Buttler',
                    //   teamName: 'RR',
                    //   number: '45',
                    //   numberFor: 'Sixes',
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    ListTile(
                      leading: Text("Team Squads",
                          style:
                              CLTextStyle().paragraphHeadLineTextStyle.copyWith(
                            fontSize: dSize(.035),
                            color: PublicController.pc.toggleTextColor(),
                          )),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0;
                              i < homeController.matchSquadModel.squads!.length;
                              i++)
                            homeController.matchSquadModel.squads![i].squadId !=
                                    null
                                ? GestureDetector(
                                    onTap: () {
                                      _showSquadsSheet(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: PublicController.pc
                                              .toggleCardBg(),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(28.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        ApiEndpoints
                                                                .imageMidPoint +
                                                            "${homeController.matchSquadModel.squads![i].imageId}" +
                                                            ApiEndpoints
                                                                .imageLastPoint,
                                                        headers: ApiEndpoints
                                                            .headers,
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  "${homeController.matchSquadModel.squads![i].squadType}",
                                                  style: CLTextStyle()
                                                      .nameTextStyle
                                                      .copyWith(
                                                    fontSize: dSize(.04),
                                                    color: PublicController.pc
                                                        .toggleTextColor(),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text("Series Info",
                          style:
                              CLTextStyle().paragraphHeadLineTextStyle.copyWith(
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          )),
                    ),
                InfoCardTile(
                            series: homeController
                                .rapidSeriesMatchList.first.matchInfo!.seriesName,
                            duration: homeController
                                .rapidSeriesMatchList.first.matchInfo!.status,
                            format: homeController
                                .rapidSeriesMatchList.first.matchInfo!.matchDesc,
                            onTap: () {},
                          ),

                    SizedBox(height: 300,)
                    // ListTile(
                    //   leading: Text(
                    //     "More Seasons",
                    //     style: TextStyle(
                    //       fontSize: dSize(.035),
                    //       fontWeight: FontWeight.w500,
                    //       color: PublicController.pc.toggleTextColor(),
                    //     ),
                    //   ),
                    // ),
                    // GridView.builder(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     gridDelegate:
                    //         const SliverGridDelegateWithMaxCrossAxisExtent(
                    //             maxCrossAxisExtent: 200,
                    //             childAspectRatio: 3 / 1.5,
                    //             crossAxisSpacing: 10,
                    //             mainAxisSpacing: 10),
                    //     itemCount: homeController
                    //         .featureSeriesModel.seriesMapProto!.length,
                    //     itemBuilder: (BuildContext ctx, index) {
                    //       return GestureDetector(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (_) => KeyStateScreen()));
                    //         },
                    //         child: Container(
                    //           alignment: Alignment.center,
                    //           child: Text(
                    //             homeController.featureSeriesModel
                    //                 .seriesMapProto![index].series!.first.name!,
                    //             style: TextStyle(
                    //               fontSize: dSize(.04),
                    //               fontWeight: FontWeight.w500,
                    //               color: PublicController.pc.toggleTextColor(),
                    //             ),
                    //             textAlign: TextAlign.center,
                    //           ),
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(15),
                    //               border: Border.all(
                    //                   color: PublicController.pc
                    //                       .toggleTextColor())),
                    //         ),
                    //       );
                    //     }),
                  ],
                )

        ),
      );
    });
  }

  void _showSquadsSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return const FractionallySizedBox(
                heightFactor: 2.3,
                child: BottomSheetScreen(),
              );
            }));
  }
}
