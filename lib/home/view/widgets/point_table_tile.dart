import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

class PointTableTile extends StatelessWidget {
  const PointTableTile({
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    "Team",
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
                        "P",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "W",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "L",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "NR",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "NRR",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Pts",
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
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/t20.png',
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "NWW",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.03),
                                  color: PublicController.pc.toggleTextColor(),
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
                                "0",
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
                                    color:
                                        PublicController.pc.toggleTextColor(),
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
        ],
      ),
    );
  }
}
