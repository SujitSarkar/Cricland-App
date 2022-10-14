import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/info_tab.dart';
import 'package:cricland/IPL/view/matches_tab.dart';
import 'package:cricland/IPL/view/over_view_tab.dart';
import 'package:cricland/IPL/view/points_table_tab.dart';
import 'package:cricland/IPL/view/squads_tab.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/details_view/home_details/points_table.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SeriesScreen extends StatefulWidget {
  final String? seriesID;
  final String? matchId;
  const SeriesScreen({
    Key? key,
    this.seriesID,
    this.matchId,
  }) : super(key: key);

  @override
  _SeriesScreenState createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _iplTabType = Variables.iplTabsCategory.first;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Variables.iplTabsCategory.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Container(
              color: AllColor.appDarkBg,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    color: AllColor.appDarkBg,
                    child: widget.seriesID == null
                        ? Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        for (var i = 0; i < 10; i++)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                      color: Colors.green)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    'assets/article_land.jpg',
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width * .05,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'IPL 2022 ',
                                  style: CLTextStyle.paragraphHeadLineTextStyle,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '26 Mar to 29 May',
                                        style: CLTextStyle
                                            .paragraphHeadLineTextStyle
                                            .copyWith(
                                          color: Colors.white70,
                                          fontSize: dSize(.02),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Align(
                            alignment: Alignment.center,
                            child: homeController
                                        .seriesMatchListModel.matchDetails !=
                                    null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    homeController
                                                        .seriesMatchListModel
                                                        .matchDetails!
                                                        .first
                                                        .matchDetailsMap!
                                                        .match!
                                                        .first
                                                        .matchInfo!
                                                        .seriesName!,
                                                    // "The Hundred 2022",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    homeController
                                                        .seriesMatchListModel
                                                        .matchDetails!
                                                        .first
                                                        .matchDetailsMap!
                                                        .key!,
                                                    // "032 Aug to 03 Sep 2022",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 80,
                                              width: 80,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      ApiEndpoints
                                                              .imageMidPoint +
                                                          "189174" +
                                                          ApiEndpoints
                                                              .imageLastPoint,
                                                      headers:
                                                          ApiEndpoints.headers,
                                                    ),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : CircularProgressIndicator(),
                          ),
                  ),
                ],
              ),
            )),
        body: Column(
          children: [
            Material(
              color: AllColor.appDarkBg,
              child: _tabBar(),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  OverViewTab(
                    seriesId: widget.seriesID!,
                  ),
                  MatchesTab(),
                  SquadsTab(),
                  SeriesPointsTableTab(),
                  SeriesInfoTab(
                      seriesName: homeController
                          .seriesMatchListModel
                          .matchDetails!
                          .first
                          .matchDetailsMap!
                          .match!
                          .first
                          .matchInfo!
                          .seriesName!,
                      duration: homeController.seriesMatchListModel
                          .matchDetails!.first.matchDetailsMap!.key!,
                      format: homeController
                          .seriesMatchListModel
                          .matchDetails!
                          .first
                          .matchDetailsMap!
                          .match!
                          .first
                          .matchInfo!
                          .matchFormat!)
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  PreferredSize _tabBar() => PreferredSize(
        preferredSize: Size.fromHeight(dSize(.04)),
        child: TabBar(
          onTap: (covariant) async {
            setState(() => _tabController.index = covariant);
          },
          isScrollable: true,
          controller: _tabController,
          labelColor: PublicController.pc.toggleLoadingColor(),
          indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(dSize(.02)),
                  topRight: Radius.circular(dSize(.02))),
              color: PublicController.pc.toggleTabColor()),
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          physics: const BouncingScrollPhysics(),
          tabs: Variables.iplTabsCategory
              .map<Widget>((String item) => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.01), horizontal: dSize(.02)),
                    child: Text(
                      item,
                      style: CLTextStyle.optionTextStyle,
                    ),
                  ))
              .toList(),
        ),
      );
}
