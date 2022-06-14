import 'package:cricland/more/view/icc_man_ranking/player_details/player_info.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_matches.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_overview.dart';
import 'package:cricland/news/view/news_page.dart';
import 'package:flutter/material.dart';
import '../../../../public/controller/public_controller.dart';
import '../../../../public/variables/colors.dart';
import '../../../../public/variables/config.dart';
import '../../../../public/variables/variable.dart';

class PlayerDetailsPage extends StatefulWidget {
  const PlayerDetailsPage({Key? key}) : super(key: key);

  @override
  State<PlayerDetailsPage> createState() => _PlayerDetailsPageState();
}

class _PlayerDetailsPageState extends State<PlayerDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Variables.playerDetails.length, vsync: this);
  }

  final TextStyle _titleStyle = TextStyle(
      fontSize: dSize(.055),
      fontWeight: FontWeight.w500,
      color: AllColor.darkTextColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                // title: const Text('Books'),
                floating: true,
                pinned: true,
                snap: false,
                forceElevated: innerBoxIsScrolled,
                expandedHeight: dSize(.52),
                flexibleSpace: Stack(
                  children: [
                    Positioned.fill(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: dSize(.055)),
                            child: RichText(
                              text: TextSpan(
                                style: _titleStyle,
                                children: [
                                  const TextSpan(text: 'Sakib Al Hasan\n\n'),
                                  TextSpan(
                                      text: 'Bangladesh * 35 yrs',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: dSize(.035))),
                                ],
                              ),
                            )),
                        Image.asset('assets/player.png',
                            height: 150, fit: BoxFit.fitHeight),
                      ],
                    ))
                  ],
                ),
                bottom: _tabBar(),
              ),
            ),
          ];
        },
        body: _bodyUI(),
      ),
    );
  }

  Widget _bodyUI() => TabBarView(
        controller: _tabController,
        children: [
          PlayerOverview(),
          PlayerMatches(),
          NewsPage(),
          PlayerInfo(),
        ],
      );

  PreferredSize _tabBar() => PreferredSize(
        preferredSize: Size.fromHeight(dSize(.3)),
        child: Container(
          color: AllColor.appDarkBg,
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
            unselectedLabelColor: Colors.grey.shade400,
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: dSize(.045)),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: dSize(.045)),
            indicatorSize: TabBarIndicatorSize.label,
            physics: const BouncingScrollPhysics(),
            tabs: Variables.playerDetails
                .map<Widget>((String item) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: dSize(.01), horizontal: dSize(.02)),
                      child: Text(item),
                    ))
                .toList(),
          ),
        ),
      );
}
