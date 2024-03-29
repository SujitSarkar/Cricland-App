import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/details_view/home_details/commentary_view.dart';
import 'package:cricland/home/view/details_view/home_details/info_view.dart';
import 'package:cricland/home/view/details_view/home_details/live_view.dart';
import 'package:cricland/home/view/details_view/home_details/points_table.dart';
import 'package:cricland/home/view/details_view/home_details/score_card_view.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../public/controller/api_endpoints.dart';

class LiveDetailsScreen extends StatefulWidget {
  final String teamS1Name;
  final String teamS2Name;
  final String matchDesc;
  final String team1RunWicket;
  final String team1Over;
  final String team2RunWicket;
  final String team2Over;
  final String winningStatus;
  final String matchID;
  final String seriesID;
  final String team1ImageID;
  final String team2ImageID;
  final String state;

  const LiveDetailsScreen({
    Key? key,
    required this.teamS1Name,
    required this.teamS2Name,
    required this.matchDesc,
    required this.matchID,
    required this.seriesID,
    required this.team1RunWicket,
    required this.team2RunWicket,
    required this.team1Over,
    required this.team2Over,
    required this.winningStatus,
    required this.team1ImageID,
    required this.team2ImageID,
    required this.state,
  }) : super(key: key);

  @override
  _LiveDetailsScreenState createState() => _LiveDetailsScreenState();
}

class _LiveDetailsScreenState extends State<LiveDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isMute = false;
  @override
  void initState() {
    super.initState();
    fetchTabData();
  }

  fetchTabData() async {
    _tabController = TabController(
        initialIndex: 2,
        length: Variables.iplDetailsTabsCategory.length,
        vsync: this);
    setState(() {});
  }

  fetchData() async {
    HomeController homeController = Get.put(HomeController());
    await homeController.getScoreCard("40381/scard");
    await homeController.getSeriesMatches("3641");

    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: RichText(
              text: TextSpan(
                text: widget.teamS1Name,
                style: CLTextStyle.nameTextStyle.copyWith(color: Colors.white),
                children: <TextSpan>[
                  const TextSpan(
                      text: '  VS  ',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  TextSpan(
                    text: widget.teamS2Name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ", ${widget.matchDesc}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: const [
              Icon(
                Icons.push_pin_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(dSize(.04)),
              child: TabBar(
                onTap: (covariant) async {
                  final prefs = await SharedPreferences.getInstance();
                  setState(() => _tabController.index = covariant);
                  await prefs.setInt("tabIndex", _tabController.index);
                },
                isScrollable: true,
                controller: _tabController,
                labelColor: Colors.black,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(dSize(.02)),
                        topRight: Radius.circular(dSize(.02))),
                    color: PublicController.pc.toggleTabColor()),
                unselectedLabelColor: Colors.white70,
                indicatorSize: TabBarIndicatorSize.label,
                physics: const BouncingScrollPhysics(),
                tabs:
                    Variables.iplDetailsTabsCategory.map<Widget>((String item) {
                  print(item);

                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.01), horizontal: dSize(.02)),
                    child: Text(
                      item,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                color: AllColor.appDarkBg,
                //color: Colors.grey,
                height: 150,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .85,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
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
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.teamS1Name,
                                              style: CLTextStyle.nameTextStyle
                                                  .copyWith(
                                                      color: Colors.white)),
                                          RichText(
                                            text: TextSpan(
                                              text: widget.team1RunWicket,
                                              style: CLTextStyle
                                                  .paragraphHeadLineTextStyle
                                                  .copyWith(
                                                      color: Colors.white),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: "  ${widget.team1Over}",
                                                  style: CLTextStyle
                                                      .paragraphTextStyle
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                                // TextSpan(text: ' world!'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        'assets/out.gif',
                                        height: 30,
                                        width: 44,
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 18.0),
                                          child: Text(
                                            "Caught Out",
                                            style: CLTextStyle.nameTextStyle
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isMute = !_isMute;
                            });
                          },
                          icon: Icon(
                            _isMute
                                ? FontAwesomeIcons.volumeHigh
                                : FontAwesomeIcons.volumeMute,
                            color: Colors.white,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                      height: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              "CRR: ${homeController.overSummeryModel.currentRunRate}",
                              style: CLTextStyle.paragraphTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                            ),
                            Text(
                              "RRR: ${homeController.overSummeryModel.requiredRunRate}",
                              style: CLTextStyle.paragraphTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "RRW: ${homeController.overSummeryModel.remRunsToWin}",
                          style: CLTextStyle.paragraphTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    InfoView(
                      matchId: widget.matchID,
                    ),
                    CommentaryView(
                      matchId: widget.matchID,
                    ),
                    LiveView(
                      team1ImageID: widget.team1ImageID,
                      team2ImageID: widget.team2ImageID,
                      matchId: widget.matchID,
                      state: widget.state,
                    ),
                    ScoreCardView(
                      matchId: widget.matchID,
                    ),
                    PointTableView(
                      matchId: widget.matchID,
                      seriesId: widget.seriesID,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
