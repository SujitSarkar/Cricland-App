import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class MostWicketsCard extends StatelessWidget {
  final String? title;
  final String? playerImageUrl;
  final String? playerName;
  final String? teamName;
  final String? wickets;
  final Function() onTap;
  const MostWicketsCard({
    Key? key,
    this.title,
    this.playerName,
    this.playerImageUrl,
    this.teamName,
    this.wickets,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: PublicController.pc.toggleCardBg(),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    height: dSize(.12),
                    width: dSize(.12),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(playerName!,
                          style: CLTextStyle.nameTextStyle.copyWith(
                            fontSize: dSize(.03),
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
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.green,
                height: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text('${wickets!} Wickets',
                  style: CLTextStyle.paragraphTextStyle.copyWith(
                    fontSize: dSize(.03),
                    color: PublicController.pc.toggleTextColor(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
