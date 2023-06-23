import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
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
                        style: AppTextStyle().largeTitleStyle.copyWith(
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
                          style: AppTextStyle().largeTitleStyle.copyWith(
                                fontSize: dSize(.04),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                        )),
                        Expanded(
                            child: Text(
                          "M",
                          style: AppTextStyle().largeTitleStyle.copyWith(
                                fontSize: dSize(.04),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                        )),
                        Expanded(
                          child: Text(
                            "R",
                            style: AppTextStyle().largeTitleStyle.copyWith(
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "W",
                          style: AppTextStyle().largeTitleStyle.copyWith(
                                fontSize: dSize(.04),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                        )),
                        Expanded(
                          child: Text(
                            "ER",
                            style: AppTextStyle().largeTitleStyle.copyWith(
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
                                    "bowlName",
                                    style: AppTextStyle()
                                        .paragraphTextStyle
                                        .copyWith(
                                          fontSize: dSize(.03),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                  ),
                                  Text(
                                    "outDesc",
                                    style: AppTextStyle()
                                        .paragraphTextStyle
                                        .copyWith(
                                          fontSize: dSize(.03),
                                          color: PublicController.pc
                                              .toggleTextColor(),
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
                                    "runs",
                                    style: AppTextStyle()
                                        .paragraphTextStyle
                                        .copyWith(
                                          fontSize: dSize(.03),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                  )),
                                  Expanded(
                                    child: Text(
                                      "balls",

                                      // "10",
                                      style: AppTextStyle()
                                          .paragraphTextStyle
                                          .copyWith(
                                            fontSize: dSize(.03),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "fours",
                                    style: AppTextStyle()
                                        .paragraphTextStyle
                                        .copyWith(
                                          fontSize: dSize(.03),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                  )),
                                  Expanded(
                                    child: Text(
                                      "sixes",
                                      style: AppTextStyle()
                                          .paragraphTextStyle
                                          .copyWith(
                                            fontSize: dSize(.03),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    "strikeRate",
                                    style: AppTextStyle()
                                        .paragraphTextStyle
                                        .copyWith(
                                          fontSize: dSize(.03),
                                          color: PublicController.pc
                                              .toggleTextColor(),
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
                    "Extras: total (nb noBalls, p penalty, lb legByes, w wides, b byes)",

                    //"Extras: B (b0,lb3,w5,nb0,p0",
                    style: AppTextStyle().paragraphTextStyle.copyWith(
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
