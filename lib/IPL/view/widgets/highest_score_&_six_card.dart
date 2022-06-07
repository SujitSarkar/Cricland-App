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
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: dSize(.035),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        playerName!,
                        style: TextStyle(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Text(
                        teamName!,
                        style: TextStyle(
                          fontSize: dSize(.025),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    number!,
                    style: TextStyle(
                      fontSize: dSize(.05),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                  Text(
                    numberFor!,
                    style: TextStyle(
                      fontSize: dSize(.03),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
