import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class HighestScoreTab extends StatefulWidget {
  const HighestScoreTab({Key? key}) : super(key: key);

  @override
  _HighestScoreTabState createState() => _HighestScoreTabState();
}

class _HighestScoreTabState extends State<HighestScoreTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18.0),
            color: Colors.grey.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text("J BUTTLER"),
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
                    Text("J BUTTLER"),
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
                    Text("J BUTTLER"),
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
                    Text("Pos"),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Name"),
                    Spacer(),
                    Text("Innings"),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Runs"),
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
                              Text("1"),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Jos Buttler"),
                                  Text("Rajasthan Royals"),
                                ],
                              ),
                              Spacer(),
                              Text("10"),
                              SizedBox(
                                width: 20,
                              ),
                              Text("863"),
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
