import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/widgets/finished_card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/upcoming_card_tile.dart';
import '../home_details/home_details_screen.dart';

class FinishedTabScreen extends StatefulWidget {
  const FinishedTabScreen({Key? key}) : super(key: key);

  @override
  _FinishedTabScreenState createState() => _FinishedTabScreenState();
}

class _FinishedTabScreenState extends State<FinishedTabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Container(
              padding: EdgeInsets.all(5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.rapidRecentList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){


                        },
                        child: FinishedCardTile(
                          rapidMatch: homeController.rapidRecentList[index],
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (_) => UpcomingDetailsScreen(
                          //         selectedIndex: index,
                          //         startDate:
                          //             "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.startDate}",
                          //         teamS2Name:
                          //             "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.teamSName}",
                          //         matchID:
                          //             "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchId}",
                          //         teamS1Name:
                          //             "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.teamSName}",
                          //         matchDesc:
                          //             "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchDesc}",
                          //         team1ImageID:
                          //             "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.imageId}",
                          //         team2ImageID:
                          //             "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.imageId}",
                          //         seriesID:
                          //             "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.seriesId}",
                          //       ),
                          //     ),
                          //   );
                          //
                          // },

                        ),
                      );
                    },
                  ),
                  // ListView.builder(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount:
                  //       homeController.recentMatchModel.typeMatches!.length,
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) {
                  //     var path = homeController
                  //         .recentMatchModel
                  //         .typeMatches![index]
                  //         .seriesMatches!
                  //         .first
                  //         .seriesAdWrapper!;
                  //     return homeController.recentMatchModel.typeMatches![index]
                  //                 .seriesMatches !=
                  //             null
                  //         ? FinishedCardTile(
                  //             onTap: () {
                  //               Get.to(
                  //                 HomeDetailsScreen(
                  //                   teamS2Name:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.teamSName}",
                  //                   matchID:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchId}",
                  //                   teamS1Name:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.teamSName}",
                  //                   matchDesc:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchDesc}",
                  //                   team1RunWicket:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team1Score!.inngs1!.runs}-${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team1Score!.inngs1!.wickets}",
                  //                   winningStatus:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.status}",
                  //                   team2RunWicket:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team2Score!.inngs1!.runs}-${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team2Score!.inngs1!.wickets}",
                  //                   team1Over:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team1Score!.inngs1!.overs}",
                  //                   team2Over:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team2Score!.inngs1!.overs}",
                  //                   team1ImageID:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.imageId}",
                  //                   team2ImageID:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.imageId}",
                  //                   seriesID:
                  //                       "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.seriesId}",
                  //                 ),
                  //               );
                  //             },
                  //             title: "${path.seriesName}",
                  //             onStaticTap: () {},
                  //             leftCountryName:
                  //                 '${path.matches!.first.matchInfo!.team1!.teamSName}',
                  //             leftCountryOvers: path
                  //                         .matches!.first.matchScore !=
                  //                     null
                  //                 ? "${path.matches!.first.matchScore!.team1Score!.inngs1!.overs}"
                  //                 : "",
                  //             leftCountryRuns: path.matches!.first.matchScore !=
                  //                     null
                  //                 ? '${path.matches!.first.matchScore!.team1Score!.inngs1!.runs}/${path.matches!.first.matchScore!.team1Score!.inngs1!.wickets}'
                  //                 : "",
                  //             leftCountryURL: path.matches!.first.matchScore !=
                  //                     null
                  //                 ? '${path.matches!.first.matchInfo!.team1!.imageId}'
                  //                 : "",
                  //             trailingWidget: 'Upcoming',
                  //             rightCountryName: path
                  //                         .matches!.first.matchScore !=
                  //                     null
                  //                 ? '${path.matches!.first.matchInfo!.team2!.teamSName}'
                  //                 : "",
                  //             rightCountryOvers: path
                  //                         .matches!.first.matchScore !=
                  //                     null
                  //                 ? "${path.matches!.first.matchScore!.team2Score!.inngs1!.overs}"
                  //                 : "",
                  //             rightCountryRuns: path
                  //                         .matches!.first.matchScore !=
                  //                     null
                  //                 ? '${path.matches!.first.matchScore!.team2Score!.inngs1!.runs}/${path.matches!.first.matchScore!.team2Score!.inngs1!.wickets}'
                  //                 : "",
                  //             rightCountryURL: path.matches!.first.matchScore !=
                  //                     null
                  //                 ? '${path.matches!.first.matchInfo!.team2!.imageId}'
                  //                 : "",
                  //             wonStatus: path.matches!.first.matchScore != null
                  //                 ? '${path.matches!.first.matchInfo!.status}'
                  //                 : "",
                  //           )
                  //         : const SizedBox();
                  //     //LiveCart(context);
                  //   },
                  // ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ));
    });
  }
}
