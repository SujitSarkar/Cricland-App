import 'package:cricland/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../public/widgets/app_text_style.dart';
import '../../../model/monk/monk_league_model.dart';
import '../../../model/monk/monk_live_model.dart';
import '../../../model/monk/monk_score_model.dart';
import '../../../model/monk/monk_team_model.dart';
import '../../../model/monk/monk_vanue_model.dart';

class LiveTabScreen extends StatefulWidget {
  final ScrollController scrollController;
  const LiveTabScreen({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _LiveTabScreenState createState() => _LiveTabScreenState();
}

class LiveResponseData {
  String leagueName;
  String leagueImage;
  String venueName;
  String venueImage;
  String localTeamName;
  String localTeamImage;
  int localTeamRun;
  dynamic localTeamOver;
  int localTeamWicket;
  String visitorTeamName;
  String visitorTeamImage;
  int visitorTeamRun;
  dynamic visitorTeamOver;
  int visitorTeamWicket;
  String status;
  String live;
  String note;
  LiveResponseData({
    required this.leagueName,
    required this.leagueImage,
    required this.venueName,
    required this.venueImage,
    required this.localTeamName,
    required this.localTeamImage,
    required this.localTeamRun,
    required this.localTeamOver,
    required this.localTeamWicket,
    required this.visitorTeamName,
    required this.visitorTeamImage,
    required this.visitorTeamOver,
    required this.visitorTeamRun,
    required this.visitorTeamWicket,
    required this.status,
    required this.live,
    required this.note,
  });
}

class _LiveTabScreenState extends State<LiveTabScreen> {
  int? selectedIndex;
  double containerHeight = 150;

  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  List<LiveResponseData> liveListWithData = [];
  List<MonkLive> monkLiveList = [];
  fetchData() async {
    setState(() {
      _isLoading = true;
    });
    liveListWithData = [];
    final HomeController _homeController = HomeController();
    monkLiveList = await _homeController.getLive();

    print("Live Match Count: ${monkLiveList.length}");
    for (MonkLive monkLive in monkLiveList) {
      MonkLeague monkLeague =
          await _homeController.getLeague(monkLive.league_id.toString());
      print("League Name: ${monkLeague.name}");
      MonkVanue monkVenue =
          await _homeController.getVenue(monkLive.venue_id.toString());
      print("Venue Name: ${monkVenue.name}");

      MonkTeam monkLocalTeam =
          await _homeController.getTeam(monkLive.localteam_id.toString());
      print("Local Team Name: ${monkLocalTeam.name}");
      MonkTeam monkVisitorTeam =
          await _homeController.getTeam(monkLive.visitorteam_id.toString());
      print("Visitor Team Name: ${monkVisitorTeam.name}");

      List<MonkLiveScore> teamLiveScores =
          await _homeController.getMonkScore(monkLive.id.toString());
      print(" Score Length: ${teamLiveScores.length}");

      liveListWithData.add(
        LiveResponseData(
            leagueName: monkLeague.name!,
            leagueImage: monkLeague.image_path!,
            venueName: monkVenue.name!,
            venueImage: monkVenue.image_path!,
            localTeamName: monkLocalTeam.name!,
            localTeamImage: monkLocalTeam.image_path!,
            localTeamRun: teamLiveScores[0].score,
            localTeamOver: teamLiveScores[0].overs,
            localTeamWicket: teamLiveScores[0].wickets,
            visitorTeamName: monkVisitorTeam.name!,
            visitorTeamImage: monkVisitorTeam.image_path!,
            visitorTeamOver:
                teamLiveScores.length == 2 ? teamLiveScores[1].overs : 0.0,
            visitorTeamRun:
                teamLiveScores.length == 2 ? teamLiveScores[1].score : 0,
            visitorTeamWicket:
                teamLiveScores.length == 2 ? teamLiveScores[1].wickets : 0,
            status: monkLive.status!,
            live: monkLive.live! ? "Live" : "",
            note: monkLive.note!),
      );
    }
    setState(() {
      _isLoading = false;
    });
    print("Tile Data: ${liveListWithData.length}");

    setState(() {});
  }

  bool? isExpand = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            print(notification.metrics.pixels);

            if (notification.metrics.pixels > 50) {
              homeController.setScroll(true.obs);
            } else {
              homeController.setScroll(false.obs);
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TextButton(
                //   onPressed: () {
                //     fetchData();
                //   },
                //   child: const Text("Live Data"),
                // ),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : liveListWithData.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                                child: Text(
                              "There are currently no live matches",
                              style: AppTextStyle().bodyTextStyle,
                            )),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: liveListWithData.length,
                            shrinkWrap: true,
                            itemBuilder: (context, liveIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.network(
                                              liveListWithData[liveIndex]
                                                  .leagueImage,
                                              height: 40,
                                              width: 40,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                "${liveListWithData[liveIndex].leagueName}"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons
                                                      .do_not_disturb_on_total_silence_outlined,
                                                  size: 15,
                                                  color: Colors.redAccent,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Live",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  selectedIndex = liveIndex;

                                                  if (containerHeight == 150) {
                                                    containerHeight = 0;
                                                  } else {
                                                    containerHeight = 150;
                                                  }
                                                });

                                                print(selectedIndex);
                                              },
                                              icon: Icon(selectedIndex == liveIndex
                                                  ? Icons
                                                      .keyboard_arrow_up_outlined
                                                  : Icons
                                                      .keyboard_arrow_down_outlined),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(microseconds: 1000),
                                      height: selectedIndex == liveIndex
                                          ? containerHeight
                                          : 150,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(liveListWithData[liveIndex]
                                                  .venueName),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.network(
                                                            liveListWithData[
                                                                    liveIndex]
                                                                .localTeamImage,
                                                            height: 30,
                                                            width: 30,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child: Text(
                                                              liveListWithData[
                                                                      liveIndex]
                                                                  .localTeamName,
                                                              style: AppTextStyle()
                                                                  .bodyTextStyle
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ),
                                                          Text(
                                                              "${liveListWithData[liveIndex].localTeamRun}-${liveListWithData[liveIndex].localTeamWicket} ",
                                                              style: AppTextStyle()
                                                                  .bodyTextStyle),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                              "${liveListWithData[liveIndex].localTeamOver}",
                                                              style: AppTextStyle()
                                                                  .bodyTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          12))
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.network(
                                                            liveListWithData[
                                                                    liveIndex]
                                                                .visitorTeamImage,
                                                            height: 30,
                                                            width: 30,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child: Text(
                                                              liveListWithData[
                                                                      liveIndex]
                                                                  .visitorTeamName,
                                                              style: AppTextStyle()
                                                                  .bodyTextStyle
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ),
                                                          Text(
                                                              "${liveListWithData[liveIndex].visitorTeamRun}-${liveListWithData[liveIndex].visitorTeamWicket}",
                                                              style: AppTextStyle()
                                                                  .bodyTextStyle),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                              "${liveListWithData[liveIndex].visitorTeamOver}",
                                                              style: AppTextStyle()
                                                                  .bodyTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          12))
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            18.0),
                                                    child: Text(
                                                        liveListWithData[
                                                                liveIndex]
                                                            .status),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Text(
                                                    liveListWithData[liveIndex]
                                                        .note),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
              ],
            ),
          ),
        );
      },
    );
  }
}
