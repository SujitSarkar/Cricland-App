import 'package:cricland/IPL/view/details_view/best_economy_tab.dart';
import 'package:cricland/IPL/view/details_view/best_fantacy_point_tab.dart';
import 'package:cricland/IPL/view/details_view/best_figure_tab.dart';
import 'package:cricland/IPL/view/details_view/highest_score_tab.dart';
import 'package:cricland/IPL/view/details_view/most_runs_tab.dart';
import 'package:cricland/IPL/view/details_view/most_wickets_tab.dart';
import 'package:cricland/IPL/view/details_view/strike_rate_tab.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';

import 'most_sixes_tab.dart';

class KeyStateScreen extends StatefulWidget {
  const KeyStateScreen({Key? key}) : super(key: key);

  @override
  _KeyStateScreenState createState() => _KeyStateScreenState();
}

class _KeyStateScreenState extends State<KeyStateScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _iplTabType = Variables.keyStateTabsCategory.first;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: Variables.keyStateTabsCategory.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("IPL 2022 Stats"),
          actions: [
            Center(child: Text('Seasons >')),
            SizedBox(
              width: 10,
            ),
          ],
          bottom: _tabBar()),
      body: TabBarView(
        controller: _tabController,
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
    );
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
          tabs: Variables.keyStateTabsCategory
              .map<Widget>((String item) => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.01), horizontal: dSize(.02)),
                    child: Text(item),
                  ))
              .toList(),
        ),
      );
}
