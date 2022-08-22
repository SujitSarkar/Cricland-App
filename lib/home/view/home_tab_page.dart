import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/home_details_screen.dart';
import 'package:cricland/home/view/widgets/slider_card_tile.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../IPL/view/series_screen.dart';

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0;
                              i <
                                  homeController.recentMatchModel.typeMatches!
                                          .first.seriesMatches!.length -
                                      1;
                              i++)
                            homeController.recentMatchModel.typeMatches![0]
                                        .seriesMatches![i].seriesAdWrapper ==
                                    null
                                ? SizedBox()
                                : SliderCardTile(
                                    title:
                                        "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.seriesName}",
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => HomeDetailsScreen(
                                            teamS2Name:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchInfo!.team2!.teamSName}",
                                            matchID:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchInfo!.matchId}",
                                            teamS1Name:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchInfo!.team1!.teamSName}",
                                            matchDesc:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchInfo!.matchDesc}",
                                            team1RunWicket:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchScore!.team1Score!.inngs1!.runs}-${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchScore!.team1Score!.inngs1!.wickets}",
                                            winningStatus:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchInfo!.status}",
                                            team2RunWicket:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchScore!.team2Score!.inngs1!.runs}-${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchScore!.team2Score!.inngs1!.wickets}",
                                            team1Over:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchScore!.team1Score!.inngs1!.overs}",
                                            team2Over:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchScore!.team2Score!.inngs1!.overs}",
                                            team1ImageID:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchInfo!.team1!.imageId}",
                                            team2ImageID:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches![0].matchInfo!.team2!.imageId}",
                                            seriesID:
                                                "${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.seriesId}",
                                            isLive: false,
                                          ),
                                        ),
                                      );
                                    },
                                    onStaticTap: () {},
                                    //TODO runs and overs problem
                                    leftCountryName:
                                        '${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches!.first.matchInfo!.team1!.teamSName}',
                                    leftCountryOvers:
                                        "${homeController.recentMatchModel.typeMatches![0].seriesMatches![0].seriesAdWrapper!.matches!.first.matchScore!.team1Score!.inngs1!.overs}",
                                    leftCountryRuns:
                                        '${homeController.recentMatchModel.typeMatches![0].seriesMatches![0].seriesAdWrapper!.matches!.first.matchScore!.team1Score!.inngs1!.runs}/${homeController.recentMatchModel.typeMatches![0].seriesMatches![0].seriesAdWrapper!.matches!.first.matchScore!.team1Score!.inngs1!.wickets}',
                                    leftCountryURL:
                                        '${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches!.first.matchInfo!.team1!.imageId}',
                                    trailingWidget: 'Upcoming',
                                    rightCountryName:
                                        '${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches!.first.matchInfo!.team2!.teamSName}',
                                    rightCountryOvers:
                                        "${homeController.recentMatchModel.typeMatches![0].seriesMatches![0].seriesAdWrapper!.matches!.first.matchScore!.team2Score!.inngs1!.overs}",
                                    rightCountryRuns:
                                        '${homeController.recentMatchModel.typeMatches![0].seriesMatches![0].seriesAdWrapper!.matches!.first.matchScore!.team2Score!.inngs1!.runs}/${homeController.recentMatchModel.typeMatches![0].seriesMatches![0].seriesAdWrapper!.matches!.first.matchScore!.team2Score!.inngs1!.wickets}',
                                    rightCountryURL:
                                        '${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches!.first.matchInfo!.team2!.imageId}',
                                    wonStatus:
                                        '${homeController.recentMatchModel.typeMatches![0].seriesMatches![i].seriesAdWrapper!.matches!.first.matchInfo!.status}',
                                  ),
                        ],
                      ),
                    ),
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
                                      seriesID: "3641",
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
