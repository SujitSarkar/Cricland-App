import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

class ScorecardBatterTile extends StatelessWidget {
  const ScorecardBatterTile({
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
                    flex: 2,
                    child: Text(
                      "Batter",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    )),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "R",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        "B",
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
            ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "J McCollum",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                                Text(
                                  "c McRuire b G Hume",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "11",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                )),
                                Expanded(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                  "1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                )),
                                Expanded(
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ),
                                Text(
                                  "110.00",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                }),
            Divider(),
            Row(
              children: [
                Text(
                  "Extras: B (b0,lb3,w5,nb0,p0",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: dSize(.03),
                    color: PublicController.pc.toggleTextColor(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
