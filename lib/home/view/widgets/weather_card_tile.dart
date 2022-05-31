import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

class WeatherCardTile extends StatelessWidget {
  const WeatherCardTile({
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Ahmedabad, India",
                              style: TextStyle(
                                  fontSize: dSize(.02),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor()),
                            ),
                            Text(
                              "40.7 C",
                              style: TextStyle(
                                  fontSize: dSize(.04),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor()),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.water_drop_outlined),
                      trailing: Text("25% (Humidity)"),
                    ),
                    ListTile(
                      leading: Icon(Icons.cloud),
                      trailing: Text("Chance"),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Sunny",
                  style: TextStyle(
                      fontSize: dSize(.03),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor()),
                ),
                Text(
                  "updated at 07:11 PM",
                  style: TextStyle(
                      fontSize: dSize(.02),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor()),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
