import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class HighestScoreSix extends StatelessWidget {
  final String? title;
  final String? playerName;
  final String? teamName;
  final String? number;
  final String? numberFor;
  final Function() onTap;
  const HighestScoreSix({
    Key? key,
    this.title,
    this.playerName,
    this.teamName,
    this.number,
    this.numberFor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: PublicController.pc.toggleCardBg(),
          borderRadius: const BorderRadius.all(
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
                      style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
                        fontSize: dSize(.03),
                        color: PublicController.pc.toggleTextColor(),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(playerName!,
                          style: CLTextStyle().nameTextStyle.copyWith(
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          )),
                      Text(teamName!,
                          style: CLTextStyle().nameTextStyle.copyWith(
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ))
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(number!,
                      style: CLTextStyle().paragraphTextStyle.copyWith(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      )),
                  Text(numberFor!,
                      style: CLTextStyle().paragraphTextStyle.copyWith(
                        fontSize: dSize(.03),
                        color: PublicController.pc.toggleTextColor(),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
