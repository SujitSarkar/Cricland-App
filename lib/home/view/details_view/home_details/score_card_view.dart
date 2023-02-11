import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/widgets/bowller_card_tile.dart';
import 'package:cricland/home/view/widgets/score_card_batter_tile.dart';
import 'package:cricland/home/view/widgets/score_card_wicket_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../public/controller/public_controller.dart';
import '../../../../public/variables/config.dart';
import '../../../model/custom_widget/constants.dart';

class ScoreCardView extends StatefulWidget {
  final String matchId;
  const ScoreCardView({Key? key, required this.matchId}) : super(key: key);

  @override
  _ScoreCardViewState createState() => _ScoreCardViewState();
}

class _ScoreCardViewState extends State<ScoreCardView> {
  bool isLeft = true;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    HomeController homeController = Get.put(HomeController());
    await homeController.getScoreCard("${widget.matchId}/scard");

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child:  SingleChildScrollView(
          child: homeController.scoreCardModel.scoreCard!.isNotEmpty
              ? Column(
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
                        style: CLTextStyle().optionTextStyle.copyWith(
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
                            "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batTeamShortName!} ${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.runs!}-${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.wickets!} (${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.overs!})    ",
                            style: CLTextStyle().optionTextStyle.copyWith(
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
                    style:
                    CLTextStyle().paragraphHeadLineTextStyle.copyWith(
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
          ): const SizedBox(child: Center(child: Padding(
            padding: EdgeInsets.only(top: 200.0),
            child: Text("Score Card is not Updated"),
          ),),)
        )
      );
    });
  }
}
