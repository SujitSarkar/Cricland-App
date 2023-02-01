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
import '../../widgets/finished_card_tile.dart';
import '../../widgets/fixtures_card_tile.dart';
import '../../widgets/upcoming_card_tile.dart';
import '../upcoming_details/upcoming_details_screen.dart';

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  InkWell(
                onTap: (){
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                            insetPadding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            content: SizedBox.expand(
                              child: Column(
                                children: <Widget>[
                                  SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Wrap(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                "Example Add",
                                                style: TextStyle(fontWeight: FontWeight.w700),
                                              ),
                                              IconButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, icon: Icon(Icons.cancel_outlined))
                                            ],
                                          ),

                                          SizedBox(height: 150,),
                                          Align (
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "Please Press The Icon to Earn Mony",
                                              style: TextStyle(fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          SizedBox(height: 50,),
                                          InkWell(
                                            onTap: (){
                                              homeController.updatePoints("50",true);
                                            },
                                              child: Image.asset("assets/main_logo.png")),
                                        ],
                                      )),
                                ],
                              ),
                            ));
                      });
                    },
                  );
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
                      itemCount:
                      homeController.recentMatchModel.typeMatches!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var path = homeController
                            .recentMatchModel
                            .typeMatches![index]
                            .seriesMatches!
                            .first
                            .seriesAdWrapper!;
                        return homeController.recentMatchModel.typeMatches![index]
                            .seriesMatches !=
                            null
                            ? FinishedCardTile(
                          onTap: () {

                            // Get.to(
                            //   HomeDetailsScreen(
                            //     teamS2Name:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.teamSName}",
                            //     matchID:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchId}",
                            //     teamS1Name:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.teamSName}",
                            //     matchDesc:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchDesc}",
                            //     team1RunWicket:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team1Score!.inngs1!.runs}-${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team1Score!.inngs1!.wickets}",
                            //     winningStatus:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.status}",
                            //     team2RunWicket:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team2Score!.inngs1!.runs}-${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team2Score!.inngs1!.wickets}",
                            //     team1Over:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team1Score!.inngs1!.overs}",
                            //     team2Over:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchScore!.team2Score!.inngs1!.overs}",
                            //     team1ImageID:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.imageId}",
                            //     team2ImageID:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.imageId}",
                            //     seriesID:
                            //     "${homeController.recentMatchModel.typeMatches![0].seriesMatches![index].seriesAdWrapper!.seriesId}",
                            //   ),
                            // );
                          },
                          title: "${path.seriesName}",
                          onStaticTap: () {},
                          leftCountryName:
                          '${path.matches!.first.matchInfo!.team1!.teamSName}',
                          leftCountryOvers: path
                              .matches!.first.matchScore !=
                              null
                              ? "${path.matches!.first.matchScore!.team1Score!.inngs1!.overs}"
                              : "",
                          leftCountryRuns: path.matches!.first.matchScore !=
                              null
                              ? '${path.matches!.first.matchScore!.team1Score!.inngs1!.runs}/${path.matches!.first.matchScore!.team1Score!.inngs1!.wickets}'
                              : "",
                          leftCountryURL: path.matches!.first.matchScore !=
                              null
                              ? '${path.matches!.first.matchInfo!.team1!.imageId}'
                              : "",
                          trailingWidget: 'Upcoming',
                          rightCountryName: path
                              .matches!.first.matchScore !=
                              null
                              ? '${path.matches!.first.matchInfo!.team2!.teamSName}'
                              : "",
                          rightCountryOvers: path
                              .matches!.first.matchScore !=
                              null
                              ? "${path.matches!.first.matchScore!.team2Score!.inngs1!.overs}"
                              : "",
                          rightCountryRuns: path
                              .matches!.first.matchScore !=
                              null
                              ? '${path.matches!.first.matchScore!.team2Score!.inngs1!.runs}/${path.matches!.first.matchScore!.team2Score!.inngs1!.wickets}'
                              : "",
                          rightCountryURL: path.matches!.first.matchScore !=
                              null
                              ? '${path.matches!.first.matchInfo!.team2!.imageId}'
                              : "",
                          wonStatus: path.matches!.first.matchScore != null
                              ? '${path.matches!.first.matchInfo!.status}'
                              : "",
                        )
                            : const SizedBox();
                        //LiveCart(context);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    homeController.upcomingMatchModel.typeMatches ==null?const SizedBox():  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.upcomingMatchModel.typeMatches!
                          .first.seriesMatches!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return homeController
                            .upcomingMatchModel
                            .typeMatches!
                            .first
                            .seriesMatches![index]
                            .seriesAdWrapper !=
                            null
                            ? UpcomingCardTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => UpcomingDetailsScreen(
                                  selectedIndex: index,
                                  startDate:
                                  "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.startDate}",
                                  teamS2Name:
                                  "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.teamSName}",
                                  matchID:
                                  "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchId}",
                                  teamS1Name:
                                  "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.teamSName}",
                                  matchDesc:
                                  "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.matchDesc}",
                                  team1ImageID:
                                  "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team1!.imageId}",
                                  team2ImageID:
                                  "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches![0].matchInfo!.team2!.imageId}",
                                  seriesID:
                                  "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.seriesId}",
                                ),
                              ),
                            );
                          },
                          title:
                          "${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.seriesName}",
                          rightCountryURL:
                          '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.team2!.imageId}',
                          leftCountryURL:
                          '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.team1!.imageId}',
                          leftCountryName:
                          '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.team1!.teamSName}',
                          rightCountryName:
                          '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.team2!.teamSName}',
                          startTime:
                          '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.startDate}',
                          status:
                          '${homeController.upcomingMatchModel.typeMatches!.first.seriesMatches![index].seriesAdWrapper!.matches!.first.matchInfo!.state}'.split(".")[1],
                        )
                            : const SizedBox();
                        //LiveCart(context);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ), homeController
                        .fixturesMatchModel
                        .matchScheduleMap == null?SizedBox():ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeController
                            .fixturesMatchModel
                            .matchScheduleMap!
                            .first
                            .scheduleAdWrapper!
                            .matchScheduleList!
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          var path = homeController.fixturesMatchModel
                              .matchScheduleMap![index].scheduleAdWrapper;
                          return path != null
                              ? FixturesCardTile(
                            title:
                            "${path.matchScheduleList!.first.seriesName}",
                            leadingUrlOne:
                            "${path.matchScheduleList!.first.matchInfo!.first.team1!.imageId}",
                            leadingUrlTwo:
                            "${path.matchScheduleList!.first.matchInfo!.first.team2!.imageId}",
                            teamOne:
                            "${path.matchScheduleList!.first.matchInfo!.first.team1!.teamSName}",
                            teamTwo:
                            "${path.matchScheduleList!.first.matchInfo!.first.team2!.teamSName}",
                            reachTitleOne: '',
                            reachTitleTwo: '',
                            reachSubTitleOne: '',
                            reachSubTitleTwo: '',
                            desc:
                            "${path.matchScheduleList!.first.matchInfo!.first.matchDesc}",
                            date: "${path.date}",
                            onTap: () {
                              Get.to(
                                HomeDetailsScreen(
                                  teamS2Name:
                                  "${path.matchScheduleList!.first.matchInfo!.first.team2!.teamSName}",
                                  matchID:
                                  "${path.matchScheduleList!.first.matchInfo!.first.matchId}",
                                  teamS1Name:
                                  "${path.matchScheduleList!.first.matchInfo!.first.team1!.teamSName}",
                                  matchDesc:
                                  "${path.matchScheduleList!.first.matchInfo!.first.matchDesc}",
                                  team1RunWicket: "",
                                  winningStatus: "",
                                  team2RunWicket: "",
                                  team1Over: "",
                                  team2Over: "",
                                  team1ImageID:
                                  "${path.matchScheduleList!.first.matchInfo!.first.team1!.imageId}",
                                  team2ImageID:
                                  "${path.matchScheduleList!.first.matchInfo!.first.team1!.imageId}",
                                  seriesID:
                                  "${path.matchScheduleList!.first.seriesId}",
                                ),
                              );
                            },
                          )
                              : SizedBox();
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
                    homeController.featureSeriesModel.seriesMapProto == null
                        ? const Center(
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
                                    const SeriesScreen(
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
