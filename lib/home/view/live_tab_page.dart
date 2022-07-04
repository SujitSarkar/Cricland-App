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
    return GetBuilder<HomeController>(builder: (homeController) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                homeController.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeController.liveMatchModel.result!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return LiveCardTile(
                            onTap: () {
                              Get.to(HomeDetailsScreen(
                                appBarTitle:
                                    "${homeController.liveMatchModel.result![index].leagueName}",
                              ));
                            },
                            title:
                                "${homeController.liveMatchModel.result![index].leagueName}",
                            leadingOvers:
                                "  ${homeController.liveMatchModel.result![index].eventServiceHome}",
                            trailingOvers:
                                "${homeController.liveMatchModel.result![index].eventServiceAway}",
                            trailingRuns:
                                "${homeController.liveMatchModel.result![index].eventAwayFinalResult}",
                            trailingTeamUrl: homeController.liveMatchModel
                                    .result![index].eventAwayTeamLogo ??
                                "https://picsum.photos/200/300",
                            leadingCountryName:
                                "${homeController.liveMatchModel.result![index].eventHomeTeam}",
                            leadingRuns:
                                "${homeController.liveMatchModel.result![index].eventHomeFinalResult}",
                            needText:
                                "${homeController.liveMatchModel.result![index].eventStatusInfo}",
                            trailingCountryName:
                                "${homeController.liveMatchModel.result![index].eventAwayTeam}",
                            leadingTeamUrl: homeController.liveMatchModel
                                    .result![index].eventHomeTeamLogo ??
                                "https://picsum.photos/200/300",
                          );
                          //LiveCart(context);
                        },
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
