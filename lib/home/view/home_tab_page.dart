import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricland/home/constants.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/home_details_screen.dart';
import 'package:cricland/home/view/widgets/slider_card_tile.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IPL/view/ipl_page.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

final themeMode = ValueNotifier(2);
final List<String> itemList = [
  'https://www.kidlink.org/icons/f0-at.gif',
  'https://www.kidlink.org/icons/f0-ag.gif',
  'https://www.kidlink.org/icons/f0-ar.gif',
  'https://www.kidlink.org/icons/f0-ao.gif',
  'https://www.kidlink.org/icons/f0-am.gif',
  'https://www.kidlink.org/icons/f0-aw.gif',
  'https://www.kidlink.org/icons/f0-bd.gif',
  'https://www.kidlink.org/icons/f0-au.gif',
  'https://www.kidlink.org/icons/f0-al.gif',
  'https://www.kidlink.org/icons/f0-bs.gif',
];
final List<String> countryNameList = [
  'Austria',
  'Barbuda',
  'Argentina',
  'Angola',
  'Armenia',
  'Aruba',
  'Bangladesh',
  'Australia',
  'Albania',
  'Bahamas',
];
Map<String, String> headers = <String, String>{
  'X-RapidAPI-Key': '536bde874cmsh538ffe828f4e822p1aec59jsn3e00016f7daf',
  'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com',
};

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      print(
          "Matches: ${homeController.recentMatchModel.typeMatches!.first.seriesMatches!.length}");
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
                                    onTap: () {},
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
                      style: TextStyle(
                        fontSize: dSize(.04),
                        fontWeight: FontWeight.w500,
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
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
                                IPLPage(),
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
                                            image: CachedNetworkImageProvider(
                                              ApiEndpoints.baseURL +
                                                  ApiEndpoints.imageMidPoint +
                                                  "${homeController.featureSeriesModel.seriesMapProto![index].series!.first.id}" +
                                                  ApiEndpoints.imageLastPoint,
                                              headers: headers,
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${homeController.featureSeriesModel.seriesMapProto![index].series!.first.name}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: dSize(.04),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
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
