import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/widgets/commentary_profile_card_tile.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/home_controller.dart';

class CommentaryView extends StatefulWidget {
  const CommentaryView({Key? key}) : super(key: key);

  @override
  _CommentaryViewState createState() => _CommentaryViewState();
}

class _CommentaryViewState extends State<CommentaryView> {
  bool _isLive = false;
  bool _isReverse = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _isLive
              ? Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MoreCard(
                            child: CommentaryProfileCardTile(
                              playerName:
                                  "${homeController.commentariesModel.matchHeader!.playersOfTheMatch!.first.name}",
                              onTap: () {},
                              playerImage:
                                  "${homeController.commentariesModel.matchHeader!.playersOfTheMatch!.first.faceImageId}",
                              bol: '(17)',
                              run: '20',
                            ),
                          ),
                          MoreCard(
                            child: CommentaryProfileCardTile(
                              onTap: () {},
                              playerName:
                                  "${homeController.commentariesModel.matchHeader!.playersOfTheSeries!.first.name}",
                              bol: '(12)',
                              run: '20',
                              playerImage:
                                  "${homeController.commentariesModel.matchHeader!.playersOfTheSeries!.first.faceImageId}",
                            ),
                          ),
                          MoreCard(
                            child: CommentaryProfileCardTile(
                              onTap: () {},
                              playerName:
                                  "${homeController.commentariesModel.matchHeader!.playersOfTheMatch!.first.name}",
                              playerImage:
                                  "${homeController.commentariesModel.matchHeader!.playersOfTheMatch!.first.faceImageId}",
                              bol: '(17)',
                              run: '0',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Over 11:",
                          style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor()),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Center(
                                              child: Text(
                                            'wd',
                                            style: TextStyle(
                                                fontSize: dSize(.03),
                                                fontWeight: FontWeight.w500,
                                                color: PublicController.pc
                                                    .toggleTextColor()),
                                          )),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Text(
                              "=2",
                              style: TextStyle(
                                  fontSize: dSize(.04),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor()),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        "Commentary View",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expandable(
                      backgroundColor: PublicController.pc.toggleCardBg(),
                      arrowWidget: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: PublicController.pc.toggleTextColor(),
                      ),
                      firstChild: Container(
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * .85,
                        child: RichText(
                          text: TextSpan(
                            text: 'NK',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: dSize(.04),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' vs ',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              TextSpan(
                                text: 'NWW',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      secondChild: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.shade800,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/player.png',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: 'J Lawlor',
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: dSize(.03),
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' 17(12)',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: dSize(.03),
                                                  color: PublicController.pc
                                                      .toggleTextColor(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2, color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "Wkt #3",
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: dSize(.03),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "cW McClintock b S Getkate",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: dSize(.024),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                    )

                                    // Text(
                                    //   'J Lawlor',
                                    //   style: TextStyle(
                                    //     fontWeight: FontWeight.normal,
                                    //     fontSize: dSize(.04),
                                    //     color: PublicController.pc.toggleTextColor(),
                                    //   ),
                                    // ),
                                    // Text(
                                    //   'BD',
                                    //   style: TextStyle(
                                    //     fontWeight: FontWeight.normal,
                                    //     fontSize: dSize(.04),
                                    //     color: PublicController.pc.toggleTextColor(),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "4s/6s",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: dSize(.02),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                    ),
                                    Text(
                                      "2/0",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: dSize(.03),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "SR",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: dSize(.02),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                    ),
                                    Text(
                                      "141.67",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: dSize(.03),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // ListTile(
                    //   leading: Text(
                    //     "NK vs NWW",
                    //     style: TextStyle(
                    //       fontSize: dSize(.04),
                    //       fontWeight: FontWeight.w500,
                    //       color: PublicController.pc.toggleTextColor(),
                    //     ),
                    //   ),
                    //   trailing: Row(
                    //     children: [
                    //       Text(
                    //         "S",
                    //         style: TextStyle(
                    //           fontSize: dSize(.04),
                    //           fontWeight: FontWeight.w500,
                    //           color: PublicController.pc.toggleTextColor(),
                    //         ),
                    //       ),
                    //       Icon(
                    //         Icons.arrow_forward_ios_sharp,
                    //         size: dSize(.04),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                )
              : Column(
                  children: [
                    ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'NSW ',
                              style: CLTextStyle.paragraphHeadLineTextStyle
                                  .copyWith(
                                      color: PublicController.pc
                                          .toggleTextColor()),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'vs',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: PublicController.pc
                                            .toggleTextColor())),
                                TextSpan(
                                    text: ' OIW',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: PublicController.pc
                                            .toggleTextColor())),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (_isReverse) {
                                setState(() {
                                  _isReverse = false;
                                });
                              } else {
                                setState(() {
                                  _isReverse = true;
                                });
                              }
                            },
                            icon: Icon(_isReverse
                                ? Icons.arrow_downward
                                : Icons.arrow_upward),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text(
                          "See Key Events",
                          style:
                              CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                        reverse: _isReverse,
                        itemCount: homeController
                            .commentariesModel.commentaryList!.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                leading: Icon(Icons.message),
                                title: Text(
                                  homeController.commentariesModel
                                      .commentaryList![index].commText!,
                                  style: CLTextStyle.paragraphTextStyle
                                      .copyWith(
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                          fontSize: 14),
                                ),
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
