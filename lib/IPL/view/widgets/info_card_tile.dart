import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

class InfoCardTile extends StatelessWidget {
  const InfoCardTile({
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
            ListTile(
              leading: Text(
                "Series",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              trailing: Text(
                "Indian Premier League 2000",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "Duration",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              trailing: Text(
                "26 Mar - 29 May 2022",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "Series",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              trailing: Text(
                "Indian Premier League 2000",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "Series",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              trailing: Text(
                "Indian Premier League 2000",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
