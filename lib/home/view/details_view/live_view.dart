import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/details_view/live_progeress_bottom_sheet.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/widgets/batter_card.dart';
import 'package:cricland/home/view/widgets/bowler_card_tile.dart';
import 'package:cricland/home/view/widgets/real_time_win_card.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../public/controller/api_endpoints.dart';

class LiveView extends StatefulWidget {
  const LiveView({Key? key}) : super(key: key);

  @override
  _LiveViewState createState() => _LiveViewState();
}

class _LiveViewState extends State<LiveView> {
  final bool _isLive = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: _isLive
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "NZ lead by 119 runs",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    MoreCard(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Day 4:Session2",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                        Text(
                          "Over Left Today: 36.0",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
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
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.04),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '=',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.04),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Text(
                                        '10',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
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
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                "36-1",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
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
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "IND",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                "37-0",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
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
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: dSize(.04),
                              color: PublicController.pc.toggleTextColor(),
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
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
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
                      child: const Text(
                        "Player of the Match",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeController.scoreCardModel.matchHeader!
                                        .playersOfTheMatch!.first.name!,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "51",
                                      style: TextStyle(
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
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        ApiEndpoints.imageMidPoint +
                                            "${homeController.scoreCardModel.matchHeader!.playersOfTheMatch!.first.faceImageId}" +
                                            ApiEndpoints.imageLastPoint,
                                        headers: ApiEndpoints.headers,
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Image.asset(
                                "assets/player.png",
                                height: 80,
                                width: 80,
                              )
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Match Summery",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Scorecard >",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.asset("assets/t20.png"),
                            trailing: RichText(
                              text: TextSpan(
                                text: "161-4",
                                style: TextStyle(
                                    fontSize: dSize(.045),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "(100 b) ",
                                    style: TextStyle(
                                        fontSize: dSize(.03),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  // TextSpan(text: ' world!'),
                                ],
                              ),
                            ),
                            title: RichText(
                              text: TextSpan(
                                text: "MO",
                                style: TextStyle(
                                    fontSize: dSize(.045),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "  1st Innings",
                                    style: TextStyle(
                                        fontSize: dSize(.03),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  // TextSpan(text: ' world!'),
                                ],
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    const Divider(
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                    ListTile(
                                        leading: const Icon(Icons.list),
                                        trailing: const Text(
                                          "GFG",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15),
                                        ),
                                        title: Text("List item $index")),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.asset("assets/t20.png"),
                            trailing: RichText(
                              text: TextSpan(
                                text: "162-4",
                                style: TextStyle(
                                    fontSize: dSize(.045),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "(94 b) ",
                                    style: TextStyle(
                                        fontSize: dSize(.03),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  // TextSpan(text: ' world!'),
                                ],
                              ),
                            ),
                            title: RichText(
                              text: TextSpan(
                                text: "NS",
                                style: TextStyle(
                                    fontSize: dSize(.045),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "  2nd Innings",
                                    style: TextStyle(
                                        fontSize: dSize(.03),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  // TextSpan(text: ' world!'),
                                ],
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    const Divider(
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                    ListTile(
                                        leading: const Icon(Icons.list),
                                        trailing: const Text(
                                          "GFG",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15),
                                        ),
                                        title: Text("List item $index")),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Next Matches",
                      style: TextStyle(fontSize: 20),
                    )
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
