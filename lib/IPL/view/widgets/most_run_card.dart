import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class MostRunCard extends StatelessWidget {
  final String? title;
  final String? playerImageUrl;
  final String? playerName;
  final String? teamName;
  final String? runs;
  final Function() onTap;
  const MostRunCard(
      {Key? key,
      this.title,
      this.playerImageUrl,
      this.playerName,
      this.teamName,
      this.runs,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * .92,
          decoration: BoxDecoration(
            color: PublicController.pc.toggleCardBg(),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title!,
                        style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          playerImageUrl!,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(playerName!,
                                style: CLTextStyle.nameTextStyle.copyWith(
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                )),
                            Text(teamName!,
                                style: CLTextStyle.paragraphTextStyle.copyWith(
                                  fontSize: dSize(.025),
                                  color: PublicController.pc.toggleTextColor(),
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(runs!,
                        style: CLTextStyle.paragraphTextStyle.copyWith(
                          fontSize: dSize(.05),
                          color: PublicController.pc.toggleTextColor(),
                        )),
                    Text("Runs",
                        style: CLTextStyle.paragraphTextStyle.copyWith(
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
