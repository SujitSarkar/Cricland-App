import 'package:cricland/more/view/icc_man_ranking/player_details/player_info.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_matches.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_news.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_overview.dart';
import 'package:flutter/material.dart';
import '../../../../public/variables/colors.dart';
import '../../../../public/variables/config.dart';
import '../../../../public/variables/variable.dart';

class PlayerDetailsPage extends StatefulWidget {
  const PlayerDetailsPage({Key? key}) : super(key: key);

  @override
  State<PlayerDetailsPage> createState() => _PlayerDetailsPageState();
}

class _PlayerDetailsPageState extends State<PlayerDetailsPage>  with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
                                children:[
                                  const TextSpan(text: 'Sakib Al Hasan\n\n'),
                                  TextSpan(text: 'Bangladesh * 35 yrs',
                                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: dSize(.035))),
                                ],
                              ),
                            )
                          ),
                          Image.asset('assets/bd_logo.png',height: 150,fit: BoxFit.fitHeight),
                        ],
                      )
                    )
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

  Widget _bodyUI()=>TabBarView(
    controller: _tabController,
    children: [
      PlayerOverview(),
      PlayerMatches(),
      PlayerNews(),
      PlayerInfo(),
    ],
  );

  PreferredSize _tabBar()=>PreferredSize(
    preferredSize: Size.fromHeight(dSize(.3)),
    child: Container(
      color: AllColor.appDarkBg,
      child: TabBar(
        onTap: (covariant) async {
          setState(() => _tabController.index = covariant);
        },
        isScrollable: true,
        controller: _tabController,
        indicator: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  width: 3.5,
                  color: AllColor.tabUnderlineColor,
                ))),
        indicatorSize: TabBarIndicatorSize.label,
        physics: const BouncingScrollPhysics(),
        tabs: Variables.playerDetails.map<Widget>((String item)=>
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(item),
                ],
              ),
            )).toList(),
      ),
    ),
  );
}
