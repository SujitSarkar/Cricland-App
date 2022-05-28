import 'package:cricland/home/view/details_view/commentary_view.dart';
import 'package:cricland/home/view/details_view/fantasy_view.dart';
import 'package:cricland/home/view/details_view/graphs_view.dart';
import 'package:cricland/home/view/details_view/info_view.dart';
import 'package:cricland/home/view/details_view/live_view.dart';
import 'package:cricland/home/view/details_view/points_table.dart';
import 'package:cricland/home/view/details_view/score_card_view.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class HomeDetailsScreen extends StatefulWidget {
  final String appBarTitle;
  const HomeDetailsScreen({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  _HomeDetailsScreenState createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(widget.appBarTitle),
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
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: "Info",
              ),
              Tab(
                text: "Fantasy",
              ),
              Tab(
                text: "Commentary",
              ),
              Tab(
                text: "Live",
              ),
              Tab(
                text: "Scorecard",
              ),
              Tab(
                text: "Graphs",
              ),
              Tab(
                text: "Points Table",
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
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
                            "NK",
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
                      SizedBox(
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
            ),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  InfoView(),
                  FantasyView(),
                  CommentaryView(),
                  LiveView(),
                  ScoreCardView(),
                  GraphView(),
                  PointTableView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
