import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/app_text_style.dart';
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
                        style: AppTextStyle().largeTitleStyle.copyWith(
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
                              AppTextStyle().largeTitleStyle.copyWith(
                            fontSize: dSize(.035),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                            child: Text(
                          "B",
                          style:
                              AppTextStyle().largeTitleStyle.copyWith(
                            fontSize: dSize(.035),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                          child: Text(
                            "4s",
                            style:
                                AppTextStyle().largeTitleStyle.copyWith(
                              fontSize: dSize(.035),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "6s",
                          style:
                              AppTextStyle().largeTitleStyle.copyWith(
                            fontSize: dSize(.035),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                          child: Text(
                            "SR",
                            style:
                                AppTextStyle().largeTitleStyle.copyWith(
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
                      : homeController.scoreCardModel.scoreCard!.first
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
                                        : "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].batName}",
                                    style:
                                        AppTextStyle().paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Text(
                                    isLeft
                                        ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].outDesc}"
                                        : "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].outDesc}",
                                    style:
                                        AppTextStyle().paragraphTextStyle.copyWith(
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
                                        : "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].runs}",
                                    style:
                                        AppTextStyle().paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  )),
                                  Expanded(
                                    child: Text(
                                      isLeft
                                          ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].balls}"
                                          : "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].balls}",

                                      // "10",
                                      style: AppTextStyle().paragraphTextStyle
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
                                        : "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].fours}",
                                    style:
                                        AppTextStyle().paragraphTextStyle.copyWith(
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  )),
                                  Expanded(
                                    child: Text(
                                      isLeft
                                          ? "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].sixes}"
                                          : "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].sixes}",
                                      style: AppTextStyle().paragraphTextStyle
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
                                        : "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].strikeRate}",
                                    style:
                                        AppTextStyle().paragraphTextStyle.copyWith(
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
                        : "Extras:  ${homeController.scoreCardModel.scoreCard!.first.extrasData!.total} (nb${homeController.scoreCardModel.scoreCard!.first.extrasData!.noBalls}, p${homeController.scoreCardModel.scoreCard!.first.extrasData!.penalty}, lb${homeController.scoreCardModel.scoreCard!.first.extrasData!.legByes}, w${homeController.scoreCardModel.scoreCard!.first.extrasData!.wides}, b${homeController.scoreCardModel.scoreCard!.first.extrasData!.byes})",

                    //"Extras: B (b0,lb3,w5,nb0,p0",
                    style: AppTextStyle().paragraphTextStyle.copyWith(
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
