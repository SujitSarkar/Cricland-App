import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/widgets/live_cart_tile.dart';
import 'package:cricland/home/view/home_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
                                return LiveCardTile(
                                  onTap: () {
                                    // Get.to(
                                    //   HomeDetailsScreen(
                                    //     teamS2Name: '',
                                    //     teamS1Name: '',
                                    //     matchIndex: index,
                                    //     matchDesc: '',
                                    //     team1RunWicket: '',
                                    //     winningStatus: '',
                                    //     team1Over: '',
                                    //     team2Over: '',
                                    //     team2RunWicket: '',
                                    //   ),
                                    // );
                                  },
                                  title:
                                      "${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.seriesName}",
                                  leadingOvers:
                                      " ${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.seriesId}",
                                  trailingOvers:
                                      "${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.seriesId}",
                                  trailingRuns:
                                      "${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.seriesId}",
                                  trailingTeamUrl:
                                      "${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team2!.imageId}",
                                  leadingCountryName:
                                      "${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team1!.teamSName}",
                                  leadingRuns:
                                      "${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.seriesId}",
                                  needText:
                                      "${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.status}",
                                  trailingCountryName:
                                      "${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team2!.teamSName}",
                                  leadingTeamUrl:
                                      "${homeController.liveMatchesModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team1!.imageId}",
                                );
                                //LiveCart(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(child: const Text("No Match Available"));
      },
    );
  }
}
