import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/monk/monk_score_model.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../public/controller/language_controller.dart';
import '../../../model/monk/live_response_data.dart';
import '../../../model/monk/monk_league_model.dart';
import '../../../model/monk/monk_live_model.dart';
import '../../../model/monk/monk_team_model.dart';
import '../../../model/monk/monk_vanue_model.dart';
import '../../monk_view/monk_live_tile.dart';

class HomeTabScreen extends StatefulWidget {
  final ScrollController scrollController;
  const HomeTabScreen({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

final themeMode = ValueNotifier(2);

class _HomeTabScreenState extends State<HomeTabScreen> {
  List<LiveResponseData> liveListWithData = [];
  List<MonkLive> monkLiveList = [];
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    String formattedDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 30)));
    String fastFormattedDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().add(const Duration(days: 30)));
    setState(() {
      _isLoading = true;
    });
    liveListWithData = [];
    final HomeController _homeController = HomeController();
    monkLiveList =
        await _homeController.getFixtures("$formattedDate,$fastFormattedDate");

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
            venueName:
                "${monkLive.round!},${monkVenue.name!},${monkVenue.city!}",
            round: monkLive.round!,
            city: monkVenue.city!,
            venueImage: monkVenue.image_path!,
            localTeamName: monkLocalTeam.name!,
            localTeamImage: monkLocalTeam.image_path!,
            localTeamRun: teamLiveScores.isEmpty ? 0 : teamLiveScores[0].score,
            localTeamOver: teamLiveScores.isEmpty ? 0 : teamLiveScores[0].overs,
            localTeamWicket:
                teamLiveScores.isEmpty ? 0 : teamLiveScores[0].wickets,
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

  @override
  Widget build(BuildContext context) {
    final LanguageController lc = Get.find();
    return GetBuilder<HomeController>(builder: (homeController) {
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
          controller: widget.scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      fetchData();
                    },
                    child: Text("data")),
                _isLoading
                    ? Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: dSize(.7)),
                        child: const CircularProgressIndicator(),
                      ))
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
                              return MonkLiveTile(
                                liveObjectData: liveListWithData[liveIndex],
                                liveIndex: liveIndex,
                                scrollController: widget.scrollController,
                              );
                            }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
