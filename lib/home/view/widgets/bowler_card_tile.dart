import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

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
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "W-R",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                      Expanded(
                        child: Text(
                          "Overs",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "Econ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
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
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: dSize(.03),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "1-3",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                      Expanded(
                        child: Text(
                          "0.2",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.03),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "9.00",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
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
