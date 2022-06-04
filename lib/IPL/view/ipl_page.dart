import 'package:cricland/IPL/view/info_tab.dart';
import 'package:cricland/IPL/view/matches_tab.dart';
import 'package:cricland/IPL/view/news_tab.dart';
import 'package:cricland/IPL/view/over_view_tab.dart';
import 'package:cricland/IPL/view/points_table_tab.dart';
import 'package:cricland/IPL/view/squads_tab.dart';
import 'package:cricland/home/view/details_view/commentary_view.dart';
import 'package:cricland/home/view/details_view/fantasy_view.dart';
import 'package:cricland/home/view/details_view/graphs_view.dart';
import 'package:cricland/home/view/details_view/info_view.dart';
import 'package:cricland/home/view/details_view/live_view.dart';
import 'package:cricland/home/view/details_view/points_table.dart';
import 'package:cricland/home/view/details_view/score_card_view.dart';
import 'package:cricland/home/view/fixtures_tab_page.dart';
import 'package:cricland/news/view/news_page.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class IPLPage extends StatefulWidget {
  const IPLPage({
    Key? key,
  }) : super(key: key);

  @override
  _IPLPageState createState() => _IPLPageState();
}

class _IPLPageState extends State<IPLPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(210),
            child: Container(
              color: AllColor.appDarkBg,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    color: AllColor.appDarkBg,
                    child: Column(
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                color: Colors.green)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
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
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'IPL 2022 ',
                            style: TextStyle(
                                color: Colors.white70, fontSize: dSize(.04)),
                            children: <TextSpan>[
                              TextSpan(
                                text: '26 Mar to 29 May',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: dSize(.02),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  const Material(
                    color: AllColor.appDarkBg,
                    child: TabBar(
                      isScrollable: true,
                      tabs: [
                        Text("Overview"),
                        Text("Matches"),
                        Text("Squads"),
                        Text("Points Table"),
                        Text("News"),
                        Text("Info"),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        body: TabBarView(
          children: <Widget>[
            OverViewTab(),
            MatchesTab(),
            SquadsTab(),
            PointTableView(),
            NewsPage(),
            InfoTab(),
          ],
        ),
      ),
    );
  }
}
