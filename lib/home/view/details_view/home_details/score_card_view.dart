import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/widgets/bowller_card_tile.dart';
import 'package:cricland/home/view/widgets/score_card_batter_tile.dart';
import 'package:cricland/home/view/widgets/score_card_wicket_card_tile.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../public/controller/public_controller.dart';
import '../../../../public/variables/config.dart';
import '../../../model/monk/live_response_data.dart';

class ScoreCardView extends StatefulWidget {
  final LiveResponseData liveObjectData;
  const ScoreCardView({Key? key, required this.liveObjectData})
      : super(key: key);

  @override
  _ScoreCardViewState createState() => _ScoreCardViewState();
}

class _ScoreCardViewState extends State<ScoreCardView> {
  bool isLeft = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: isLeft
                            ? MaterialStateProperty.all(Colors.indigo)
                            : MaterialStateProperty.all(Colors.grey),
                      ),
                      onPressed: () {
                        setState(() {
                          isLeft = true;
                        });
                      },
                      child: Text(
                        "batTeamShortName runs-wickets (overs)  ",
                        style: AppTextStyle().largeTitleStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleCardBg(),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: !isLeft
                                ? MaterialStateProperty.all(Colors.indigo)
                                : MaterialStateProperty.all(Colors.grey),
                          ),
                          onPressed: () {
                            setState(() {
                              isLeft = false;
                            });
                          },
                          child: Text(
                            "batTeamShortName runs-wickets (overs)    ",
                            style: AppTextStyle().largeTitleStyle.copyWith(
                                  fontSize: dSize(.03),
                                  color: PublicController.pc.toggleCardBg(),
                                ),
                          ))),
                ],
              ),
              ScorecardBatterTile(
                isLeft: isLeft,
              ),
              ScorecardBowlerTile(isLeft: isLeft),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Fall Of Wicket",
                    style: AppTextStyle().largeTitleStyle.copyWith(
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleCardBg(),
                        ),
                  ),
                ),
              ),
              ScorecardWicketCardTile(
                isLeft: isLeft,
              ),
            ],
          )));
    });
  }
}
