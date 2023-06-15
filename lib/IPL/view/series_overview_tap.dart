import 'package:cricland/IPL/view/widgets/highest_score_&_six_card.dart';
import 'package:cricland/IPL/view/widgets/info_card_tile.dart';
import 'package:cricland/IPL/view/widgets/most_run_card.dart';
import 'package:cricland/IPL/view/widgets/most_wickets_card.dart';
import 'package:cricland/IPL/view/widgets/series_featured_match_tile.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/view/monk_view/series_state_tile.dart';
import '../../home/view/widgets/point_table_tile.dart';
import '../../public/variables/config.dart';
import 'details_view/key_state_screen.dart';

class SeriesOverViewTab extends StatefulWidget {
  final ScrollController scrollController;

  const SeriesOverViewTab({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _SeriesOverViewTabState createState() => _SeriesOverViewTabState();
}

class _SeriesOverViewTabState extends State<SeriesOverViewTab> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Container(
        color: PublicController.pc.togglePagedBg(),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
        child: NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            print(notification.metrics.pixels);

            if (notification.metrics.pixels > 50) {
              homeController.setScroll(true.obs);
            } else {
              homeController.setScroll(false.obs);
            }
            return true;
          },
          child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Featured Matches",
                          style: AppTextStyle().titleTextStyle),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "All Matches >",
                          style: AppTextStyle()
                              .titleTextStyle
                              .copyWith(color: AllColor.fbColor),
                        ),
                      )
                    ],
                  ),
                  SeriesFeaturedMatchTile(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Series Stats",
                          style: AppTextStyle().titleTextStyle),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All >",
                          style: AppTextStyle()
                              .titleTextStyle
                              .copyWith(color: AllColor.fbColor),
                        ),
                      )
                    ],
                  ),
                  const SeriesStateTile(),
                  ListView.separated(
                      itemCount: homeController.rapidSeriesMatchList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: dSize(.02)),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: SeriesFeaturedMatchTile(),
                        );
                      }),
                  ListTile(
                    leading: Text("Point Table",
                        style: AppTextStyle().largeTitleStyle.copyWith(
                              fontSize: dSize(.04),
                              color: PublicController.pc.toggleTextColor(),
                            )),
                  ),
                  const PointTableTile(),
                  ListTile(
                      leading: Text("Key Stats",
                          style: AppTextStyle().largeTitleStyle.copyWith(
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
                            style: AppTextStyle().largeTitleStyle.copyWith(
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
                      const SizedBox(
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
                        style: AppTextStyle().largeTitleStyle.copyWith(
                              fontSize: dSize(.035),
                              color: PublicController.pc.toggleTextColor(),
                            )),
                  ),
                  homeController.matchSquadModel.squads != null
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var i = 0;
                                  i <
                                      homeController
                                          .matchSquadModel.squads!.length;
                                  i++)
                                homeController.matchSquadModel.squads![i]
                                            .squadId !=
                                        null
                                    ? GestureDetector(
                                        onTap: () {
                                          _showSquadsSheet(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: PublicController.pc
                                                .toggleCardBg(),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
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
                                                        image: AssetImage(
                                                            "assets/article_land.png"),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text("Squad Type",
                                                    style: AppTextStyle()
                                                        .largeTitleStyle
                                                        .copyWith(
                                                          fontSize: dSize(.04),
                                                          color: PublicController
                                                              .pc
                                                              .toggleTextColor(),
                                                        )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  homeController.rapidSeriesMatchList.isEmpty
                      ? const SizedBox()
                      : ListTile(
                          leading: Text("Series Info",
                              style: AppTextStyle().largeTitleStyle.copyWith(
                                    fontSize: dSize(.04),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  )),
                        ),
                  homeController.rapidSeriesMatchList.isEmpty
                      ? const SizedBox()
                      : InfoCardTile(
                          series: homeController
                              .rapidSeriesMatchList.first.matchInfo!.seriesName,
                          duration: homeController
                              .rapidSeriesMatchList.first.matchInfo!.status,
                          format: homeController
                              .rapidSeriesMatchList.first.matchInfo!.matchDesc,
                          onTap: () {},
                        ),
                  const SizedBox(height: 300),
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
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 1.5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: 10,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const KeyStateScreen()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "WTC Final",
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
                                    color:
                                        PublicController.pc.toggleTextColor())),
                          ),
                        );
                      }),
                ],
              )),
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
                // child: BottomSheetScreen(playerRapidTeam: ,),
              );
            }));
  }
}
