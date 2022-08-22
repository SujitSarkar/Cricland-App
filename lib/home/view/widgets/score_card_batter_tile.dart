import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ScorecardBatterTile extends StatelessWidget {
  final bool isLeft;
  const ScorecardBatterTile({Key? key, required this.isLeft}) : super(key: key);
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
                        "Batter",
                        style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                          fontSize: dSize(.035),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "R",
                          style:
                              CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                            fontSize: dSize(.035),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                            child: Text(
                          "B",
                          style:
                              CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                            fontSize: dSize(.035),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                          child: Text(
                            "4s",
                            style:
                                CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                              fontSize: dSize(.035),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "6s",
                          style:
                              CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                            fontSize: dSize(.035),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                          child: Text(
                            "SR",
                            style:
                                CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                              fontSize: dSize(.035),
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
                  itemCount: isLeft
                      ? homeController.scoreCardModel.scoreCard!.first
                          .batTeamDetails!.batsmenData!.length
                      : homeController.scoreCardModel.scoreCard![1]
                          .batTeamDetails!.batsmenData!.length,
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
                                    isLeft
                                        ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].batName}"
                                        : "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].batName}",
                                    style:
                                        CLTextStyle.paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Text(
                                    isLeft
                                        ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].outDesc}"
                                        : "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].outDesc}",
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
                                    isLeft
                                        ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].runs}"
                                        : "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].runs}",
                                    style:
                                        CLTextStyle.paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  )),
                                  Expanded(
                                    child: Text(
                                      isLeft
                                          ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].balls}"
                                          : "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].balls}",

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
                                    isLeft
                                        ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].fours}"
                                        : "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].fours}",
                                    style:
                                        CLTextStyle.paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  )),
                                  Expanded(
                                    child: Text(
                                      isLeft
                                          ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].sixes}"
                                          : "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].sixes}",
                                      style: CLTextStyle.paragraphTextStyle
                                          .copyWith(
                                        fontSize: dSize(.03),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    isLeft
                                        ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].strikeRate}"
                                        : "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].strikeRate}",
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
                    isLeft
                        ? "Extras:  ${homeController.scoreCardModel.scoreCard!.first.extrasData!.total} (nb${homeController.scoreCardModel.scoreCard!.first.extrasData!.noBalls}, p${homeController.scoreCardModel.scoreCard!.first.extrasData!.penalty}, lb${homeController.scoreCardModel.scoreCard!.first.extrasData!.legByes}, w${homeController.scoreCardModel.scoreCard!.first.extrasData!.wides}, b${homeController.scoreCardModel.scoreCard!.first.extrasData!.byes})"
                        : "Extras:  ${homeController.scoreCardModel.scoreCard![1].extrasData!.total} (nb${homeController.scoreCardModel.scoreCard![1].extrasData!.noBalls}, p${homeController.scoreCardModel.scoreCard![1].extrasData!.penalty}, lb${homeController.scoreCardModel.scoreCard![1].extrasData!.legByes}, w${homeController.scoreCardModel.scoreCard![1].extrasData!.wides}, b${homeController.scoreCardModel.scoreCard![1].extrasData!.byes})",

                    //"Extras: B (b0,lb3,w5,nb0,p0",
                    style: CLTextStyle.paragraphTextStyle.copyWith(
                      fontSize: dSize(.03),
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
