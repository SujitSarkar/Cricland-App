import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/details_view/home_details/home_details_screen.dart';
import 'package:cricland/home/view/widgets/slider_card_tile.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../IPL/view/series_screen.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

final themeMode = ValueNotifier(2);

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return homeController.recentMatchModel.typeMatches != null
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ListView.builder(
                    //   physics: NeverScrollableScrollPhysics(),
                    //   itemCount: homeController.recentMatchModel.typeMatches!
                    //       .first.seriesMatches!.length,
                    //   shrinkWrap: true,
                    //   itemBuilder: (context, index) {
                    //     var dataPath = homeController.recentMatchModel.typeMatches![0]
                    //         .seriesMatches![index].seriesAdWrapper;
                    //     return dataPath ==
                    //             null
                    //         ? SizedBox()
                    //         : SliderCardTile(
                    //             title:
                    //                 "${dataPath.seriesName}",
                    //             onTap: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (_) => HomeDetailsScreen(
                    //                     teamS2Name:
                    //                         "${dataPath.matches![0].matchInfo!.team2!.teamSName}",
                    //                     matchID:
                    //                         "${dataPath.matches![0].matchInfo!.matchId}",
                    //                     teamS1Name:
                    //                         "${dataPath.matches![0].matchInfo!.team1!.teamSName}",
                    //                     matchDesc:
                    //                         "${dataPath.matches![0].matchInfo!.matchDesc}",
                    //                     team1RunWicket:
                    //                     dataPath.matches!.first.matchScore==null?"": '${dataPath.matches!.first.matchScore!.team1Score!.inngs1!.runs}/${dataPath.matches!.first.matchScore!.team1Score!.inngs1!.wickets}',
                    //                     winningStatus:
                    //                         "${dataPath.matches![0].matchInfo!.status}",
                    //                     team2RunWicket:
                    //                         "${dataPath.matches![0].matchScore!.team2Score!.inngs1!.runs}-${dataPath.matches![0].matchScore!.team2Score!.inngs1!.wickets}",
                    //                     team1Over:
                    //                         "${dataPath.matches![0].matchScore!.team1Score!.inngs1!.overs}",
                    //                     team2Over:
                    //                         "${dataPath.matches![0].matchScore!.team2Score!.inngs1!.overs}",
                    //                     team1ImageID:
                    //                         "${dataPath.matches![0].matchInfo!.team1!.imageId}",
                    //                     team2ImageID:
                    //                         "${dataPath.matches![0].matchInfo!.team2!.imageId}",
                    //                     seriesID:
                    //                         "${dataPath.seriesId}",
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //             onStaticTap: () {},
                    //             //TODO runs and overs problem
                    //             leftCountryName:
                    //                 '${dataPath.matches!.first.matchInfo!.team1!.teamSName}',
                    //             leftCountryOvers:
                    //             dataPath.matches!.first.matchScore==null?"":  "${dataPath.matches!.first.matchScore!.team1Score!.inngs1!.overs}",
                    //             leftCountryRuns:
                    //             dataPath.matches!.first.matchScore==null?"": '${dataPath.matches!.first.matchScore!.team1Score!.inngs1!.runs}/${dataPath.matches!.first.matchScore!.team1Score!.inngs1!.wickets}',
                    //             leftCountryURL:
                    //                 '${dataPath.matches!.first.matchInfo!.team1!.imageId}',
                    //             trailingWidget: 'Upcoming',
                    //             rightCountryName:
                    //                 '${dataPath.matches!.first.matchInfo!.team2!.teamSName}',
                    //             rightCountryOvers:
                    //             dataPath.matches!.first.matchScore==null?"":  "${dataPath.matches!.first.matchScore!.team2Score!.inngs1!.overs}",
                    //             rightCountryRuns:
                    //             dataPath.matches!.first.matchScore==null?"":  '${dataPath.matches!.first.matchScore!.team2Score!.inngs1!.runs}/${dataPath.matches!.first.matchScore!.team2Score!.inngs1!.wickets}',
                    //             rightCountryURL:
                    //                 '${dataPath.matches!.first.matchInfo!.team2!.imageId}',
                    //             wonStatus:
                    //                 '${dataPath.matches!.first.matchInfo!.status}',
                    //           );
                    //     //LiveCart(context);
                    //   },
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Featured Series',
                      style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                        fontSize: dSize(.04),
                        fontWeight: FontWeight.w500,
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    homeController.featureSeriesModel.seriesMapProto == null
                        ? Center(
                            child: Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: CircularProgressIndicator(),
                          ))
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 1.3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: homeController
                                .featureSeriesModel.seriesMapProto!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    SeriesScreen(
                                      seriesID: "4492",
                                      // matchId: "${homeController.featureSeriesModel.seriesMapProto![index].series.first.}",
                                    ),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                  ApiEndpoints.imageMidPoint +
                                                      "${homeController.featureSeriesModel.seriesMapProto![index].series!.first.id}" +
                                                      ApiEndpoints
                                                          .imageLastPoint,
                                                  headers: ApiEndpoints.headers,
                                                ),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${homeController.featureSeriesModel.seriesMapProto![index].series!.first.name}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            CLTextStyle.nameTextStyle.copyWith(
                                          fontSize: dSize(.035),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              );
                            }),
                  ],
                ),
              ),
            )
          : Center(child: Text("You Have no match"));
    });
  }
}
