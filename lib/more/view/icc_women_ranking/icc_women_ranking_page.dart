import 'package:cricland/more/controller/ranking_controller.dart';
import 'package:cricland/more/tile/ranking_tile.dart';
import 'package:cricland/more/tile/team_ranking_tile.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/style.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:cricland/public/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ICCWomenRankingPage extends StatefulWidget {
  const ICCWomenRankingPage({Key? key}) : super(key: key);

  @override
  State<ICCWomenRankingPage> createState() => _ICCWomenRankingPageState();
}

class _ICCWomenRankingPageState extends State<ICCWomenRankingPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    RankingController rankingController = Get.find();
    rankingController.womenPlayerTypeTabController =
        TabController(length: 4, vsync: this);

    ///Add listener to tabcontroller
    rankingController.womenPlayerTypeTabController.addListener(() async {
      if (rankingController.womenPlayerTypeTabController.index !=
          rankingController.womenPlayerTypeTabController.previousIndex) {
        await rankingController.getWomenRankingList();
      }
    });
    await rankingController.getWomenRankingList();
  }

  @override
  Widget build(BuildContext context) {
    final LanguageController lc = Get.find();
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
                            title: Text(lc.languageModel.value.iccWomenRanking!,
                                style: TextStyle(fontSize: dSize(.045))),
                            titleSpacing: -8.0,
                            floating: true,
                            pinned: true,
                            snap: false,
                            forceElevated: innerBoxIsScrolled,
                            bottom: _tabBar(rankingController, lc),
                          ),
                        ),
                      ];
                    },
                    body: _bodyUI(rankingController, lc),
                  )),
                  if (rankingController.bodyLoading.value) const LoadingWidget()
                ],
              ));
        });
  }

  Widget _bodyUI(RankingController rankingController, LanguageController lc) =>
      Column(
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
                          rankingController.selectedWomenGameType.value = item;
                          await rankingController.getWomenRankingList();
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
                                              .selectedWomenGameType.value
                                      ? AllColor.primaryColor
                                      : PublicController.pc.isLight.value
                                          ? Colors.grey
                                          : PublicController.pc.toggleCardBg(),
                                  width: 0.5),
                              color: item ==
                                      rankingController
                                          .selectedWomenGameType.value
                                  ? AllColor.primaryColor
                                  : PublicController.pc.toggleCardBg(),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(dSize(.02)))),
                          padding: EdgeInsets.symmetric(
                              vertical: dSize(.025), horizontal: dSize(.04)),
                          child: Text(
                            item,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: dSize(.035),
                                fontWeight: FontWeight.w500,
                                color: item ==
                                        rankingController
                                            .selectedWomenGameType.value
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
                  child: TabBarView(
                    controller: rankingController.womenPlayerTypeTabController,
                    children: [
                      _individualData(rankingController, lc),
                      _individualData(rankingController, lc),
                      _individualData(rankingController, lc),
                      _teamData(rankingController, lc)
                    ],
                  )))
        ],
      );

  Widget _teamData(
          RankingController rankingController, LanguageController lc) =>
      Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                            lc.languageModel.value.teamRankingTableHeader!
                                .first,
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)),
                    Expanded(
                        flex: 3,
                        child: Text(
                            lc.languageModel.value.teamRankingTableHeader![1],
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
                        child: Text(
                            lc.languageModel.value.teamRankingTableHeader![2],
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center)),
                    Expanded(
                        child: Text(
                            lc.languageModel.value.teamRankingTableHeader![3],
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center)),
                    Expanded(
                        child: Text(
                            lc.languageModel.value.teamRankingTableHeader!.last,
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
              itemCount: rankingController.womenTeamRankingList.length,
              itemBuilder: (context, index) => TeamRankingTile(
                  model: rankingController.womenTeamRankingList[index]),
              separatorBuilder: (context, index) => Divider(height: dSize(.12)),
            ),
          )
        ],
      );

  Widget _individualData(
          RankingController rankingController, LanguageController lc) =>
      Column(
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
                        child: Text(
                            lc.languageModel.value.playerRankingTableHeader!
                                .first,
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)),
                    Expanded(
                        flex: 3,
                        child: Text(
                            lc.languageModel.value.playerRankingTableHeader![1],
                            style: Style.titleStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                      lc.languageModel.value.playerRankingTableHeader!.last,
                      style: Style.titleStyle
                          .copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center)),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: dSize(.04)),
              physics: const BouncingScrollPhysics(),
              itemCount: rankingController.womenRankingList.length,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    rankingController.womenPlayerOnTap(
                        rankingController.womenRankingList[index].id!);
                  },
                  child: RankingTile(
                      model: rankingController.womenRankingList[index])),
              separatorBuilder: (context, index) => Divider(height: dSize(.12)),
            ),
          )
        ],
      );

  PreferredSize _tabBar(
          RankingController rankingController, LanguageController lc) =>
      PreferredSize(
        preferredSize: Size.fromHeight(dSize(.1)),
        child: TabBar(
          onTap: (covariant) async {
            rankingController.womenPlayerTypeTabController.index = covariant;
          },
          isScrollable: true,
          controller: rankingController.womenPlayerTypeTabController,
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
          tabs: lc.languageModel.value.manCategoryList!
              .map<Widget>((String item) => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.01), horizontal: dSize(.02)),
                    child: Text(item),
                  ))
              .toList(),
        ),
      );
}
