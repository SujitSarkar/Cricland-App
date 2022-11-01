import 'package:cricland/more/controller/ranking_controller.dart';
import 'package:cricland/more/model/ranking_model.dart';
import 'package:cricland/more/tile/ranking_tile.dart';
import 'package:cricland/more/tile/team_ranking_tile.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_details.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/style.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:cricland/public/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ICCManRankingPage extends StatefulWidget {
  const ICCManRankingPage({Key? key}) : super(key: key);

  @override
  State<ICCManRankingPage> createState() => _ICCManRankingPageState();
}

class _ICCManRankingPageState extends State<ICCManRankingPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    RankingController rankingController = Get.find();
    rankingController.manPlayerTypeTabController =
        TabController(length: 4, vsync: this);

    ///Add listener to tabcontroller
    rankingController.manPlayerTypeTabController.addListener(() async {
      if (rankingController.manPlayerTypeTabController.index !=
          rankingController.manPlayerTypeTabController.previousIndex) {
        await rankingController.getManRankingList();
      }
    });
    await rankingController.initData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankingController>(
        init: RankingController(),
        builder: (rankingController) {
          return Obx(() => Stack(
                children: [
                  Scaffold(
                      body: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                          sliver: SliverAppBar(
                            title: Text('ICC Men\'s Rankings',
                                style: TextStyle(fontSize: dSize(.045))),
                            titleSpacing: -8.0,
                            floating: true,
                            pinned: true,
                            snap: false,
                            forceElevated: innerBoxIsScrolled,
                            bottom: _tabBar(rankingController),
                          ),
                        ),
                      ];
                    },
                    body: _bodyUI(rankingController),
                  )),
                  if (rankingController.bodyLoading.value) const LoadingWidget()
                ],
              ));
        });
  }

  Widget _bodyUI(RankingController rankingController) => Column(
        children: [
          SizedBox(height: dSize(.19)),

          ///GameType TabBar
          Padding(
            padding: EdgeInsets.all(dSize(.04)),
            child: Row(
              children: Variables.manGameType
                  .map((item) => Expanded(
                          child: InkWell(
                        onTap: () async {
                          rankingController.selectedManGameType.value = item;
                          await rankingController.getManRankingList();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              right: item == Variables.manGameType[0] ||
                                      item == Variables.manGameType[1]
                                  ? dSize(.03)
                                  : 0.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: item ==
                                          rankingController
                                              .selectedManGameType!.value
                                      ? AllColor.primaryColor
                                      : PublicController.pc.isLight.value
                                          ? Colors.grey
                                          : PublicController.pc.toggleCardBg(),
                                  width: 0.5),
                              color: item ==
                                      rankingController
                                          .selectedManGameType!.value
                                  ? AllColor.primaryColor
                                  : PublicController.pc.toggleCardBg(),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(dSize(.02)))),
                          padding: EdgeInsets.symmetric(
                              vertical: dSize(.015), horizontal: dSize(.04)),
                          child: Text(
                            item,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: dSize(.035),
                                fontWeight: FontWeight.w500,
                                color: item ==
                                        rankingController
                                            .selectedManGameType!.value
                                    ? Colors.white
                                    : PublicController.pc.toggleTextColor()),
                          ),
                        ),
                      )))
                  .toList(),
            ),
          ),

          ///Data Title
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
            child: rankingController.manPlayerTypeTabController.index == 3
                ? _teamData(rankingController)
                : _individualData(rankingController),
          ))
        ],
      );

  Widget _teamData(RankingController rankingController) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('Rank',
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)),
                    Expanded(
                        flex: 3,
                        child: Text('Team',
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Text('Matches',
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center)),
                    Expanded(
                        child: Text('Points',
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center)),
                    Expanded(
                        child: Text('Ratings',
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center)),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: dSize(.04)),
              physics: const BouncingScrollPhysics(),
              itemCount: rankingController.manTeamRankingList.length,
              itemBuilder: (context, index) => TeamRankingTile(
                  model: rankingController.manTeamRankingList[index]),
              separatorBuilder: (context, index) => Divider(height: dSize(.12)),
            ),
          )
        ],
      );

  Widget _individualData(RankingController rankingController) => Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('Rank',
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)),
                    Expanded(
                        flex: 3,
                        child: Text('Player',
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text('Ratings',
                      style: Style.titleStyle
                          .copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center)),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: dSize(.04)),
              physics: const BouncingScrollPhysics(),
              itemCount: rankingController.manRankingList.length,
              itemBuilder: (context, index) =>
                  RankingTile(model: rankingController.manRankingList[index]),
              separatorBuilder: (context, index) => Divider(height: dSize(.12)),
            ),
          )
        ],
      );

  PreferredSize _tabBar(RankingController rankingController) => PreferredSize(
        preferredSize: Size.fromHeight(dSize(.1)),
        child: TabBar(
          onTap: (covariant) async {
            rankingController.manPlayerTypeTabController.index = covariant;
          },
          isScrollable: true,
          controller: rankingController.manPlayerTypeTabController,
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
          tabs: Variables.manCategoryList
              .map<Widget>((String item) => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.01), horizontal: dSize(.02)),
                    child: Text(item),
                  ))
              .toList(),
        ),
      );
}
