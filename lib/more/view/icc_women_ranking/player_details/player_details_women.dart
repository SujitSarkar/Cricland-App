import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/home/model/player_info_model.dart';
import 'package:cricland/more/controller/ranking_controller.dart';
import 'package:cricland/more/view/icc_women_ranking/player_details/player_info_women.dart';
import 'package:cricland/more/view/icc_women_ranking/player_details/player_matches_women.dart';
import 'package:cricland/more/view/icc_women_ranking/player_details/player_overview_women.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/api_endpoint.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:cricland/public/widgets/decoration.dart';
import 'package:cricland/public/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PlayerDetailsPageWomen extends StatefulWidget {
  const PlayerDetailsPageWomen({Key? key}) : super(key: key);

  @override
  State<PlayerDetailsPageWomen> createState() => _PlayerDetailsPageWomenState();
}

class _PlayerDetailsPageWomenState extends State<PlayerDetailsPageWomen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Variables.playerDetails.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    RankingController.instance.playerInfoModel.value = PlayerInfoModel();
  }

  @override
  Widget build(BuildContext context) {
    final RankingController rankingController = Get.find();
    return Obx(() => Stack(
          children: [
            Scaffold(
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverAppBar(
                        floating: true,
                        pinned: true,
                        snap: false,
                        forceElevated: innerBoxIsScrolled,
                        expandedHeight: dSize(.52),
                        flexibleSpace: Container(
                          decoration:StDecoration().sliverAppbarGradient,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: rankingController
                                              .playerInfoModel.value.name !=
                                          null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: dSize(.055)),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      style: AppTextStyle()
                                                          .largeTitleStyle
                                                          .copyWith(
                                                              color: Colors.white,
                                                              fontSize:
                                                                  dSize(.055)),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                '${rankingController.playerInfoModel.value.name} \n\n'),
                                                        TextSpan(
                                                            text:
                                                                '${rankingController.playerInfoModel.value.intlTeam} \n${rankingController.playerInfoModel.value.doB}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    dSize(.035))),
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(80)),
                                              child: CachedNetworkImage(
                                                  imageUrl: ApiEndpoint.imageUrl(
                                                      rankingController
                                                              .playerInfoModel
                                                              .value
                                                              .faceImageId ??
                                                          '',
                                                      p: 'de'),
                                                  httpHeaders: ApiEndpoint.header,
                                                  fit: BoxFit.fill,
                                                  height: 130,
                                                  width: 130,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const Icon(Icons.error,
                                                              size: 120,
                                                              color: Colors.grey),
                                                  placeholder: (context, url) =>
                                                      const Icon(Icons.image,
                                                          size: 120,
                                                          color: Colors.grey)),
                                            ),
                                          ],
                                        )
                                      : const SizedBox.shrink())
                            ],
                          ),
                        ),
                        bottom: _tabBar(),
                      ),
                    ),
                  ];
                },
                body: _bodyUI(),
              ),
            ),
            if (rankingController.bodyLoading.value) const LoadingWidget()
          ],
        ));
  }

  Widget _bodyUI() => TabBarView(
        controller: _tabController,
        children: [
          PlayerOverviewWomen(),
          PlayerMatchesWomen(),
          // NewsPage(),
          PlayerInfoWomen(),
        ],
      );

  PreferredSize _tabBar() => PreferredSize(
        preferredSize: Size.fromHeight(dSize(.3)),
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
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: dSize(.045),
              color: Colors.white),
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
      );
}
