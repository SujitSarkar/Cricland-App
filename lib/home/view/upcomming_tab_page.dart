import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/home_details_screen.dart';
import 'package:cricland/home/view/widgets/upcoming_card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
        padding: EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        child: homeController.upcomingMatchModel.typeMatches != null
            ? ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Today",
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
                                // Get.to(
                                //   HomeDetailsScreen(
                                //     matchIndex: index,
                                //     teamS2Name: '',
                                //     teamS1Name: '',
                                //     matchDesc: '',
                                //   ),
                                // );
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

                              //TODO state.Upcoming
                              status:
                                  '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.state}',
                            )
                          : const SizedBox();
                      //LiveCart(context);
                    },
                  ),
                  SizedBox(
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
