import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/details_view/live_details/live_details_screen.dart';
import 'package:cricland/home/view/widgets/live_cart_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveTabScreen extends StatefulWidget {
  const LiveTabScreen({Key? key}) : super(key: key);

  @override
  _LiveTabScreenState createState() => _LiveTabScreenState();
}

class _LiveTabScreenState extends State<LiveTabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return homeController.loading.value
            ? const Center(child: CircularProgressIndicator())
            : homeController.liveMatchesModel.typeMatches != null
                ? SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: homeController
                                  .liveMatchesModel.typeMatches!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var headerLink = homeController
                                    .liveMatchesModel
                                    .typeMatches![index]
                                    .seriesMatches!
                                    .first
                                    .seriesAdWrapper!;
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => LiveDetailsScreen(
                                            state: headerLink.matches!.first
                                                .matchInfo!.status!,
                                            teamS2Name:
                                                "${headerLink.matches!.first.matchInfo!.team2!.teamSName}",
                                            matchID:
                                                "${headerLink.matches!.first.matchInfo!.matchId}",
                                            teamS1Name:
                                                "${headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchInfo!.team1!.teamSName : headerLink.matches!.first.matchInfo!.team2!.teamSName}",
                                            matchDesc:
                                                "${headerLink.matches!.first.matchInfo!.matchDesc}",
                                            team1RunWicket:
                                                "${headerLink.matches!.first.matchScore != null ? headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.runs : headerLink.matches!.first.matchScore!.team2Score!.inngs1!.runs : ""}-${headerLink.matches!.first.matchScore != null ? headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.wickets : headerLink.matches!.first.matchScore!.team1Score!.inngs1!.wickets : ""}",
                                            winningStatus:
                                                "${headerLink.matches!.first.matchInfo!.status}",
                                            team2RunWicket:
                                                "${headerLink.matches!.first.matchScore != null ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.runs : ""}-${headerLink.matches!.first.matchScore != null ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.wickets : ""}",
                                            team1Over: headerLink.matches!.first
                                                        .matchScore !=
                                                    null
                                                ? "${headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchScore!.team1Score!.inngs1!.overs : headerLink.matches!.first.matchScore!.team2Score!.inngs1!.overs}"
                                                : "",
                                            team2Over: headerLink.matches!.first
                                                        .matchScore !=
                                                    null
                                                ? "${headerLink.matches!.first.matchScore!.team2Score!.inngs1!.overs}"
                                                : "",
                                            team1ImageID: headerLink.matches!
                                                        .first.matchScore !=
                                                    null
                                                ? "${headerLink.matches!.first.matchInfo!.currBatTeamId == headerLink.matches!.first.matchInfo!.team1!.teamId ? headerLink.matches!.first.matchInfo!.team1!.imageId : headerLink.matches!.first.matchInfo!.team2!.imageId}"
                                                : "",
                                            team2ImageID: headerLink.matches!
                                                        .first.matchScore !=
                                                    null
                                                ? "${headerLink.matches!.first.matchInfo!.team2!.imageId}"
                                                : "",
                                            seriesID: "${headerLink.seriesId}",
                                          ),
                                        ),
                                      );
                                    },
                                    child: LiveCardTile(
                                      title: "${headerLink.seriesName}",
                                      leadingOvers: headerLink
                                                  .matches!.first.matchScore !=
                                              null
                                          ? " ${headerLink.matches!.first.matchScore!.team1Score!.inngs1!.overs!}"
                                          : "",
                                      trailingOvers: headerLink
                                                  .matches!.first.matchScore !=
                                              null
                                          ? "${headerLink.matches!.first.matchScore!.team2Score!.inngs1!.overs!}"
                                          : "",
                                      trailingRuns: headerLink
                                                  .matches!.first.matchScore !=
                                              null
                                          ? "${headerLink.matches!.first.matchScore!.team2Score!.inngs1!.runs!}"
                                          : "",
                                      trailingTeamUrl:
                                          "${headerLink.matches!.first.matchInfo!.team2!.imageId}",
                                      leadingCountryName:
                                          "${headerLink.matches!.first.matchInfo!.team1!.teamSName}",
                                      leadingRuns: headerLink
                                                  .matches!.first.matchScore !=
                                              null
                                          ? "${headerLink.matches!.first.matchScore!.team1Score!.inngs1!.runs!}"
                                          : "",
                                      needText:
                                          "${headerLink.matches!.first.matchInfo!.status}",
                                      trailingCountryName:
                                          "${headerLink.matches!.first.matchInfo!.team2!.teamSName}",
                                      leadingTeamUrl:
                                          "${headerLink.matches!.first.matchInfo!.team1!.imageId}",
                                      currentBatTeam: headerLink
                                                  .matches!.first.matchScore !=
                                              null
                                          ? headerLink.matches!.first.matchInfo!
                                              .currBatTeamId!
                                          : 0,
                                      leadingTeamId: headerLink
                                                  .matches!.first.matchScore !=
                                              null
                                          ? headerLink.matches!.first.matchInfo!
                                              .team1!.teamId!
                                          : 1,
                                      trailingTeamId: headerLink
                                                  .matches!.first.matchScore !=
                                              null
                                          ? headerLink.matches!.first.matchInfo!
                                              .team2!.teamId!
                                          : 1,
                                    ));
                                //LiveCart(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(child: Text("No Match Available"));
      },
    );
  }
}
