import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
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
                      child: Text("Batsman Name",
                          style: AppTextStyle().titleTextStyle)),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("Score",
                                style: AppTextStyle().titleTextStyle)),
                        Expanded(
                            child: Text("Over",
                                style: AppTextStyle().titleTextStyle)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                  itemCount: isLeft ? 5 : 6,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const Divider(),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("batName",
                                      style: AppTextStyle().paragraphTextStyle),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "wktRuns",
                                    style: AppTextStyle().paragraphTextStyle,
                                  )),
                                  Expanded(
                                    child: Text("wktOver",

                                        // "10",
                                        style:
                                            AppTextStyle().paragraphTextStyle),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
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
