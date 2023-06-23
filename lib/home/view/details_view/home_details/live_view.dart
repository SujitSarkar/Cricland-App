import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/details_view/live_progeress_bottom_sheet.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../model/monk/live_response_data.dart';

class LiveView extends StatefulWidget {
  final LiveResponseData liveObjectData;

  const LiveView({
    Key? key,
    required this.liveObjectData,
  }) : super(key: key);

  @override
  _LiveViewState createState() => _LiveViewState();
}

class _LiveViewState extends State<LiveView> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032), color: PublicController.pc.toggleTextColor());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.liveObjectData.status,
                style: AppTextStyle().largeTitleStyle,
              ),
            ),
            // MoreCard(
            //     child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Day 4:Session2",
            //       style: CLTextStyle().paragraphTextStyle,
            //     ),
            //     Text(
            //       "Over Left Today: 36.0",
            //       style: CLTextStyle().paragraphTextStyle,
            //     ),
            //   ],
            // )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < 10; i++)
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Text(
                            "Over : ",
                            style: _textStyle.copyWith(
                              fontSize: dSize(.03),
                              fontWeight: FontWeight.bold,
                              color: PublicController.pc.toggleLoadingColor(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Text(
                                homeController
                                            .overSummeryModel.overSummaryList !=
                                        null
                                    ? '${homeController.overSummeryModel.overSummaryList![i].overNum!.toInt()}'
                                    : "",
                                style: _textStyle.copyWith(
                                  fontSize: dSize(.03),
                                  fontWeight: FontWeight.bold,
                                  color:
                                      PublicController.pc.toggleLoadingColor(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Text(
                                homeController
                                            .overSummeryModel.overSummaryList !=
                                        null
                                    ? '${homeController.overSummeryModel.overSummaryList![i].oSummary}'
                                    : "",
                                style: _textStyle.copyWith(
                                  fontSize: dSize(.03),
                                  fontWeight: FontWeight.bold,
                                  color:
                                      PublicController.pc.toggleLoadingColor(),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '=',
                            style: AppTextStyle().paragraphTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Text(
                                homeController
                                            .overSummeryModel.overSummaryList !=
                                        null
                                    ? '${homeController.overSummeryModel.overSummaryList![i].runs}'
                                    : "",
                                style: _textStyle.copyWith(
                                  fontSize: dSize(.03),
                                  fontWeight: FontWeight.bold,
                                  color:
                                      PublicController.pc.toggleLoadingColor(),
                                ),
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Text(
              "Player of the Match",
              style: _textStyle.copyWith(
                fontSize: dSize(.03),
                fontWeight: FontWeight.bold,
                color: PublicController.pc.toggleLoadingColor(),
              ),
            ),
            MoreCard(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "playersOfTheMatch!.name",
                      style: _textStyle.copyWith(
                        fontSize: dSize(.035),
                        fontWeight: FontWeight.bold,
                        color: PublicController.pc.toggleLoadingColor(),
                      ),
                    ),
                    Text(
                      "playersOfTheMatch!.role",
                      style: _textStyle.copyWith(
                        fontSize: dSize(.03),
                        fontWeight: FontWeight.bold,
                        color: PublicController.pc.toggleLoadingColor(),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            widget.liveObjectData.localTeamImage),
                        fit: BoxFit.fill),
                  ),
                ),
              ],
            )),

            // LiveWinCardTile(
            //   selectedIndex: 0,
            //   onTap: () {
            //     _showSquadsSheet(context);
            //   },
            // ),
            // BatterCardTile(
            //   title: '',
            //   onTap: () {},
            // ),
            // BowlerCardTile(
            //   title: '',
            //   onTap: () {},
            // ),
            const SizedBox(
              height: 5,
            ),
            MoreCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "SA",
                        style: _textStyle.copyWith(
                          fontSize: dSize(.035),
                          fontWeight: FontWeight.bold,
                          color: PublicController.pc.toggleLoadingColor(),
                        ),
                      ),
                      Text(
                        "36-1",
                        style: _textStyle.copyWith(
                          fontSize: dSize(.03),
                          fontWeight: FontWeight.bold,
                          color: PublicController.pc.toggleLoadingColor(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "z",
                        style: _textStyle.copyWith(
                          fontSize: dSize(.03),
                          fontWeight: FontWeight.bold,
                          color: PublicController.pc.toggleLoadingColor(),
                        ),
                      ),
                      Text(
                        "After 5.5 overs",
                        style: _textStyle.copyWith(
                          fontSize: dSize(.03),
                          fontWeight: FontWeight.bold,
                          color: PublicController.pc.toggleLoadingColor(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "IND",
                        style: _textStyle.copyWith(
                          fontSize: dSize(.03),
                          fontWeight: FontWeight.bold,
                          color: PublicController.pc.toggleLoadingColor(),
                        ),
                      ),
                      Text(
                        "37-0",
                        style: _textStyle.copyWith(
                          fontSize: dSize(.03),
                          fontWeight: FontWeight.bold,
                          color: PublicController.pc.toggleLoadingColor(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MoreCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.share,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Share Score",
                    style: _textStyle.copyWith(
                      fontSize: dSize(.03),
                      fontWeight: FontWeight.bold,
                      color: PublicController.pc.toggleLoadingColor(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                //TODO Settings Dialog
              },
              tileColor: PublicController.pc.toggleCardBg(),
              leading: Icon(
                Icons.settings,
                color: PublicController.pc.toggleTextColor(),
              ),
              title: Text(
                "Match Settings",
                style: _textStyle.copyWith(
                  fontSize: dSize(.035),
                  fontWeight: FontWeight.bold,
                  color: PublicController.pc.toggleLoadingColor(),
                ),
              ),
            )
          ],
        )),
      );
    });
  }

  void _showSquadsSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return const FractionallySizedBox(
                heightFactor: 2.4,
                child: ProgressBottomSheet(),
              );
            }));
  }
}
