import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

class BatterCardTile extends StatelessWidget {
  const BatterCardTile({
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
                      "Batter",
                      style: CLTextStyle().paragraphHeadLineTextStyle,
                    )),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "R(B)",
                        style: CLTextStyle().paragraphHeadLineTextStyle,
                      )),
                      Expanded(
                        child: Text(
                          "4s",
                          style: CLTextStyle().paragraphHeadLineTextStyle,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "6s",
                        style: CLTextStyle().paragraphHeadLineTextStyle,
                      )),
                      Expanded(
                        child: Text(
                          "SR",
                          style: CLTextStyle().paragraphHeadLineTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "R Pretorius",
                    style: CLTextStyle().nameTextStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "20(17)",
                        style: CLTextStyle().paragraphTextStyle,
                      )),
                      Expanded(
                        child: Text(
                          "2",
                          style: CLTextStyle().paragraphTextStyle,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "1",
                        style: CLTextStyle().paragraphTextStyle,
                      )),
                      Expanded(
                        child: Text(
                          "117.6",
                          style: CLTextStyle().paragraphTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "M Adair",
                    style: CLTextStyle().nameTextStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "0(0)",
                        style: CLTextStyle().paragraphTextStyle,
                      )),
                      Expanded(
                        child: Text(
                          "0",
                          style: CLTextStyle().paragraphTextStyle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "0",
                          style: CLTextStyle().paragraphTextStyle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "-",
                          style: CLTextStyle().paragraphTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "P'ship 1(0)",
                      style: CLTextStyle().nameTextStyle,
                    )),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Last wkt: J Lawlor 17(12)",
                    style: CLTextStyle().paragraphTextStyle,
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
