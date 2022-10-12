import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/details_view/home_details/commentary_view.dart';
import 'package:cricland/home/view/details_view/home_details/info_view.dart';
import 'package:cricland/home/view/details_view/home_details/points_table.dart';
import 'package:cricland/home/view/details_view/home_details/score_card_view.dart';
import 'package:cricland/home/view/details_view/upcoming_details/upcoming_live_view.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../public/controller/api_endpoints.dart';

class UpcomingDetailsScreen extends StatefulWidget {
  final String teamS1Name;
  final String teamS2Name;
  final String matchDesc;
  final String startDate;
  final String matchID;
  final String seriesID;
  final String team1ImageID;
  final String team2ImageID;
  final int selectedIndex;

  const UpcomingDetailsScreen({
    Key? key,
    required this.teamS1Name,
    required this.teamS2Name,
    required this.matchDesc,
    required this.startDate,
    required this.matchID,
    required this.seriesID,
    required this.team1ImageID,
    required this.team2ImageID,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _UpcomingDetailsScreenState createState() => _UpcomingDetailsScreenState();
}

class _UpcomingDetailsScreenState extends State<UpcomingDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // late SharedPreferences pref;

  bool _isMute = false;
  @override
  void initState() {
    super.initState();
    fetchTabData();

    fetchData();
  }

  fetchTabData() async {
    final prefs = await SharedPreferences.getInstance();

    _tabController = TabController(
        initialIndex: 0,
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
    print(DateFormat('dd-MM-yyyy hh:mm a').format(
        DateTime.fromMicrosecondsSinceEpoch(
            int.parse(widget.startDate) * 1000)));
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
            unselectedLabelStyle: TextStyle(color: Colors.white),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dSize(.02)),
                    topRight: Radius.circular(dSize(.02))),
                color: PublicController.pc.toggleTabColor()),
            unselectedLabelColor: Colors.white,
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
          Container(
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
                Text(
                  DateFormat('dd-MM-yyyy hh:mm a').format(
                      DateTime.fromMicrosecondsSinceEpoch(
                          int.parse(widget.startDate) * 1000)),
                  style: CLTextStyle.paragraphHeadLineTextStyle
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                InfoView(),
                CommentaryView(
                  matchId: widget.matchID,
                ),
                UpcomingLiveView(
                  team1ImageID: widget.team1ImageID,
                  team2ImageID: widget.team2ImageID,
                  selectedIndex: widget.selectedIndex,
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
