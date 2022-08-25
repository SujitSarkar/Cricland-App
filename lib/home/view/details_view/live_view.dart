import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/details_view/live_progeress_bottom_sheet.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/widgets/batter_card.dart';
import 'package:cricland/home/view/widgets/bowler_card_tile.dart';
import 'package:cricland/home/view/widgets/real_time_win_card.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../more/view/icc_man_ranking/player_details/player_details.dart';
import '../../../public/controller/api_endpoints.dart';

class LiveView extends StatefulWidget {
  final String team1ImageID;
  final String team2ImageID;
  final bool isLive;
  const LiveView({
    Key? key,
    required this.team1ImageID,
    required this.team2ImageID,
    required this.isLive,
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: widget.isLive
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "NZ lead by 119 runs",
                        style: CLTextStyle.paragraphHeadLineTextStyle,
                      ),
                    ),
                    MoreCard(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Day 4:Session2",
                          style: CLTextStyle.paragraphTextStyle,
                        ),
                        Text(
                          "Over Left Today: 36.0",
                          style: CLTextStyle.paragraphTextStyle,
                        ),
                      ],
                    )),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0; i < 10; i++)
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Text(
                                    "Over 1",
                                    style: CLTextStyle.paragraphTextStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Text(
                                        '0',
                                        style: CLTextStyle.paragraphTextStyle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Text(
                                        'wd',
                                        style: CLTextStyle.paragraphTextStyle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.redAccent),
                                      child: Text(
                                        'W',
                                        style: CLTextStyle.paragraphTextStyle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Text(
                                        '4',
                                        style: CLTextStyle.paragraphTextStyle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Text(
                                        '0',
                                        style: CLTextStyle.paragraphTextStyle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Text(
                                        '6',
                                        style: CLTextStyle.paragraphTextStyle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '=',
                                    style: CLTextStyle.paragraphTextStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Text(
                                        '10',
                                        style: CLTextStyle.paragraphTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(
                                    width: 2,
                                    thickness: 2,
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
                    LiveWinCardTile(
                      onTap: () {
                        _showSquadsSheet(context);
                      },
                      title: '',
                    ),
                    BatterCardTile(
                      title: '',
                      onTap: () {},
                    ),
                    BowlerCardTile(
                      title: '',
                      onTap: () {},
                    ),
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
                                style: CLTextStyle.nameTextStyle,
                              ),
                              Text(
                                "36-1",
                                style: CLTextStyle.paragraphTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "z",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                "After 5.5 overs",
                                style: CLTextStyle.paragraphTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "IND",
                                style: CLTextStyle.nameTextStyle,
                              ),
                              Text(
                                "37-0",
                                style: CLTextStyle.paragraphTextStyle,
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
                            style: CLTextStyle.paragraphHeadLineTextStyle,
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
                        style: CLTextStyle.paragraphHeadLineTextStyle,
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("TEEST:${homeController.scoreCardModel.status}");
                      },
                      child: Text(
                        "Player of the Match",
                        style: CLTextStyle.nameTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    homeController.scoreCardModel.matchHeader != null
                        ? Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => PlayerDetailsPage(
                                                playerId: homeController
                                                    .scoreCardModel
                                                    .matchHeader!
                                                    .playersOfTheMatch!
                                                    .first
                                                    .id
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          homeController
                                                  .scoreCardModel
                                                  .matchHeader!
                                                  .playersOfTheMatch!
                                                  .first
                                                  .name ??
                                              "",
                                          style: CLTextStyle.nameTextStyle
                                              .copyWith(fontSize: 15),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: "51",
                                          style: CLTextStyle.nameTextStyle
                                              .copyWith(
                                                  fontSize: dSize(.045),
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "(30) ",
                                              style: TextStyle(
                                                  fontSize: dSize(.03),
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            // TextSpan(text: ' world!'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              ApiEndpoints.imageMidPoint +
                                                  "${homeController.scoreCardModel.matchHeader!.playersOfTheMatch!.first.faceImageId!}" +
                                                  ApiEndpoints.imageLastPoint,
                                              headers: ApiEndpoints.headers,
                                            ),
                                            fit: BoxFit.fill,
                                            filterQuality: FilterQuality.low),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        : SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Match Summery",
                          style: CLTextStyle.nameTextStyle.copyWith(
                            fontSize: 15,
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                        Text(
                          "Scorecard >",
                          style: CLTextStyle.nameTextStyle.copyWith(
                            fontSize: 15,
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    homeController.scoreCardModel.scoreCard != null
                        ? Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            ApiEndpoints.imageMidPoint +
                                                widget.team1ImageID +
                                                ApiEndpoints.imageLastPoint,
                                            headers: ApiEndpoints.headers,
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  trailing: RichText(
                                    text: TextSpan(
                                      text:
                                          "${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.runs}-${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.wickets}",
                                      style: CLTextStyle.nameTextStyle.copyWith(
                                        fontSize: dSize(.045),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              "(${homeController.scoreCardModel.scoreCard!.first.scoreDetails!.ballNbr} b)",
                                          style: CLTextStyle.nameTextStyle
                                              .copyWith(
                                            fontSize: dSize(.03),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                        // TextSpan(text: ' world!'),
                                      ],
                                    ),
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      text: homeController
                                          .scoreCardModel
                                          .scoreCard!
                                          .first
                                          .batTeamDetails!
                                          .batTeamShortName,
                                      style: CLTextStyle.nameTextStyle.copyWith(
                                        fontSize: dSize(.045),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: homeController
                                                      .scoreCardModel
                                                      .scoreCard!
                                                      .first
                                                      .inningsId ==
                                                  1
                                              ? "  1st Innings"
                                              : "  2nd Innings",
                                          style: CLTextStyle.nameTextStyle
                                              .copyWith(
                                            fontSize: dSize(.03),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                        // TextSpan(text: ' world!'),
                                      ],
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: homeController
                                        .scoreCardModel
                                        .scoreCard!
                                        .first
                                        .batTeamDetails!
                                        .batsmenData!
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          const Divider(
                                            color: Colors.grey,
                                            height: 1,
                                          ),
                                          ListTile(
                                            trailing: RichText(
                                              text: TextSpan(
                                                text:
                                                    "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].runs}",
                                                style: CLTextStyle.nameTextStyle
                                                    .copyWith(
                                                  fontSize: dSize(.03),
                                                  color: PublicController.pc
                                                      .toggleTextColor(),
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        "(${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].balls})",
                                                    style: CLTextStyle
                                                        .nameTextStyle
                                                        .copyWith(
                                                      fontSize: dSize(.035),
                                                      color: PublicController.pc
                                                          .toggleTextColor(),
                                                    ),
                                                  ),
                                                  // TextSpan(text: ' world!'),
                                                ],
                                              ),
                                            ),
                                            title: Text(
                                              "${homeController.scoreCardModel.scoreCard!.first.batTeamDetails!.batsmenData!.values.toList()[index].batName}",
                                              style: CLTextStyle.nameTextStyle
                                                  .copyWith(
                                                fontSize: dSize(.03),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          )
                        : SizedBox(),
                    homeController.scoreCardModel.scoreCard != null
                        ? Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            ApiEndpoints.imageMidPoint +
                                                widget.team2ImageID +
                                                ApiEndpoints.imageLastPoint,
                                            headers: ApiEndpoints.headers,
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  trailing: RichText(
                                    text: TextSpan(
                                      text: "162-4",
                                      style: CLTextStyle.nameTextStyle.copyWith(
                                        fontSize: dSize(.045),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "(94 b) ",
                                          style: CLTextStyle.nameTextStyle
                                              .copyWith(
                                            fontSize: dSize(.03),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                        // TextSpan(text: ' world!'),
                                      ],
                                    ),
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      text: "NS",
                                      style: CLTextStyle.nameTextStyle.copyWith(
                                        fontSize: dSize(.045),
                                        color: PublicController.pc
                                            .toggleTextColor(),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "  2nd Innings",
                                          style: CLTextStyle.nameTextStyle
                                              .copyWith(
                                            fontSize: dSize(.03),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                        // TextSpan(text: ' world!'),
                                      ],
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: homeController
                                        .scoreCardModel
                                        .scoreCard![1]
                                        .batTeamDetails!
                                        .batsmenData!
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          const Divider(
                                            color: Colors.grey,
                                            height: 1,
                                          ),
                                          ListTile(
                                            trailing: RichText(
                                              text: TextSpan(
                                                text:
                                                    "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].runs}",
                                                style: CLTextStyle.nameTextStyle
                                                    .copyWith(
                                                  fontSize: dSize(.03),
                                                  color: PublicController.pc
                                                      .toggleTextColor(),
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        "(${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].balls})",
                                                    style: CLTextStyle
                                                        .nameTextStyle
                                                        .copyWith(
                                                      fontSize: dSize(.03),
                                                      color: PublicController.pc
                                                          .toggleTextColor(),
                                                    ),
                                                  ),
                                                  // TextSpan(text: ' world!'),
                                                ],
                                              ),
                                            ),
                                            title: Text(
                                              "${homeController.scoreCardModel.scoreCard![1].batTeamDetails!.batsmenData!.values.toList()[index].batName}",
                                              style: CLTextStyle.nameTextStyle
                                                  .copyWith(
                                                fontSize: dSize(.03),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          )
                        : SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Next Matches",
                      style: CLTextStyle.nameTextStyle.copyWith(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    homeController.seriesMatchListModel.matchDetails != null
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: homeController
                                .seriesMatchListModel.matchDetails!.length,
                            itemBuilder: (BuildContext context, int index) {
                              // print(
                              //     "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.seriesName}");

                              return homeController
                                          .seriesMatchListModel
                                          .matchDetails![index]
                                          .matchDetailsMap ==
                                      null
                                  ? const SizedBox()
                                  : Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.matchDesc}, ${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.seriesName}",
                                                    style: CLTextStyle
                                                        .nameTextStyle
                                                        .copyWith(
                                                      fontSize: dSize(.03),
                                                      color: PublicController.pc
                                                          .toggleTextColor(),
                                                    ),
                                                  ),
                                                ),
                                                Icon(Icons.notifications),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            IntrinsicHeight(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  Colors.white,
                                                              image:
                                                                  DecorationImage(
                                                                      image:
                                                                          CachedNetworkImageProvider(
                                                                        ApiEndpoints.imageMidPoint +
                                                                            "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team1!.imageId}" +
                                                                            ApiEndpoints.imageLastPoint,
                                                                        headers:
                                                                            ApiEndpoints.headers,
                                                                      ),
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      filterQuality:
                                                                          FilterQuality
                                                                              .low),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team1!.teamName}",
                                                            style: CLTextStyle
                                                                .nameTextStyle
                                                                .copyWith(
                                                              fontSize:
                                                                  dSize(.03),
                                                              color: PublicController
                                                                  .pc
                                                                  .toggleTextColor(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  Colors.white,
                                                              image:
                                                                  DecorationImage(
                                                                      image:
                                                                          CachedNetworkImageProvider(
                                                                        ApiEndpoints.imageMidPoint +
                                                                            "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team2!.imageId}" +
                                                                            ApiEndpoints.imageLastPoint,
                                                                        headers:
                                                                            ApiEndpoints.headers,
                                                                      ),
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      filterQuality:
                                                                          FilterQuality
                                                                              .low),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "${homeController.seriesMatchListModel.matchDetails![index].matchDetailsMap!.match!.first.matchInfo!.team2!.teamName}",
                                                            style: CLTextStyle
                                                                .nameTextStyle
                                                                .copyWith(
                                                              fontSize:
                                                                  dSize(.03),
                                                              color: PublicController
                                                                  .pc
                                                                  .toggleTextColor(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(),
                                                  SizedBox(),
                                                  VerticalDivider(
                                                    width: 1,
                                                    color: Colors.black,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Tomorrow",
                                                        style: CLTextStyle
                                                            .paragraphTextStyle
                                                            .copyWith(
                                                          fontSize: dSize(.03),
                                                          color: PublicController
                                                              .pc
                                                              .toggleTextColor(),
                                                        ),
                                                      ),
                                                      Text(
                                                        "07:00 PM",
                                                        style: CLTextStyle
                                                            .paragraphTextStyle
                                                            .copyWith(
                                                          fontSize: dSize(.03),
                                                          color: PublicController
                                                              .pc
                                                              .toggleTextColor(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                            })
                        : SizedBox(),
                  ],
                ),
        ),
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
