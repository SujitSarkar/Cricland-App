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
import 'package:cricland/home/view/home_details_screen.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_info.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../more/view/icc_man_ranking/player_details/player_details.dart';
import '../../public/variables/colors.dart';

class OverViewTab extends StatefulWidget {
  const OverViewTab({Key? key}) : super(key: key);

  @override
  _OverViewTabState createState() => _OverViewTabState();
}

class _OverViewTabState extends State<OverViewTab> {
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
                      style: CLTextStyle.nameTextStyle.copyWith(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      )),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "All Matches >",
                      style: CLTextStyle.nameTextStyle.copyWith(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  )
                ],
              ),
              homeController.seriesMatchListModel.matchDetails != null
                  ? ListView.builder(
                      itemCount: homeController
                          .seriesMatchListModel.matchDetails!.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return homeController.seriesMatchListModel
                                    .matchDetails![index].matchDetailsMap !=
                                null
                            ? FeaturedMatchTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomeDetailsScreen(
                                        teamS2Name: '',
                                        teamS1Name: '',
                                        matchDesc: '',
                                        seriesID: '',
                                        winningStatus: '',
                                        team1ImageID: '',
                                        team2Over: '',
                                        team2ImageID: '',
                                        matchID: '',
                                        team1RunWicket: '',
                                        team2RunWicket: '',
                                        team1Over: '',
                                        isLive: false,
                                      ),
                                    ),
                                  );
                                },
                                leadingUrlOne:
                                    "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team1!.imageId}",
                                leadingUrlTwo:
                                    "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team2!.imageId}",
                                teamOne:
                                    "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team1!.teamSName}",
                                teamTwo:
                                    "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team2!.teamSName}",
                                wonTeam:
                                    "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.status}",
                                state:
                                    "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.matchFormat}",
                              )
                            : SizedBox();
                      })
                  : CircularProgressIndicator(),
              ListTile(
                  leading: Text("Key Stats",
                      style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      )),
                  trailing: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => KeyStateScreen(),
                        ),
                      );
                    },
                    child: Text("See All >",
                        style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        )),
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i = 0; i <= 5; i++)
                      MostRunCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => KeyStateScreen(),
                            ),
                          );
                        },
                        title: 'Most Runs',
                        playerImageUrl: 'assets/player.png',
                        playerName: 'J Buttler',
                        teamName: 'Rajasthan Royals',
                        runs: '863',
                      ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MostWicketsCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => KeyStateScreen(),
                          ),
                        );
                      },
                      title: 'Most Wickets >',
                      playerImageUrl: 'assets/player.png',
                      playerName: 'RR',
                      teamName: 'Y Chahal',
                      wickets: '27',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MostWicketsCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => KeyStateScreen(),
                          ),
                        );
                      },
                      title: 'Most Wickets >',
                      playerImageUrl: 'assets/player.png',
                      playerName: 'RR',
                      teamName: 'Y Chahal',
                      wickets: '27',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              HighestScoreSix(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => KeyStateScreen(),
                    ),
                  );
                },
                title: 'Highest Score',
                playerName: 'J Buttler',
                teamName: 'RR',
                number: '863',
                numberFor: 'Runs',
              ),
              const SizedBox(
                height: 10,
              ),
              HighestScoreSix(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => KeyStateScreen(),
                    ),
                  );
                },
                title: 'Most Sixes >',
                playerName: 'J Buttler',
                teamName: 'RR',
                number: '45',
                numberFor: 'Sixes',
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Text("Team Squads",
                    style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
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
                      homeController.matchSquadModel.squads![i].squadId != null
                          ? GestureDetector(
                              onTap: () {
                                _showSquadsSheet(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: PublicController.pc.toggleCardBg(),
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
                                                  ApiEndpoints.imageMidPoint +
                                                      "${homeController.matchSquadModel.squads![i].imageId}" +
                                                      ApiEndpoints
                                                          .imageLastPoint,
                                                  headers: ApiEndpoints.headers,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "${homeController.matchSquadModel.squads![i].squadType}",
                                            style: CLTextStyle.nameTextStyle
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
                    style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                      fontSize: dSize(.04),
                      color: PublicController.pc.toggleTextColor(),
                    )),
              ),
              homeController.seriesMatchListModel.matchDetails != null
                  ? InfoCardTile(
                      series: homeController
                          .seriesMatchListModel
                          .matchDetails!
                          .first
                          .matchDetailsMap!
                          .match!
                          .first
                          .matchInfo!
                          .seriesName!,
                      duration: homeController.seriesMatchListModel
                          .matchDetails!.first.matchDetailsMap!.key!,
                      format: homeController
                          .seriesMatchListModel
                          .matchDetails!
                          .first
                          .matchDetailsMap!
                          .match!
                          .first
                          .matchInfo!
                          .matchFormat!,
                      onTap: () {},
                    )
                  : SizedBox(),
              ListTile(
                leading: Text(
                  "More Seasons",
                  style: TextStyle(
                    fontSize: dSize(.035),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount:
                      homeController.featureSeriesModel.seriesMapProto!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => KeyStateScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          homeController.featureSeriesModel
                              .seriesMapProto![index].series!.first.name!,
                          style: TextStyle(
                            fontSize: dSize(.04),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor(),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: PublicController.pc.toggleTextColor())),
                      ),
                    );
                  }),
            ],
          ),
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
