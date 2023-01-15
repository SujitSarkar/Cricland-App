import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/info_tab.dart';
import 'package:cricland/IPL/view/matches_tab.dart';
import 'package:cricland/IPL/view/over_view_tab.dart';
import 'package:cricland/IPL/view/points_table_tab.dart';
import 'package:cricland/IPL/view/squads_tab.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SeriesScreen extends StatefulWidget {
  final String? seriesID;
  final String? matchId;

  const SeriesScreen({
    Key? key,
    this.seriesID,
    this.matchId,
  }) : super(key: key);

  @override
  _SeriesScreenState createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final String _iplTabType = Variables.iplTabsCategory.first;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Variables.iplTabsCategory.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        // appBar: PreferredSize(
        //     preferredSize: Size.fromHeight(200),
        //     child: Container(
        //       color: AllColor.appDarkBg,
        //       child: Column(
        //         children: <Widget>[
        //           widget.seriesID != null
        //               ? Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: InkWell(
        //                     onTap: () {
        //                       Navigator.pop(context);
        //                     },
        //                     child: const Icon(
        //                       Icons.arrow_back,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 )
        //               : const SizedBox(),
        //           Container(
        //             padding: const EdgeInsets.all(5),
        //             color: AllColor.appDarkBg,
        //             child: widget.seriesID == null
        //                 ? Column(
        //                     children: [
        //                       SizedBox(
        //                         height: MediaQuery.of(context).size.width * .06,
        //                       ),
        //                       SingleChildScrollView(
        //                         scrollDirection: Axis.horizontal,
        //                         child: Row(
        //                           children: [
        //                             Row(
        //                               children: [
        //                                 for (var i = 0;
        //                                     i <
        //                                         homeController
        //                                             .featureSeriesModel
        //                                             .seriesMapProto![1]
        //                                             .series!
        //                                             .length;
        //                                     i++)
        //                                   Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Container(
        //                                       decoration: BoxDecoration(
        //                                           borderRadius:
        //                                               const BorderRadius.all(
        //                                                   Radius.circular(10)),
        //                                           border: Border.all(
        //                                               color: Colors.green)),
        //                                       child: Padding(
        //                                         padding:
        //                                             const EdgeInsets.all(3.0),
        //                                         child: ClipRRect(
        //                                           borderRadius:
        //                                               BorderRadius.circular(10),
        //                                           child: Container(
        //                                             height: 100,
        //                                             width: 100,
        //                                             decoration: BoxDecoration(
        //                                               shape: BoxShape.rectangle,
        //                                               color: Colors.white,
        //                                               image: DecorationImage(
        //                                                   image:
        //                                                       CachedNetworkImageProvider(
        //                                                     ApiEndpoints
        //                                                             .imageMidPoint +
        //                                                         "${homeController.featureSeriesModel.seriesMapProto![1].series![i].id}" +
        //                                                         ApiEndpoints
        //                                                             .imageLastPoint,
        //                                                     headers:
        //                                                         ApiEndpoints
        //                                                             .headers,
        //                                                   ),
        //                                                   fit: BoxFit.fill,
        //                                                   filterQuality:
        //                                                       FilterQuality
        //                                                           .low),
        //                                             ),
        //                                           ),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                               ],
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: MediaQuery.of(context).size.width * .05,
        //                       ),
        //                       RichText(
        //                         text: TextSpan(
        //                           text:
        //                               '${homeController.featureSeriesModel.seriesMapProto![1].series![1].name} ',
        //                           style: CLTextStyle.paragraphHeadLineTextStyle
        //                               .copyWith(
        //                             color: Colors.white70,
        //                           ),
        //                           children: <TextSpan>[
        //                             TextSpan(
        //                                 text:
        //                                     '${homeController.featureSeriesModel.seriesMapProto![1].date}',
        //                                 style: CLTextStyle
        //                                     .paragraphHeadLineTextStyle
        //                                     .copyWith(
        //                                   color: Colors.white70,
        //                                   fontSize: dSize(.02),
        //                                 )),
        //                           ],
        //                         ),
        //                       ),
        //                     ],
        //                   )
        //                 : Align(
        //                     alignment: Alignment.center,
        //                     child: homeController
        //                                 .seriesMatchListModel.matchDetails !=
        //                             null
        //                         ? Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.center,
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               const SizedBox(
        //                                 height: 40,
        //                               ),
        //                               Align(
        //                                 alignment: Alignment.center,
        //                                 child: Row(
        //                                   crossAxisAlignment:
        //                                       CrossAxisAlignment.center,
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.spaceEvenly,
        //                                   children: [
        //                                     Flexible(
        //                                       child: Column(
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.start,
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment.center,
        //                                         children: [
        //                                           Text(
        //                                             homeController
        //                                                 .seriesMatchListModel
        //                                                 .matchDetails!
        //                                                 .first
        //                                                 .matchDetailsMap!
        //                                                 .match!
        //                                                 .first
        //                                                 .matchInfo!
        //                                                 .seriesName!,
        //                                             // "The Hundred 2022",
        //                                             style: const TextStyle(
        //                                                 fontSize: 20,
        //                                                 fontWeight:
        //                                                     FontWeight.bold,
        //                                                 color: Colors.white),
        //                                           ),
        //                                           Text(
        //                                             homeController
        //                                                 .seriesMatchListModel
        //                                                 .matchDetails!
        //                                                 .first
        //                                                 .matchDetailsMap!
        //                                                 .key!,
        //                                             // "032 Aug to 03 Sep 2022",
        //                                             style: const TextStyle(
        //                                                 fontSize: 12,
        //                                                 fontWeight:
        //                                                     FontWeight.normal,
        //                                                 color: Colors.grey),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     Container(
        //                                       height: 80,
        //                                       width: 80,
        //                                       decoration: const BoxDecoration(
        //                                         shape: BoxShape.rectangle,
        //                                         image: DecorationImage(
        //                                             image:
        //                                                 CachedNetworkImageProvider(
        //                                               ApiEndpoints
        //                                                       .imageMidPoint +
        //                                                   "189174" +
        //                                                   ApiEndpoints
        //                                                       .imageLastPoint,
        //                                               headers:
        //                                                   ApiEndpoints.headers,
        //                                             ),
        //                                             fit: BoxFit.fill),
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ],
        //                           )
        //                         : const CircularProgressIndicator(),
        //                   ),
        //           ),
        //         ],
        //       ),
        //     )),
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
                              // widget.seriesID != null
                              //     ? Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: InkWell(
                              //     onTap: () {
                              //       Navigator.pop(context);
                              //     },
                              //     child: const Icon(
                              //       Icons.arrow_back,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // )
                              //     : const SizedBox(),
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  color: AllColor.appDarkBg,
                                  child:
                                      //             widget.seriesID != null
                                      //                 ? Align(
                                      // alignment: Alignment.center,
                                      // child: homeController
                                      //     .seriesMatchListModel.matchDetails !=
                                      // null
                                      // ? Column(
                                      // crossAxisAlignment:
                                      // CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      // children: [
                                      // const SizedBox(
                                      // height: 40,
                                      // ),
                                      // Align(
                                      // alignment: Alignment.center,
                                      // child: Row(
                                      // crossAxisAlignment:
                                      // CrossAxisAlignment.center,
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.spaceEvenly,
                                      // children: [
                                      // Flexible(
                                      // child: Column(
                                      // crossAxisAlignment:
                                      // CrossAxisAlignment.start,
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.center,
                                      // children: [
                                      // Text(
                                      // homeController
                                      //     .seriesMatchListModel
                                      //     .matchDetails!
                                      //     .first
                                      //     .matchDetailsMap!
                                      //     .match!
                                      //     .first
                                      //     .matchInfo!
                                      //     .seriesName!,
                                      // // "The Hundred 2022",
                                      // style: const TextStyle(
                                      // fontSize: 20,
                                      // fontWeight:
                                      // FontWeight.bold,
                                      // color: Colors.white),
                                      // ),
                                      // Text(
                                      // homeController
                                      //     .seriesMatchListModel
                                      //     .matchDetails!
                                      //     .first
                                      //     .matchDetailsMap!
                                      //     .key!,
                                      // // "032 Aug to 03 Sep 2022",
                                      // style: const TextStyle(
                                      // fontSize: 12,
                                      // fontWeight:
                                      // FontWeight.normal,
                                      // color: Colors.grey),
                                      // ),
                                      // ],
                                      // ),
                                      // ),
                                      // Container(
                                      // height: 80,
                                      // width: 80,
                                      // decoration: const BoxDecoration(
                                      // shape: BoxShape.rectangle,
                                      // image: DecorationImage(
                                      // image:
                                      // CachedNetworkImageProvider(
                                      // ApiEndpoints
                                      //     .imageMidPoint +
                                      // "189174" +
                                      // ApiEndpoints
                                      //     .imageLastPoint,
                                      // headers:
                                      // ApiEndpoints.headers,
                                      // ),
                                      // fit: BoxFit.fill),
                                      // ),
                                      // ),
                                      // ],
                                      // ),
                                      // ),
                                      // ],
                                      // )
                                      //     : const CircularProgressIndicator(),
                                      // )
                                      //                 :
                                      Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            for (var i = 0;
                                                i <
                                                    homeController
                                                        .featureSeriesModel
                                                        .seriesMapProto![1]
                                                        .series!
                                                        .length;
                                                i++)
                                              Padding(
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
                                                      border: Border.all(
                                                          color: Colors
                                                              .green)),
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
                                                                        "${homeController.featureSeriesModel.seriesMapProto![1].series![i].id}" +
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
                                          ],
                                        ),
                                      ),

                                      innerBoxIsScrolled?const SizedBox():     RichText(
                                        text: TextSpan(
                                          text:
                                              '${homeController.featureSeriesModel.seriesMapProto![1].series!.first.name} ',
                                          style: CLTextStyle
                                              .paragraphHeadLineTextStyle
                                              .copyWith(
                                            color: Colors.white70,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    '${homeController.featureSeriesModel.seriesMapProto![1].date}',
                                                style: CLTextStyle
                                                    .paragraphHeadLineTextStyle
                                                    .copyWith(
                                                  color: Colors.white70,
                                                  fontSize: dSize(.02),
                                                )),
                                           ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                  //     title:innerBoxIsScrolled? const SizedBox(): Container(
                  //       color: AllColor.appDarkBg,
                  //       child: Column(
                  //         children: <Widget>[
                  //           // widget.seriesID != null
                  //           //     ? Align(
                  //           //   alignment: Alignment.centerLeft,
                  //           //   child: InkWell(
                  //           //     onTap: () {
                  //           //       Navigator.pop(context);
                  //           //     },
                  //           //     child: const Icon(
                  //           //       Icons.arrow_back,
                  //           //       color: Colors.white,
                  //           //     ),
                  //           //   ),
                  //           // )
                  //           //     : const SizedBox(),
                  //           Container(
                  //             padding: const EdgeInsets.all(5),
                  //             color: AllColor.primaryColor,
                  //             child:
                  // //             widget.seriesID != null
                  // //                 ? Align(
                  // // alignment: Alignment.center,
                  // // child: homeController
                  // //     .seriesMatchListModel.matchDetails !=
                  // // null
                  // // ? Column(
                  // // crossAxisAlignment:
                  // // CrossAxisAlignment.center,
                  // // mainAxisAlignment: MainAxisAlignment.center,
                  // // children: [
                  // // const SizedBox(
                  // // height: 40,
                  // // ),
                  // // Align(
                  // // alignment: Alignment.center,
                  // // child: Row(
                  // // crossAxisAlignment:
                  // // CrossAxisAlignment.center,
                  // // mainAxisAlignment:
                  // // MainAxisAlignment.spaceEvenly,
                  // // children: [
                  // // Flexible(
                  // // child: Column(
                  // // crossAxisAlignment:
                  // // CrossAxisAlignment.start,
                  // // mainAxisAlignment:
                  // // MainAxisAlignment.center,
                  // // children: [
                  // // Text(
                  // // homeController
                  // //     .seriesMatchListModel
                  // //     .matchDetails!
                  // //     .first
                  // //     .matchDetailsMap!
                  // //     .match!
                  // //     .first
                  // //     .matchInfo!
                  // //     .seriesName!,
                  // // // "The Hundred 2022",
                  // // style: const TextStyle(
                  // // fontSize: 20,
                  // // fontWeight:
                  // // FontWeight.bold,
                  // // color: Colors.white),
                  // // ),
                  // // Text(
                  // // homeController
                  // //     .seriesMatchListModel
                  // //     .matchDetails!
                  // //     .first
                  // //     .matchDetailsMap!
                  // //     .key!,
                  // // // "032 Aug to 03 Sep 2022",
                  // // style: const TextStyle(
                  // // fontSize: 12,
                  // // fontWeight:
                  // // FontWeight.normal,
                  // // color: Colors.grey),
                  // // ),
                  // // ],
                  // // ),
                  // // ),
                  // // Container(
                  // // height: 80,
                  // // width: 80,
                  // // decoration: const BoxDecoration(
                  // // shape: BoxShape.rectangle,
                  // // image: DecorationImage(
                  // // image:
                  // // CachedNetworkImageProvider(
                  // // ApiEndpoints
                  // //     .imageMidPoint +
                  // // "189174" +
                  // // ApiEndpoints
                  // //     .imageLastPoint,
                  // // headers:
                  // // ApiEndpoints.headers,
                  // // ),
                  // // fit: BoxFit.fill),
                  // // ),
                  // // ),
                  // // ],
                  // // ),
                  // // ),
                  // // ],
                  // // )
                  // //     : const CircularProgressIndicator(),
                  // // )
                  // //                 :
                  //             Column(
                  //     children: [
                  //
                  //   SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: Row(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             for (var i = 0;
                  //             i <
                  //                 homeController
                  //                     .featureSeriesModel
                  //                     .seriesMapProto![1]
                  //                     .series!
                  //                     .length;
                  //             i++)
                  //               Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Container(
                  //                   decoration: BoxDecoration(
                  //                       borderRadius:
                  //                       const BorderRadius.all(
                  //                           Radius.circular(10)),
                  //                       border: Border.all(
                  //                           color: Colors.green)),
                  //                   child: Padding(
                  //                     padding:
                  //                     const EdgeInsets.all(3.0),
                  //                     child: ClipRRect(
                  //                       borderRadius:
                  //                       BorderRadius.circular(10),
                  //                       child: Container(
                  //                         height: 100,
                  //                         width: 100,
                  //                         decoration: BoxDecoration(
                  //                           shape: BoxShape.rectangle,
                  //                           color: Colors.white,
                  //                           image: DecorationImage(
                  //                               image:
                  //                               CachedNetworkImageProvider(
                  //                                 ApiEndpoints
                  //                                     .imageMidPoint +
                  //                                     "${homeController.featureSeriesModel.seriesMapProto![1].series![i].id}" +
                  //                                     ApiEndpoints
                  //                                         .imageLastPoint,
                  //                                 headers:
                  //                                 ApiEndpoints
                  //                                     .headers,
                  //                               ),
                  //                               fit: BoxFit.fill,
                  //                               filterQuality:
                  //                               FilterQuality
                  //                                   .low),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //
                  //   RichText(
                  //     text: TextSpan(
                  //       text:
                  //       '${homeController.featureSeriesModel.seriesMapProto![1].series![1].name} ',
                  //       style: CLTextStyle.paragraphHeadLineTextStyle
                  //           .copyWith(
                  //         color: Colors.white70,
                  //       ),
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //             text:
                  //             '${homeController.featureSeriesModel.seriesMapProto![1].date}',
                  //             style: CLTextStyle
                  //                 .paragraphHeadLineTextStyle
                  //                 .copyWith(
                  //               color: Colors.white70,
                  //               fontSize: dSize(.02),
                  //             )),
                  //       ],
                  //     ),
                  //   ),
                  // ],
                  // )
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  // actions: [
                  //   innerBoxIsScrolled? const SizedBox():    const Icon(
                  //     Icons.search_outlined,
                  //   ),
                  //
                  //   innerBoxIsScrolled? const SizedBox():    const SizedBox(
                  //     width: 15,
                  //   ),
                  // ],
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
                                  style: CLTextStyle.optionTextStyle,
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
                      children: <Widget>[
                        OverViewTab(
                          seriesId: widget.seriesID != null
                              ? widget.seriesID!
                              : "${homeController.featureSeriesModel.seriesMapProto!.first.series!.first.id!}",
                        ),
                        const MatchesTab(),
                        const SquadsTab(),
                        const SeriesPointsTableTab(),
                        const SeriesInfoTab()
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
