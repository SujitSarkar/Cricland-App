import 'package:cricland/IPL/view/details_view/best_economy_tab.dart';
import 'package:cricland/IPL/view/details_view/best_fantacy_point_tab.dart';
import 'package:cricland/IPL/view/details_view/best_figure_tab.dart';
import 'package:cricland/IPL/view/details_view/highest_score_tab.dart';
import 'package:cricland/IPL/view/details_view/most_runs_tab.dart';
import 'package:cricland/IPL/view/details_view/most_wickets_tab.dart';
import 'package:cricland/IPL/view/details_view/strike_rate_tab.dart';
import 'package:flutter/material.dart';

import 'most_sixes_tab.dart';

class KeyStateScreen extends StatefulWidget {
  const KeyStateScreen({Key? key}) : super(key: key);

  @override
  _KeyStateScreenState createState() => _KeyStateScreenState();
}

class _KeyStateScreenState extends State<KeyStateScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: Text("IPL 2022 Stats"),
          actions: [
            Center(child: Text('Seasons >')),
            SizedBox(
              width: 10,
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: "Most Runs",
              ),
              Tab(
                text: "Most Wickets",
              ),
              Tab(
                text: "Most Sixes",
              ),
              Tab(
                text: "Highest Score",
              ),
              Tab(
                text: "Best Figures",
              ),
              Tab(
                text: "Strike Rate",
              ),
              Tab(
                text: "Best Economy",
              ),
              Tab(
                text: "Best Fantasy Points",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MostRunTab(),
            MostWicketsTab(),
            MostSixesTab(),
            HighestScoreTab(),
            BestFigureTab(),
            StrikeRateTab(),
            BestEconomyTab(),
            BestFantasyPointTab(),
          ],
        ),
      ),
    );
  }
}
