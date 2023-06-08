import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/info_tab.dart';
import 'package:cricland/IPL/view/matches_tab.dart';
import 'package:cricland/IPL/view/over_view_tab.dart';
import 'package:cricland/IPL/view/points_table_tab.dart';
import 'package:cricland/IPL/view/squads_tab.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/public/widgets/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/model/rapid_model/series_model.dart';
import '../../public/controller/language_controller.dart';

class IPLPage extends StatefulWidget {
  const IPLPage({
    Key? key,
  }) : super(key: key);

  @override
  _IPLPageState createState() => _IPLPageState();
}

class _IPLPageState extends State<IPLPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final String _iplTabType = Variables.iplTabsCategory.first;
  SeriesListModel seriesListModel = SeriesListModel();

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Variables.iplTabsCategory.length, vsync: this);
    fetchData("");
  }

  fetchData(String seriesId) async {
    HomeController homeController = Get.put(HomeController());
    String sID =
        homeController.rapidFeatureSeriesList.first.seriesModel!.id.toString();
    if (seriesId.isEmpty) {
      seriesId = sID;
    }
    await homeController.getSeriesMatches(seriesId);
    await homeController.getMatchSquad(seriesId);
    await homeController.getPointTable(seriesId);

    setState(() {});
  }

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final LanguageController lc = Get.find();
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
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
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(children: [
                                    for (var series in homeController
                                        .rapidFeatureSeriesList)
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            seriesListModel = series;
                                          });
                                          fetchData(
                                              "${seriesListModel.seriesModel!.id}");
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                border:
                                                    seriesListModel == series
                                                        ? Border.all(
                                                            color: Colors.green)
                                                        : null),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          ApiEndpoints
                                                                  .imageMidPoint +
                                                              "${series.seriesModel!.id}" +
                                                              ApiEndpoints
                                                                  .imageLastPoint,
                                                          headers: ApiEndpoints
                                                              .headers,
                                                        ),
                                                        fit: BoxFit.fill,
                                                        filterQuality:
                                                            FilterQuality.low),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                  ])),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: RichText(
                                  text: TextSpan(
                                    text: homeController
                                            .rapidSeriesMatchList.isEmpty
                                        ? ""
                                        : "${homeController.rapidSeriesMatchList.first.matchInfo!.seriesName}",
                                    //seriesListModel.seriesModel != null?'${seriesListModel.seriesModel!.name}':"",
                                    style:
                                        AppTextStyle().largeTitleStyle.copyWith(
                                              color: Colors.white70,
                                              fontSize: dSize(.035),
                                            ),

                                    // children: <TextSpan>[
                                    //   TextSpan(
                                    //       text:
                                    //           '${seriesListModel.date}',

                                    //  ],
                                  ),
                                ),
                              )
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
                            color: PublicController.pc.isLight.value? PublicController.pc.toggleTabColor():null,
                            gradient: !PublicController.pc.isLight.value? StDecoration().tabBarGradient:null
                        ),
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
                      scrollController: controller,
                    ),
                    MatchesTab(
                      scrollController: controller,
                    ),
                    SquadsTab(
                      scrollController: controller,
                    ),
                    SeriesPointsTableTab(
                      scrollController: controller,
                    ),
                    SeriesInfoTab(
                      scrollController: controller,
                    )
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
