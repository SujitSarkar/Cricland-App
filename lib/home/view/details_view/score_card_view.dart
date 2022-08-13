import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/score_card_model.dart';
import 'package:cricland/home/view/widgets/bowller_card_tile.dart';
import 'package:cricland/home/view/widgets/score_card_batter_tile.dart';
import 'package:cricland/home/view/widgets/score_card_wicket_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
                        "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batTeamShortName!} ${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.runs!}-${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.wickets!} (${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.overs!})    ",
                        style: TextStyle(color: Colors.white),
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
                            style: TextStyle(color: Colors.white),
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
                  child: const Text(
                    "Fall Of Wicket",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
