import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/details_view/home_details/home_details_screen.dart';
import 'package:cricland/home/view/widgets/upcoming_card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'upcoming_details_screen.dart';

class UpComingTabScreen extends StatefulWidget {
  const UpComingTabScreen({Key? key}) : super(key: key);

  @override
  _UpComingTabScreenState createState() => _UpComingTabScreenState();
}

class _UpComingTabScreenState extends State<UpComingTabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        child: homeController.upcomingMatchModel.typeMatches != null
            ? ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Today",
                    style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
                      fontSize: dSize(.045),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.upcomingMatchModel.typeMatches!
                        .first.seriesMatches!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return homeController
                                  .upcomingMatchModel
                                  .typeMatches!
                                  .first
                                  .seriesMatches![index]
                                  .seriesAdWrapper !=
                              null
                          ? UpcomingCardTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => UpcomingDetailsScreen(
                                      selectedIndex: index,
                                      startDate:
                                          "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.startDate}",
                                      teamS2Name:
                                          "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.teamSName}",
                                      matchID:
                                          "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchId}",
                                      teamS1Name:
                                          "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.teamSName}",
                                      matchDesc:
                                          "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchDesc}",
                                      team1ImageID:
                                          "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.imageId}",
                                      team2ImageID:
                                          "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.imageId}",
                                      seriesID:
                                          "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.seriesId}",
                                    ),
                                  ),
                                );

                              },
                              title:
                                  "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.seriesName}",
                              rightCountryURL:
                                  '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.team2!.imageId}',
                              leftCountryURL:
                                  '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.team1!.imageId}',
                              leftCountryName:
                                  '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.team1!.teamSName}',
                              rightCountryName:
                                  '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.team2!.teamSName}',
                              startTime:
                                  '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.startDate}',
                              status:
                                  '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.state}'.split(".")[1],
                            )
                          : const SizedBox();
                      //LiveCart(context);
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              )
            : const Center(
                child: Text("No Match available"),
              ),
      );
    });
  }
}
