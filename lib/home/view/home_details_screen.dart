import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/model/score_card_model.dart';
import 'package:cricland/home/view/details_view/commentary_view.dart';
import 'package:cricland/home/view/details_view/info_view.dart';
import 'package:cricland/home/view/details_view/live_view.dart';
import 'package:cricland/home/view/details_view/points_table.dart';
import 'package:cricland/home/view/details_view/score_card_view.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../public/controller/api_endpoints.dart';

class HomeDetailsScreen extends StatefulWidget {
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
  final bool isLive;

  const HomeDetailsScreen({
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
    required this.isLive,
  }) : super(key: key);

  @override
  _HomeDetailsScreenState createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // late SharedPreferences pref;

  int? tabIndex;
  @override
  void initState() {
    super.initState();
    fetchTabData();

    fetchData();
  }

  fetchTabData() async {
    final prefs = await SharedPreferences.getInstance();
    _tabController = TabController(
        initialIndex: prefs.getInt('tabIndex')!,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: RichText(
          text: TextSpan(
            text: widget.teamS1Name,
            style: CLTextStyle.nameTextStyle,
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
              print(_tabController.index);
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
            tabs: Variables.iplDetailsTabsCategory.map<Widget>((String item) {
              print(item);

              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: dSize(.01), horizontal: dSize(.02)),
                child: Text(
                  item,
                  style: CLTextStyle.optionTextStyle,
                ),
              );
            }).toList(),
          ),
        ),
      ),
      body: Column(
        children: [
          widget.isLive
              ? Container(
                  padding: EdgeInsets.all(5),
                  color: AllColor.appDarkBg,
                  //color: Colors.grey,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/bd_flag.png',
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.teamS1Name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: dSize(.05),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '140-5',
                                  style: TextStyle(
                                      fontSize: dSize(.04),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' 16.35',
                                      style: TextStyle(
                                          fontSize: dSize(.02),
                                          fontWeight: FontWeight.w500,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            FontAwesomeIcons.volumeHigh,
                            color: Colors.white,
                            size: 15,
                          ),
                          Spacer(),
                          Lottie.asset('assets/out.json', height: 40, width: 4),
                          // Image.asset(
                          //   'assets/out.gif',
                          //   height: 50,
                          //   width: 50,
                          // ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Text(
                                "Caught Out",
                                style: TextStyle(
                                  fontSize: dSize(.05),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(5),
                  color: AllColor.appDarkBg,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.teamS1Name,
                                      style: CLTextStyle.nameTextStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: dSize(.05),
                                      )),
                                  RichText(
                                    text: TextSpan(
                                      text: "${widget.team1RunWicket} ",
                                      style: CLTextStyle.paragraphTextStyle
                                          .copyWith(
                                              fontSize: dSize(.03),
                                              color: Colors.white),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: " ${widget.team1Over} ",
                                          style: CLTextStyle.paragraphTextStyle
                                              .copyWith(
                                                  fontSize: dSize(.025),
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
                          Icon(
                            Icons.bolt,
                            color: Colors.white,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.teamS2Name,
                                    style: CLTextStyle.nameTextStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: dSize(.05),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: widget.team2Over,
                                      style: CLTextStyle.paragraphTextStyle
                                          .copyWith(
                                        color: Colors.white,
                                        fontSize: dSize(.025),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: " ${widget.team2RunWicket}",
                                          style: CLTextStyle.paragraphTextStyle
                                              .copyWith(
                                            color: Colors.white,
                                            fontSize: dSize(.04),
                                          ),
                                        ),
                                        // TextSpan(text: ' world!'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
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
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.winningStatus,
                        style: CLTextStyle.paragraphHeadLineTextStyle
                            .copyWith(color: Colors.orange, fontSize: 15),
                      )
                    ],
                  ),
                ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                InfoView(),
                CommentaryView(),
                LiveView(
                  team1ImageID: widget.team1ImageID,
                  team2ImageID: widget.team2ImageID,
                ),
                ScoreCardView(),
                PointTableView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // PreferredSize _tabBar() => PreferredSize(
  //       preferredSize: Size.fromHeight(dSize(.04)),
  //       child: TabBar(
  //         onTap: (covariant) {
  //           setState(() => _tabController.index = covariant);
  //           print("KKKKKK");
  //         },
  //         isScrollable: true,
  //         controller: _tabController,
  //         labelColor: PublicController.pc.toggleLoadingColor(),
  //         indicator: BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(dSize(.02)),
  //                 topRight: Radius.circular(dSize(.02))),
  //             color: PublicController.pc.toggleTabColor()),
  //         unselectedLabelColor: Colors.grey,
  //         indicatorSize: TabBarIndicatorSize.label,
  //         physics: const BouncingScrollPhysics(),
  //         tabs: Variables.iplDetailsTabsCategory.map<Widget>((String item) {
  //           return Padding(
  //             padding: EdgeInsets.symmetric(
  //                 vertical: dSize(.01), horizontal: dSize(.02)),
  //             child: Text(
  //               item,
  //               style: CLTextStyle.optionTextStyle,
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     );
}
