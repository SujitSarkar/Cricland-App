import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/score_card_model.dart';
import 'package:cricland/home/view/widgets/bowller_card_tile.dart';
import 'package:cricland/home/view/widgets/score_card_batter_tile.dart';
import 'package:cricland/home/view/widgets/score_card_wicket_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';
import '../../model/custom_widget/constants.dart';

class ScoreCardView extends StatefulWidget {
  const ScoreCardView({Key? key}) : super(key: key);

  @override
  _ScoreCardViewState createState() => _ScoreCardViewState();
}

class _ScoreCardViewState extends State<ScoreCardView> {
  bool isLeft = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: homeController.scoreCardModel.scoreCard == null
              ? SizedBox(child: Center(child: CircularProgressIndicator()))
              : Column(
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
                              "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batTeamShortName!} ${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.runs!}-${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.wickets!} (${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.overs!})    ",
                              style: CLTextStyle.optionTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleCardBg(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
                                  "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batTeamShortName!} ${homeController.scoreCardModel.scoreCard![1].scoreDetails!.runs!}-${homeController.scoreCardModel.scoreCard![1].scoreDetails!.wickets!} (${homeController.scoreCardModel.scoreCard![1].scoreDetails!.overs!})    ",
                                  style: CLTextStyle.optionTextStyle.copyWith(
                                    fontSize: dSize(.04),
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
                          style:
                              CLTextStyle.paragraphHeadLineTextStyle.copyWith(
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
                ),
        ),
      );
    });
  }
}
