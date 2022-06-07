import 'package:cricland/IPL/view/details_view/key_state_screen.dart';
import 'package:cricland/IPL/view/matches_tab.dart';
import 'package:cricland/IPL/view/widgets/featured_match_tile.dart';
import 'package:cricland/IPL/view/widgets/highest_score_&_six_card.dart';
import 'package:cricland/IPL/view/widgets/info_card_tile.dart';
import 'package:cricland/IPL/view/widgets/most_run_card.dart';
import 'package:cricland/IPL/view/widgets/most_wickets_card.dart';
import 'package:cricland/home/view/home_details_screen.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../public/variables/colors.dart';

class OverViewTab extends StatefulWidget {
  const OverViewTab({Key? key}) : super(key: key);

  @override
  _OverViewTabState createState() => _OverViewTabState();
}

class _OverViewTabState extends State<OverViewTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Matches",
                  style: TextStyle(
                    fontSize: dSize(.04),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "All Matches >",
                    style: TextStyle(
                      fontSize: dSize(.04),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                )
              ],
            ),
            ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return FeaturedMatchTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeDetailsScreen(
                              appBarTitle: 'GT vs RR, Final'),
                        ),
                      );
                    },
                    title: '',
                  );
                }),
            ListTile(
                leading: Text(
                  "Key Stats",
                  style: TextStyle(
                    fontSize: dSize(.04),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => KeyStateScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "See All >",
                    style: TextStyle(
                      fontSize: dSize(.04),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i <= 5; i++)
                    MostRunCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => KeyStateScreen(),
                          ),
                        );
                      },
                      title: 'Most Runs',
                      playerImageUrl: 'assets/player.png',
                      playerName: 'J Buttler',
                      teamName: 'Rajasthan Royals',
                      runs: '863',
                    ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MostWicketsCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => KeyStateScreen(),
                        ),
                      );
                    },
                    title: 'Most Wickets >',
                    playerImageUrl: 'assets/player.png',
                    playerName: 'RR',
                    teamName: 'Y Chahal',
                    wickets: '27',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MostWicketsCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => KeyStateScreen(),
                        ),
                      );
                    },
                    title: 'Most Wickets >',
                    playerImageUrl: 'assets/player.png',
                    playerName: 'RR',
                    teamName: 'Y Chahal',
                    wickets: '27',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            HighestScoreSix(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KeyStateScreen(),
                  ),
                );
              },
              title: 'Highest Score',
              playerName: 'J Buttler',
              teamName: 'RR',
              number: '863',
              numberFor: 'Runs',
            ),
            const SizedBox(
              height: 10,
            ),
            HighestScoreSix(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KeyStateScreen(),
                  ),
                );
              },
              title: 'Most Sixes >',
              playerName: 'J Buttler',
              teamName: 'RR',
              number: '45',
              numberFor: 'Sixes',
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Text(
                "Team Squads",
                style: TextStyle(
                  fontSize: dSize(.035),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i <= 5; i++)
                    GestureDetector(
                      onTap: () {
                        _showSquadsSheet(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: PublicController.pc.toggleCardBg(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/t20.png',
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "MI",
                                  style: TextStyle(
                                    fontSize: dSize(.04),
                                    fontWeight: FontWeight.w500,
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ListTile(
              leading: Text(
                "Series Info",
                style: TextStyle(
                  fontSize: dSize(.035),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            InfoCardTile(
              title: '',
              onTap: () {},
            ),
            ListTile(
              leading: Text(
                "More Seasons",
                style: TextStyle(
                  fontSize: dSize(.035),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      //TODO Screen overview top
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'IPL 2022',
                        style: TextStyle(
                          fontSize: dSize(.035),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: PublicController.pc.toggleTextColor())),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void _showSquadsSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return const FractionallySizedBox(
                heightFactor: 2.3,
                child: BottomSheetScreen(),
              );
            }));
  }
}

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _iplTabType = Variables.teamSquadsTabsCategory.first;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: Variables.teamSquadsTabsCategory.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: PublicController.pc.toggleCardBg(),
          automaticallyImplyLeading: false,
          title: Text(
            "Text Squads",
            style: TextStyle(
                color: PublicController.pc.toggleTextColor(), fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //   Navigator.pop(context);
              },
              child: Text(
                "Close",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
          bottom: _tabBar()),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1,
                              color: PublicController.pc.toggleTextColor(),
                            )),
                        child: Center(
                          child: Text(
                            "All(14)",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1,
                              color: PublicController.pc.toggleTextColor(),
                            )),
                        child: Center(
                          child: Text(
                            "Bat(04)",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1,
                              color: PublicController.pc.toggleTextColor(),
                            )),
                        child: Center(
                          child: Text(
                            "bowl(4)",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1,
                              color: PublicController.pc.toggleTextColor(),
                            )),
                        child: Center(
                          child: Text(
                            "AR(3)",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: 100,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            //TODO Screen overview top
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color:
                                        PublicController.pc.toggleTextColor())),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/player.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'S Brand',
                                        style: TextStyle(
                                          fontSize: dSize(.04),
                                          fontWeight: FontWeight.w500,
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                      Text(
                                        'Bowler',
                                        style: TextStyle(
                                          fontSize: dSize(.035),
                                          fontWeight: FontWeight.w500,
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1,
                              color: PublicController.pc.toggleTextColor(),
                            )),
                        child: Center(
                          child: Text(
                            "All(14)",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1,
                              color: PublicController.pc.toggleTextColor(),
                            )),
                        child: Center(
                          child: Text(
                            "Bat(04)",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1,
                              color: PublicController.pc.toggleTextColor(),
                            )),
                        child: Center(
                          child: Text(
                            "bowl(4)",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1,
                              color: PublicController.pc.toggleTextColor(),
                            )),
                        child: Center(
                          child: Text(
                            "AR(3)",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: 100,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            //TODO Screen overview top
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color:
                                        PublicController.pc.toggleTextColor())),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/player.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'S Brand',
                                        style: TextStyle(
                                          fontSize: dSize(.04),
                                          fontWeight: FontWeight.w500,
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                      Text(
                                        'Bowler',
                                        style: TextStyle(
                                          fontSize: dSize(.035),
                                          fontWeight: FontWeight.w500,
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
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
          tabs: Variables.teamSquadsTabsCategory
              .map<Widget>((String item) => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.01), horizontal: dSize(.02)),
                    child: Text(item),
                  ))
              .toList(),
        ),
      );
}
