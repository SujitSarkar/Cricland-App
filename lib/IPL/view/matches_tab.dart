import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/widgets/fixtures_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MatchesTab extends StatefulWidget {
  const MatchesTab({Key? key}) : super(key: key);

  @override
  _MatchesTabState createState() => _MatchesTabState();
}

class _MatchesTabState extends State<MatchesTab> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    homeController.seriesMatchListModel.matchDetails!.length,
                itemBuilder: (BuildContext context, int index) {
                  return homeController.seriesMatchListModel
                              .matchDetails![index].matchDetailsMap ==
                          null
                      ? SizedBox()
                      : FixturesCardTile(
                          title: homeController
                              .seriesMatchListModel
                              .matchDetails![index]
                              .matchDetailsMap!
                              .match!
                              .first
                              .matchInfo!
                              .seriesName,
                          leadingUrlOne:
                              "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team1!.imageId}",
                          leadingUrlTwo:
                              "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team2!.imageId}",
                          teamOne:
                              "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team1!.teamName}",
                          teamTwo:
                              "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team2!.teamName}",
                          reachTitleOne:
                              "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchScore!.team1Score!.inngs1!.runs}-${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchScore!.team1Score!.inngs1!.wickets}",
                          reachTitleTwo:
                              "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchScore!.team2Score!.inngs1!.runs}-${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchScore!.team2Score!.inngs1!.wickets}",
                          reachSubTitleOne:
                              "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchScore!.team1Score!.inngs1!.overs}",
                          reachSubTitleTwo:
                              "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchScore!.team2Score!.inngs1!.overs}",
                          desc:
                              "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.status}",
                          date: "",
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => HomeDetailsScreen(
                            //               matchIndex: index,
                            //               teamS1Name: '',
                            //               teamS2Name: '',
                            //               matchDesc: '',
                            //             )));
                          },
                        );
                }),
          ),
        ],
      );
    });
  }
}
