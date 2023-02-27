import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/home/model/rapid_model/recent_match_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../IPL/view/series_screen.dart';
import '../../../../public/variables/colors.dart';
import '../../widgets/home_card_tile.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

final themeMode = ValueNotifier(2);

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<RapidMatch> allMatch = [];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  homeController.getRecentMatches();
                  homeController.getUpcomingMatches();
                  homeController.getFeatureSeries();
                },
                child: Text('Show Add', style: AppTextStyle().largeTitleStyle),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeController.rapidRecentList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: HomeCardTile(
                      rapidMatch: homeController.rapidRecentList[index],
                    ),
                  );
                },
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeController.rapidUpcomingList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: HomeCardTile(
                      rapidMatch: homeController.rapidUpcomingList[index],
                    ),
                  );
                  //LiveCart(context);
                },
              ),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.rapidFixturesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // setState((){
                        //   selectedIndex = index;
                        // });
                      },
                      child: HomeCardTile(
                        rapidMatch: homeController.rapidFixturesList[index],
                      ),
                    );
                  }),
              const SizedBox(height: 20),
              Text('Featured Series', style: AppTextStyle().largeTitleStyle),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: homeController.rapidFeatureSeriesList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(const IPLPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: PublicController.pc.toggleCardBg(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(children: [
                          Stack(alignment: Alignment.center, children: [
                            //image
                            Container(
                              width: double.infinity,
                              height: dSize(.2),
                              decoration: BoxDecoration(
                                color: PublicController.pc.toggleCardBg(),
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      ApiEndpoints.imageMidPoint +
                                          "${homeController.rapidFeatureSeriesList[index].seriesModel!.id}" +
                                          ApiEndpoints.imageLastPoint,
                                      headers: ApiEndpoints.headers,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),

                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: const BoxDecoration(
                                    color: AllColor.lightCardColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                child: Text(
                                    "${homeController.rapidFeatureSeriesList[index].date}",
                                    style: AppTextStyle()
                                        .bodyTextStyle
                                        .copyWith(
                                            color: AllColor.lightTextColor)))
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Text(
                              "${homeController.rapidFeatureSeriesList[index].seriesModel!.name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle().bodyTextStyle.copyWith(
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                            ),
                          ),
                        ]),
                      ),
                    );
                  }),
            ],
          ),
        ),
      );
    });
  }
}
