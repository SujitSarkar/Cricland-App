import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../model/custom_widget/constants.dart';

class LiveWinCardTile extends StatelessWidget {
  const LiveWinCardTile({
    Key? key,
    required this.onTap,
    this.leadingUrlOne,
    this.leadingUrlTwo,
    required this.title,
    this.teamOne,
    this.teamTwo,
    this.reachTitleOne,
    this.reachSubTitleOne,
    this.reachTitleTwo,
    this.reachSubTitleTwo,
    this.wonTeam,
    this.byWon,
  }) : super(key: key);
  final String? title;
  final String? leadingUrlOne;
  final String? leadingUrlTwo;
  final String? teamOne;
  final String? teamTwo;
  final String? reachTitleOne;
  final String? reachSubTitleOne;
  final String? reachTitleTwo;
  final String? reachSubTitleTwo;
  final String? wonTeam;
  final String? byWon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
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
                    "NWW",
                    style: CLTextStyle.nameTextStyle,
                  ),
                  Text(
                    "43%",
                    style: CLTextStyle.paragraphTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Realtime Win %",
                    style: CLTextStyle.paragraphHeadLineTextStyle,
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
                        style: CLTextStyle.paragraphTextStyle
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
                    "NK",
                    style: CLTextStyle.nameTextStyle,
                  ),
                  Text(
                    "57%",
                    style: CLTextStyle.paragraphTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
