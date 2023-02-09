import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/model/rapid_model/recent_match_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../IPL/view/series_screen.dart';
import '../../../../public/variables/colors.dart';
import '../../widgets/finished_card_tile.dart';
import '../../widgets/fixtures_card_tile.dart';
import '../../widgets/home_card_tile.dart';
import '../../widgets/upcoming_card_tile.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

final themeMode = ValueNotifier(2);

class _HomeTabScreenState extends State<HomeTabScreen> {

  @override
  void initState() {

    // TODO: implement initState
    super.initState();

  }
  List<RapidMatch> allMatch=[];


  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return  SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  InkWell(
                onTap: (){
                  homeController.getRecentMatches();
                 homeController.getUpcomingMatches();
                  homeController.getFeatureSeries();

                 // print(homeController.rapidUpcomingList.length);
                  // showDialog(
                  //   barrierDismissible: true,
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return StatefulBuilder(builder: (context, setState) {
                  //       return AlertDialog(
                  //           insetPadding: EdgeInsets.zero,
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  //           content: SizedBox.expand(
                  //             child: Column(
                  //               children: <Widget>[
                  //                 SingleChildScrollView(
                  //                     physics: BouncingScrollPhysics(),
                  //                     child: Wrap(
                  //                       children: <Widget>[
                  //                         Row(
                  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                           children: <Widget>[
                  //                             const Text(
                  //                               "Example Add",
                  //                               style: TextStyle(fontWeight: FontWeight.w700),
                  //                             ),
                  //                             IconButton(onPressed: (){
                  //                               Navigator.pop(context);
                  //                             }, icon: Icon(Icons.cancel_outlined))
                  //                           ],
                  //                         ),
                  //
                  //                         SizedBox(height: 150,),
                  //                         Align (
                  //                           alignment: Alignment.center,
                  //                           child: const Text(
                  //                             "Please Press The Icon to Earn Mony",
                  //                             style: TextStyle(fontWeight: FontWeight.w700),
                  //                           ),
                  //                         ),
                  //                         SizedBox(height: 50,),
                  //                         InkWell(
                  //                           onTap: (){
                  //                             homeController.updatePoints("50",true);
                  //                           },
                  //                             child: Image.asset("assets/main_logo.png")),
                  //                       ],
                  //                     )),
                  //               ],
                  //             ),
                  //           ));
                  //     });
                  //   },
                  // );
              },
                    child: Text(
                    'Show Add',
                    style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
                      fontSize: dSize(.04),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                ),
                  ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.rapidRecentList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState((){
                              selectedIndex = index;
                            });

                          },
                          child: HomeCardTile(
                            isExpanded: selectedIndex==index? true:false,
                            rapidMatch:  homeController.rapidRecentList[index],
                          ),
                        );
                      },
                    ),


                 ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.rapidUpcomingList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return  GestureDetector(
                          onTap: (){
                            setState((){
                              selectedIndex = index;
                            });

                          },
                          child: HomeCardTile(
                            isExpanded: selectedIndex==index? true:false,
                            rapidMatch:  homeController.rapidUpcomingList[index],
                          ),
                        );
                        //LiveCart(context);
                      },
                    ),

                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeController.rapidFixturesList
                            .length,
                        itemBuilder: (BuildContext context, int index) {

                          return  GestureDetector(
                            onTap: (){
                              setState((){
                                selectedIndex = index;
                              });

                            },
                            child: HomeCardTile(
                              isExpanded: selectedIndex==index? true:false,
                              rapidMatch:  homeController.rapidFixturesList[index],
                            ),
                          );

                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Featured Series',
                      style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
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
                                .rapidFeatureSeriesList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    const SeriesScreen(
                                      seriesID: "4492",
                                      // matchId: "${homeController.featureSeriesModel.seriesMapProto![index].series.first.}",
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
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
                                                          "${homeController
                                                              .rapidFeatureSeriesList[index].seriesModel!.id}" +
                                                          ApiEndpoints
                                                              .imageLastPoint,
                                                      headers: ApiEndpoints.headers,
                                                    ),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${homeController
                                                .rapidFeatureSeriesList[index].seriesModel!.name}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                            CLTextStyle().nameTextStyle.copyWith(
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
                                     Positioned(

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(child: Container(

                                        decoration: const BoxDecoration(
                                            color: AllColor.lightCardColor,
                                          borderRadius: BorderRadius.all(Radius.circular(10),)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${homeController.rapidFeatureSeriesList[index].date}"),
                                        ))),
                                      ),)
                                  ],
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
