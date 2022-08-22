import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ScorecardBowlerTile extends StatelessWidget {
  final bool? isLeft;
  const ScorecardBowlerTile({Key? key, this.isLeft}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
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
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Bowler",
                        style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "O",
                          style:
                              CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                            child: Text(
                          "M",
                          style:
                              CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                          child: Text(
                            "R",
                            style:
                                CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                              fontSize: dSize(.04),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "W",
                          style:
                              CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                          child: Text(
                            "ER",
                            style:
                                CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                              fontSize: dSize(.04),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  itemCount: 7,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeController
                                        .scoreCardModel
                                        .scoreCard!
                                        .first
                                        .bowlTeamDetails!
                                        .bowlersData!
                                        .bowl1!
                                        .bowlName!,
                                    style:
                                        CLTextStyle.paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Text(
                                    "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].outDesc}",
                                    style:
                                        CLTextStyle.paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].runs}",
                                    style:
                                        CLTextStyle.paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  )),
                                  Expanded(
                                    child: Text(
                                      "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].balls}",

                                      // "10",
                                      style: CLTextStyle.paragraphTextStyle
                                          .copyWith(
                                        fontSize: dSize(.03),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].fours}",
                                    style:
                                        CLTextStyle.paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  )),
                                  Expanded(
                                    child: Text(
                                      "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].sixes}",
                                      style: CLTextStyle.paragraphTextStyle
                                          .copyWith(
                                        fontSize: dSize(.03),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].strikeRate}",
                                    style:
                                        CLTextStyle.paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    );
                  }),
              Divider(),
              Row(
                children: [
                  Text(
                    "Extras: ${homeController.scoreCardModel.scoreCard!.first.extrasData!.total} (nb${homeController.scoreCardModel.scoreCard!.first.extrasData!.noBalls}, p${homeController.scoreCardModel.scoreCard!.first.extrasData!.penalty}, lb${homeController.scoreCardModel.scoreCard!.first.extrasData!.legByes}, w${homeController.scoreCardModel.scoreCard!.first.extrasData!.wides}, b${homeController.scoreCardModel.scoreCard!.first.extrasData!.byes})",

                    //"Extras: B (b0,lb3,w5,nb0,p0",
                    style: CLTextStyle.paragraphTextStyle.copyWith(
                      fontSize: dSize(.025),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
