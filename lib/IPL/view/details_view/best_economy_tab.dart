import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class BestEconomyTab extends StatefulWidget {
  const BestEconomyTab({Key? key}) : super(key: key);

  @override
  _BestEconomyTabState createState() => _BestEconomyTabState();
}

class _BestEconomyTabState extends State<BestEconomyTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18.0),
            color: PublicController.pc.toggleCardBg(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      "J BUTTLER",
                      style: TextStyle(
                        fontSize: dSize(.035),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    Text(
                      "863",
                      style: TextStyle(
                        fontSize: dSize(.05),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    Image.asset(
                      'assets/player.png',
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      "#2",
                      style: TextStyle(
                        fontSize: dSize(.05),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "J BUTTLER",
                      style: TextStyle(
                        fontSize: dSize(.035),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    Text(
                      "863",
                      style: TextStyle(
                        fontSize: dSize(.05),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    Image.asset(
                      'assets/player.png',
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      "#1",
                      style: TextStyle(
                        fontSize: dSize(.05),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "J BUTTLER",
                      style: TextStyle(
                        fontSize: dSize(.035),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    Text(
                      "863",
                      style: TextStyle(
                        fontSize: dSize(.05),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    Image.asset(
                      'assets/player.png',
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      "#3",
                      style: TextStyle(
                        fontSize: dSize(.05),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Pos",
                      style: TextStyle(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Innings",
                      style: TextStyle(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Runs",
                      style: TextStyle(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 105,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Divider(
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                "1",
                                style: TextStyle(
                                  fontSize: dSize(.035),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jos Buttler",
                                    style: TextStyle(
                                      fontSize: dSize(.035),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Text(
                                    "Rajasthan Royals",
                                    style: TextStyle(
                                      fontSize: dSize(.035),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: dSize(.035),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "863",
                                style: TextStyle(
                                  fontSize: dSize(.035),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
