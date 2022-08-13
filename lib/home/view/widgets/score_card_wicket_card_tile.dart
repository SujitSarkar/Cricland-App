import 'package:cricland/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ScorecardWicketCardTile extends StatelessWidget {
  final bool isLeft;
  const ScorecardWicketCardTile({Key? key, required this.isLeft})
      : super(key: key);
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
                      flex: 3,
                      child: Text(
                        "Batsman Name",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Score",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
                        Expanded(
                            child: Text(
                          "Over",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )),
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
                      ? homeController
                          .scoreCardModel.scoreCard!.first.wicketsData!.length
                      : homeController
                          .scoreCardModel.scoreCard![1].wicketsData!.length,
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
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isLeft
                                        ? homeController
                                            .scoreCardModel
                                            .scoreCard!
                                            .first
                                            .wicketsData!
                                            .values
                                            .toList()[index]
                                            .batName!
                                        : homeController.scoreCardModel
                                            .scoreCard![1].wicketsData!.values
                                            .toList()[index]
                                            .batName!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    isLeft
                                        ? "${homeController.scoreCardModel.scoreCard!.first.wicketsData!.values.toList()[index].wktRuns!}"
                                        : "${homeController.scoreCardModel.scoreCard![1].wicketsData!.values.toList()[index].wktRuns!}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  )),
                                  Expanded(
                                    child: Text(
                                      isLeft
                                          ? "${homeController.scoreCardModel.scoreCard!.first.wicketsData!.values.toList()[index].wktOver!}"
                                          : "${homeController.scoreCardModel.scoreCard![1].wicketsData!.values.toList()[index].wktOver!}",

                                      // "10",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: dSize(.03),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
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
            ],
          ),
        ),
      );
    });
  }
}
