import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

import '../../model/custom_widget/constants.dart';

class BowlerCardTile extends StatelessWidget {
  const BowlerCardTile({
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
    return Card(
      color: PublicController.pc.toggleCardBg(),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "Bowler",
                      style: CLTextStyle.paragraphHeadLineTextStyle,
                    )),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "W-R",
                        style: CLTextStyle.paragraphHeadLineTextStyle,
                      )),
                      Expanded(
                        child: Text(
                          "Overs",
                          style: CLTextStyle.paragraphHeadLineTextStyle,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "Econ",
                        style: CLTextStyle.paragraphHeadLineTextStyle,
                      )),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "S Getkate",
                      style: CLTextStyle.nameTextStyle,
                    )),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "1-3",
                        style: CLTextStyle.paragraphTextStyle,
                      )),
                      Expanded(
                        child: Text(
                          "0.2",
                          style: CLTextStyle.paragraphTextStyle,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "9.00",
                        style: CLTextStyle.paragraphTextStyle,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
