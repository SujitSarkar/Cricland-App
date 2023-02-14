import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/info_tab.dart';
import 'package:cricland/IPL/view/matches_tab.dart';
import 'package:cricland/IPL/view/over_view_tab.dart';
import 'package:cricland/IPL/view/points_table_tab.dart';
import 'package:cricland/IPL/view/squads_tab.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/app_text_style.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../home/model/rapid_model/series_model.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SeriesScreenState createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final String _iplTabType = Variables.iplTabsCategory.first;
  SeriesListModel seriesListModel=SeriesListModel();
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Variables.iplTabsCategory.length, vsync: this);
    fetchData("");

  }


  fetchData(String seriesId) async {
    HomeController homeController = Get.put(HomeController());
    String sID = homeController.rapidFeatureSeriesList.first.seriesModel!.id.toString();
    if(seriesId.isEmpty){
      seriesId = sID;
    }
    await homeController.getSeriesMatches(seriesId);
    await homeController.getMatchSquad(seriesId);
    await homeController.getPointTable(seriesId);


    setState(() {});
  }


  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032), color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(

        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  flexibleSpace: innerBoxIsScrolled
                      ? SizedBox()
                      : Container(
                          color: AllColor.appDarkBg,
                          child: Column(
                            children: <Widget>[

                              Container(
                                  padding: const EdgeInsets.all(5),
                                  color: AllColor.appDarkBg,
                                  child:

                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            for (var series in homeController.rapidFeatureSeriesList)
                                              GestureDetector(
                                                onTap: (){
                                                  setState((){
                                                    seriesListModel = series;
                                                  });
                                                  fetchData("${seriesListModel.seriesModel!.id}");

                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        const BorderRadius
                                                            .all(
                                                            Radius
                                                                .circular(
                                                                10)),
                                                        border:seriesListModel == series? Border.all(
                                                            color: Colors
                                                                .green):null),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(3.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(10),
                                                        child: Container(
                                                          height: 100,
                                                          width: 100,
                                                          decoration:
                                                          BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            color:
                                                            Colors.white,
                                                            image:
                                                            DecorationImage(
                                                                image:
                                                                CachedNetworkImageProvider(
                                                                  ApiEndpoints.imageMidPoint +
                                                                      "${series.seriesModel!.id}" +
                                                                      ApiEndpoints.imageLastPoint,
                                                                  headers:
                                                                  ApiEndpoints.headers,
                                                                ),
                                                                fit: BoxFit
                                                                    .fill,
                                                                filterQuality:
                                                                FilterQuality
                                                                    .low),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                          ],
                                        ),
                                      ),

                                      innerBoxIsScrolled?const SizedBox():     Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: RichText(
                                          text: TextSpan(
                                             text:homeController.rapidSeriesMatchList.isEmpty?"": "${homeController.rapidSeriesMatchList.first.matchInfo!.seriesName}",
                                             //seriesListModel.seriesModel != null?'${seriesListModel.seriesModel!.name}':"",
                  style: AppTextStyle()
                      .largeTitleStyle
                      .copyWith(
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
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),

                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(
                        innerBoxIsScrolled ? dSize(.1) : dSize(.4)),
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
                                    vertical: dSize(.01),
                                    horizontal: dSize(.02)),
                                child: Text(
                                  item,
                                  style: AppTextStyle().largeTitleStyle,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ];
            },
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const <Widget>[
                        OverViewTab(),
                        MatchesTab(),
                        SquadsTab(),
                        SeriesPointsTableTab(),
                        SeriesInfoTab()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
