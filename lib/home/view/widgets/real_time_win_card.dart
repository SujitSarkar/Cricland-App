import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../controller/home_controller.dart';
import '../../model/custom_widget/constants.dart';

class LiveWinCardTile extends StatelessWidget {
  final int selectedIndex;
  const LiveWinCardTile({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return GestureDetector(
        onTap: onTap,
        child: Card(
          color: PublicController.pc.toggleCardBg(),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![selectedIndex].seriesAdWrapper!.matches![0].matchInfo!.team1!.teamSName}",
                      style: CLTextStyle().nameTextStyle,
                    ),
                    Text(
                      "43%",
                      style: CLTextStyle().paragraphTextStyle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Realtime Win %",
                      style: CLTextStyle().paragraphHeadLineTextStyle,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * .6,
                        lineHeight: 14.0,
                        percent: 0.5,
                        animation: true,
                        center: Text(
                          "50.0%",
                          style: CLTextStyle().paragraphTextStyle
                              .copyWith(fontSize: 10),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![selectedIndex].seriesAdWrapper!.matches![0].matchInfo!.team2!.teamSName}",
                      style: CLTextStyle().nameTextStyle,
                    ),
                    Text(
                      "57%",
                      style: CLTextStyle().paragraphTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
