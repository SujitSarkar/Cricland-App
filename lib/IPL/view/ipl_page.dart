import 'package:cricland/IPL/view/info_tab.dart';
import 'package:cricland/IPL/view/matches_tab.dart';
import 'package:cricland/IPL/view/over_view_tab.dart';
import 'package:cricland/IPL/view/squads_tab.dart';
import 'package:cricland/home/view/details_view/points_table.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';

class IPLPage extends StatefulWidget {
  const IPLPage({
    Key? key,
  }) : super(key: key);

  @override
  _IPLPageState createState() => _IPLPageState();
}

class _IPLPageState extends State<IPLPage> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(220),
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
                                          border:
                                              Border.all(color: Colors.green)),
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
                Material(
                  color: AllColor.appDarkBg,
                  child: _tabBar(),
                ),
              ],
            ),
          )),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          OverViewTab(),
          MatchesTab(),
          SquadsTab(),
          PointTableView(),
          InfoTab(),
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
          tabs: Variables.iplTabsCategory
              .map<Widget>((String item) => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.01), horizontal: dSize(.02)),
                    child: Text(item),
                  ))
              .toList(),
        ),
      );
}
