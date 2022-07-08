import 'package:cricland/home/controller/home_controller.dart';

import 'package:cricland/home/view/widgets/finished_card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'home_details_screen.dart';

class FinishedTabScreen extends StatefulWidget {
  const FinishedTabScreen({Key? key}) : super(key: key);

  @override
  _FinishedTabScreenState createState() => _FinishedTabScreenState();
}

class _FinishedTabScreenState extends State<FinishedTabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return homeController.recentMatchModel.typeMatches != null
          ? Container(
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
                  Text(
                    "Yesterday",
                    style: TextStyle(
                        fontSize: dSize(.045),
                        fontWeight: FontWeight.w500,
                        color: PublicController.pc.toggleTextColor()),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        homeController.recentMatchModel.typeMatches!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return FinishedCardTile(
                        onTap: () {
                          Get.to(
                            HomeDetailsScreen(
                              appBarTitle: 'IPL 2022',
                              teamS2Name: '',
                              matchIndex: index,
                              stateTitle: '',
                              team2Name: '',
                              teamS1Name: '',
                              team1Name: '',
                            ),
                          );
                        },
                        title:
                            "${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.seriesName}",
                        onStaticTap: () {},
                        leftCountryName:
                            '${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team1!.teamSName}',
                        leftCountryOvers:
                            "${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchScore!.team1Score!.inngs1!.overs}",
                        leftCountryRuns:
                            '${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchScore!.team1Score!.inngs1!.runs}/${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchScore!.team1Score!.inngs1!.wickets}',
                        leftCountryURL:
                            '${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team1!.imageId}',
                        trailingWidget: 'Upcoming',
                        rightCountryName:
                            '${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team2!.teamSName}',
                        rightCountryOvers:
                            "${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchScore!.team2Score!.inngs1!.overs}",
                        rightCountryRuns:
                            '${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchScore!.team2Score!.inngs1!.runs}/${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchScore!.team2Score!.inngs1!.wickets}',
                        rightCountryURL:
                            '${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team2!.imageId}',
                        wonStatus:
                            '${homeController.recentMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.status}',
                      );
                      //LiveCart(context);
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ))
          : Center(child: const Text("No Match Available"));
    });
  }
}
