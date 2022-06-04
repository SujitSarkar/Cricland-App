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
                        "R(B)",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                      Expanded(
                        child: Text(
                          "4s",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "6s",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                      Expanded(
                        child: Text(
                          "SR",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
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
                        "20(17)",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                      Expanded(
                        child: Text(
                          "2",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.03),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                      Expanded(
                        child: Text(
                          "117.6",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.03),
                            color: PublicController.pc.toggleTextColor(),
                          ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.03),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "0(0)",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                      Expanded(
                        child: Text(
                          "0",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.03),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "0",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.03),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.03),
                            color: PublicController.pc.toggleTextColor(),
                          ),
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
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: dSize(.03),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Last wkt: J Lawlor 17(12)",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.03),
                      color: PublicController.pc.toggleTextColor(),
                    ),
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
