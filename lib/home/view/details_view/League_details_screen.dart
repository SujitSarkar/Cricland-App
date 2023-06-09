import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/over_view_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../public/controller/language_controller.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/colors.dart';
import '../../../public/variables/config.dart';
import '../../../public/variables/variable.dart';
import '../../../public/widgets/app_text_style.dart';
import '../../../public/widgets/decoration.dart';
import '../../controller/home_controller.dart';
import '../../model/monk/live_response_data.dart';

class LeagueDetailsScreen extends StatefulWidget {
  final ScrollController scrollController;
  final LiveResponseData liveObjectData;

  const LeagueDetailsScreen(
      {Key? key, required this.liveObjectData, required this.scrollController})
      : super(
          key: key,
        );

  @override
  State<LeagueDetailsScreen> createState() => _LeagueDetailsScreenState();
}

class _LeagueDetailsScreenState extends State<LeagueDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Variables.iplTabsCategory.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final LanguageController lc = Get.find();
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: dSize(1),
                decoration: StDecoration().sliverAppbarGradient,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    homeController.isScroll == true.obs
                        ? const SizedBox()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: AllColor.appLightBg,
                                  ),
                                ),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget
                                                    .liveObjectData.leagueName,
                                                style: AppTextStyle()
                                                    .largeTitleStyle
                                                    .copyWith(
                                                        color: AllColor
                                                            .lightCardHeader),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '07 Jun to 11 Jun 2023',
                                                style: AppTextStyle()
                                                    .bodyTextStyle
                                                    .copyWith(
                                                        color: AllColor
                                                            .lightCardHeader),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            border: Border.all(
                                                color: Colors.green)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              height: 80,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            widget
                                                                .liveObjectData
                                                                .leagueImage),
                                                    fit: BoxFit.fill,
                                                    filterQuality:
                                                        FilterQuality.low),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                    SizedBox(
                      height: dSize(.01),
                    ),
                    TabBar(
                        onTap: (covariant) async {
                          setState(() => _tabController.index = covariant);
                        },
                        isScrollable: true,
                        controller: _tabController,
                        labelColor: PublicController.pc.toggleLoadingColor(),
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                dSize(.02),
                              ),
                              topRight: Radius.circular(
                                dSize(.02),
                              ),
                            ),
                            color: PublicController.pc.isLight.value
                                ? PublicController.pc.toggleTabColor()
                                : null,
                            gradient: !PublicController.pc.isLight.value
                                ? StDecoration().tabBarGradient
                                : null),
                        unselectedLabelColor: Colors.white,
                        unselectedLabelStyle:
                            AppTextStyle().largeTitleBoldStyle,
                        labelStyle: AppTextStyle().largeTitleBoldStyle,
                        indicatorSize: TabBarIndicatorSize.label,
                        physics: const BouncingScrollPhysics(),
                        tabs: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: dSize(.01),
                                horizontal: dSize(.02),
                              ),
                              child: Text(
                                lc.languageModel.value.overview!,
                                style: AppTextStyle().largeTitleStyle,
                                // 'Live (${homeController.liveMatchesModel.typeMatches != null ? homeController.liveMatchesModel.typeMatches!.length : "0"})',
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: dSize(.01),
                              horizontal: dSize(.02),
                            ),
                            child: Text(
                              lc.languageModel.value.matches!,
                              style: AppTextStyle().largeTitleStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: dSize(.01),
                              horizontal: dSize(.02),
                            ),
                            child: Text(
                              lc.languageModel.value.squad!,
                              style: AppTextStyle().largeTitleStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: dSize(.01),
                              horizontal: dSize(.02),
                            ),
                            child: Text(
                              lc.languageModel.value.pointsTable!,
                              style: AppTextStyle().largeTitleStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: dSize(.01),
                              horizontal: dSize(.02),
                            ),
                            child: Text(
                              lc.languageModel.value.info!,
                              style: AppTextStyle().largeTitleStyle,
                            ),
                          ),
                        ]
                        // Variables.iplTabsCategory
                        //   .map<Widget>(
                        //     (String item) => Padding(
                        //       padding: EdgeInsets.symmetric(
                        //         vertical: dSize(.01),
                        //         horizontal: dSize(.02),
                        //       ),
                        //       child: Text(
                        //         item,
                        //         style: AppTextStyle().largeTitleStyle,
                        //       ),
                        //     ),
                        //   )
                        //   .toList(),
                        ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    OverViewTab(
                      scrollController: widget.scrollController,
                      liveObjectData: widget.liveObjectData,
                    ),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    // MatchesTab(
                    //   scrollController: controller,
                    // ),
                    // SquadsTab(
                    //   scrollController: controller,
                    // ),
                    // SeriesPointsTableTab(
                    //   scrollController: controller,
                    // ),
                    // SeriesInfoTab(
                    //   scrollController: controller,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
