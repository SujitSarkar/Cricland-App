import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/more/controller/ranking_controller.dart';
import 'package:cricland/more/tile/ranking_tile.dart';
import 'package:cricland/more/tile/team_ranking_tile.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:cricland/public/widgets/decoration.dart';
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
    final RankingController rankingController = Get.find();
    rankingController.manPlayerTypeTabController =
        TabController(length: 4, vsync: this);

    ///Add listener to tabcontroller
    rankingController.manPlayerTypeTabController.addListener(() async {
      if (rankingController.manPlayerTypeTabController.index !=
          rankingController.manPlayerTypeTabController.previousIndex) {
        await rankingController.getManRankingList();
      }
    });
    await rankingController.getManRankingList();
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
                              title: Text(lc.languageModel.value.iccMenRanking!,
                                  style: AppTextStyle()
                                      .largeTitleStyle
                                      .copyWith(color: Colors.white)),
                              flexibleSpace: Container(
                                decoration: StDecoration().sliverAppbarGradient,
                              ),
                              titleSpacing: -8.0,
                              floating: true,
                              pinned: true,
                              snap: false,
                              forceElevated: innerBoxIsScrolled,
                              bottom: _tabBar(rankingController, lc)),
                        ),
                      ];
                    },
                    body: _bodyUI(rankingController, lc),
                  )),
                  if (rankingController.bodyLoading.value) const LoadingPage()
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
                                              .selectedManGameType.value
                                      ? Colors.transparent
                                      : PublicController.pc.isLight.value
                                          ? Colors.grey
                                          : PublicController.pc.toggleCardBg(),
                                  width: 0.5),
                              gradient: item ==
                                      rankingController
                                          .selectedManGameType.value
                                  ? StDecoration().tabBarGradient
                                  : null,
                              color: item ==
                                      rankingController
                                          .selectedManGameType.value
                                  ? null
                                  : PublicController.pc.toggleCardBg(),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(dSize(.02)))),
                          padding: EdgeInsets.symmetric(
                              vertical: dSize(.025), horizontal: dSize(.04)),
                          child: Text(
                            item,
                            maxLines: 1,
                            style: AppTextStyle().bodyTextStyle.copyWith(
                                color: item ==
                                        rankingController
                                            .selectedManGameType.value
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
                      controller: rankingController.manPlayerTypeTabController,
                      children: [
                        _individualData(rankingController, lc),
                        _individualData(rankingController, lc),
                        _individualData(rankingController, lc),
                        _teamData(rankingController, lc),
                      ])))
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
                            style: AppTextStyle().titleTextStyle,
                            textAlign: TextAlign.start)),
                    Expanded(
                        flex: 3,
                        child: Text(
                            lc.languageModel.value.teamRankingTableHeader![1],
                            style: AppTextStyle().titleTextStyle,
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
                            style: AppTextStyle().titleTextStyle,
                            textAlign: TextAlign.center)),
                    Expanded(
                        child: Text(
                            lc.languageModel.value.teamRankingTableHeader![3],
                            style: AppTextStyle().titleTextStyle,
                            textAlign: TextAlign.center)),
                    Expanded(
                        child: Text(
                            lc.languageModel.value.teamRankingTableHeader!.last,
                            style: AppTextStyle().titleTextStyle,
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
                            style: AppTextStyle().titleTextStyle,
                            textAlign: TextAlign.start)),
                    Expanded(
                        flex: 3,
                        child: Text(
                            lc.languageModel.value.playerRankingTableHeader![1],
                            style: AppTextStyle().titleTextStyle,
                            textAlign: TextAlign.start)),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                      lc.languageModel.value.playerRankingTableHeader!.last,
                      style: AppTextStyle().titleTextStyle,
                      textAlign: TextAlign.center)),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: dSize(.04)),
              physics: const BouncingScrollPhysics(),
              itemCount: rankingController.manRankingList.length,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    rankingController.manPlayerOnTap(
                        rankingController.manRankingList[index].id!);
                  },
                  child: RankingTile(
                      model: rankingController.manRankingList[index])),
              separatorBuilder: (context, index) => Divider(height: dSize(.12)),
            ),
          )
        ],
      );

  PreferredSize _tabBar(
          RankingController rankingController, LanguageController lc) =>
      PreferredSize(
        preferredSize: const Size.fromHeight(30.2),
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
              color: PublicController.pc.isLight.value? PublicController.pc.toggleTabColor():null,
              gradient: !PublicController.pc.isLight.value? StDecoration().tabBarGradient:null
          ),
          unselectedLabelColor: Colors.grey.shade400,
          unselectedLabelStyle: AppTextStyle().largeTitleBoldStyle,
          labelStyle: AppTextStyle().largeTitleBoldStyle,
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
