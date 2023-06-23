import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
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
                          style: AppTextStyle().largeTitleStyle.copyWith(
                                fontSize: dSize(.035),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                        )),
                        Expanded(
                            child: Text(
                          "B",
                          style: AppTextStyle().largeTitleStyle.copyWith(
                                fontSize: dSize(.035),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                        )),
                        Expanded(
                          child: Text(
                            "4s",
                            style: AppTextStyle().largeTitleStyle.copyWith(
                                  fontSize: dSize(.035),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "6s",
                          style: AppTextStyle().largeTitleStyle.copyWith(
                                fontSize: dSize(.035),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                        )),
                        Expanded(
                          child: Text(
                            "SR",
                            style: AppTextStyle().largeTitleStyle.copyWith(
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
                  itemCount: isLeft ? 5 : 6,
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
                                    "batName",
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
                    "Extras:  total (nb noBalls}, p penalty, lb legByes, w wides, b byes)",

                    //"Extras: B (b0,lb3,w5,nb0,p0",
                    style: AppTextStyle().paragraphTextStyle.copyWith(
                          fontSize: dSize(.02),
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
