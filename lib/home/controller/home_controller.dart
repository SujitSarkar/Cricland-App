import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricland/home/model/commentaries_model.dart';
import 'package:cricland/home/model/match_info_model.dart';
import 'package:cricland/home/model/monk/monk_live_model.dart';
import 'package:cricland/home/model/over_summery_model.dart';
import 'package:cricland/home/model/series_match_list_model.dart';
import 'package:cricland/home/model/squads_model.dart';
import 'package:cricland/home/model/upcoming_match_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/api_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../public/model/usermodel.dart';
import '../../public/variables/variable.dart';
import '../model/monk/monk_league_model.dart';
import '../model/monk/monk_team_model.dart';
import '../model/monk/monk_vanue_model.dart';
import '../model/player_info_model.dart';
import '../model/player_squad_model.dart';
import '../model/rapid_model/point_table_model.dart';
import '../model/rapid_model/recent_match_model.dart';
import '../model/rapid_model/series_model.dart';
import '../model/score_card_model.dart';

class HomeController extends GetxController {
  late UpcomingMatchModel upcomingMatchModel;

  late ScoreCardModel scoreCardModel;

  late CommentariesModel commentariesModel;
  late SeriesMatchListModel seriesMatchListModel;
  late RecentMatchInfoModel matcheInfoModel;
  late MatchSquadModel matchSquadModel;
  late PlayerInfoModel playerInfoModel;
  late PlayerSquadModel playerSquadModel;
  late OverSummeryModel overSummeryModel;
  late UserModel userModel;

  RxList fixtureMatchList = [].obs;
  RxList playerSquadModelList = [].obs;
  RxBool loading = false.obs;
  RxBool isScroll = false.obs;

  setScroll(RxBool bool) {
    isScroll = bool;
    update();
  }

  @override
  void onInit() async {
    matcheInfoModel = RecentMatchInfoModel(); //Todo Data Fetching Problem
    commentariesModel =
        CommentariesModel(); //Todo Some Match Comment are Fetch problem
    upcomingMatchModel = UpcomingMatchModel();

    scoreCardModel = ScoreCardModel();

    seriesMatchListModel = SeriesMatchListModel();
    matchSquadModel = MatchSquadModel();
    playerInfoModel = PlayerInfoModel();
    playerSquadModel = PlayerSquadModel();
    overSummeryModel = OverSummeryModel();
    userModel = UserModel();
    fetchInitData();
    //get Matches

    getSetUser();
    await getRecentMatches();
    await getUpcomingMatches();
    await getFixturesMatches();
    await getFeatureSeries();
    super.onInit();
  }

  getSetUser() async {
    //Get User
    final prefs = await SharedPreferences.getInstance();
    String? uId = prefs.getString('userId');
    if (uId != null) {
      getUser(uId);
    }
  }

  fetchInitData() async {
    //get Fixture

    //  //get Series

    // await getCommentaries("38356");
    // await getMatchSquad("3718");
    // await getPlayerSquad("3718", "15826");
    // await getPlayerInfo("6635");
    // await getMatchInfo("38356");
    //
    //

    //Get User
    final prefs = await SharedPreferences.getInstance();
    String? uId = prefs.getString('userId');
    if (uId != null) {
      getUser(uId);
    }

    getLive();
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,900}'); // 900 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  List<RapidMatch> rapidRecentList = [];
  Future<void> getRecentMatches() async {
    loading(true);
    rapidRecentList = [];

    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.recentMatchData),
        onSuccess: (response) {
          print(" Recent: $response");

          var matches = response["typeMatches"][0]["seriesMatches"][0]
              ["seriesAdWrapper"]["matches"];

          //  recentMatchModel = recentMatchModelFromJson(jsonEncode(response));
          printWrapped(
              "Recent Response: ${matches[0]["matchScore"]["team1Score"]["inngs1"]["inningsId"]}\n\n");
          for (var match in matches) {
            rapidRecentList.add(
              RapidMatch(
                matchInfo: RapidMatchInfo(
                  matchId: match["matchInfo"]["matchId"],
                  seriesId: match["matchInfo"]["seriesId"],
                  seriesName: match["matchInfo"]["seriesName"],
                  matchDesc: match["matchInfo"]["matchDesc"],
                  startDate: match["matchInfo"]["startDate"],
                  endDate: match["matchInfo"]["endDate"],
                  state: match["matchInfo"]["state"],
                  status: match["matchInfo"]["status"],
                  team1: RapidTeam(
                    teamId: match["matchInfo"]["team1"]["teamId"],
                    teamName: match["matchInfo"]["team1"]["teamName"],
                    teamSName: match["matchInfo"]["team1"]["teamSName"],
                    imageId: match["matchInfo"]["team1"]["imageId"],
                  ),
                  team2: RapidTeam(
                    teamId: match["matchInfo"]["team2"]["teamId"],
                    teamName: match["matchInfo"]["team2"]["teamName"],
                    teamSName: match["matchInfo"]["team2"]["teamSName"],
                    imageId: match["matchInfo"]["team2"]["imageId"],
                  ),
                  venueInfo: RapidVenueInfo(
                    id: match["matchInfo"]["venueInfo"]["id"],
                    ground: match["matchInfo"]["venueInfo"]["ground"],
                    city: match["matchInfo"]["venueInfo"]["city"],
                  ),
                  currBatTeamId: match["matchInfo"]["currBatTeamId"],
                  seriesStartDt: match["matchInfo"]["seriesStartDt"],
                  seriesEndDt: match["matchInfo"]["seriesEndDt"],
                  isTimeAnnounced: match["matchInfo"]["isTimeAnnounced"],
                  stateTitle: match["matchInfo"]["stateTitle"],
                ),
                matchScore: RapidMatchScore(
                  team1Score: RapidTeamScore(
                    inngs1: RapidInngs(
                      inningsId: match["matchScore"]["team1Score"]["inngs1"]
                          ["inningsId"],
                      runs: match["matchScore"]["team1Score"]["inngs1"]["runs"],
                      wickets: match["matchScore"]["team1Score"]["inngs1"]
                          ["wickets"],
                      overs: match["matchScore"]["team1Score"]["inngs1"]
                          ["overs"],
                    ),
                    // inngs2:  RapidInngs(
                    //   inningsId: match["matchScore"]["team1Score"]["inngs2"]["inningsId"],
                    //   runs: match["matchScore"]["team1Score"]["inngs2"]["runs"],
                    //   wickets: match["matchScore"]["team1Score"]["inngs2"]["wickets"],
                    //   overs: match["matchScore"]["team1Score"]["inngs2"]["overs"],
                    // ),
                  ),
                  team2Score: RapidTeamScore(
                    inngs1: RapidInngs(
                      inningsId: match["matchScore"]["team2Score"]["inngs1"]
                          ["inningsId"],
                      runs: match["matchScore"]["team2Score"]["inngs1"]["runs"],
                      wickets: match["matchScore"]["team2Score"]["inngs1"]
                          ["wickets"],
                      overs: match["matchScore"]["team2Score"]["inngs1"]
                          ["overs"],
                    ),
                    // inngs2:  RapidInngs(
                    //   inningsId: match["matchScore"]["team2Score"]["inngs2"]["inningsId"],
                    //   runs: match["matchScore"]["team2Score"]["inngs2"]["runs"],
                    //   wickets: match["matchScore"]["team2Score"]["inngs2"]["wickets"],
                    //   overs: match["matchScore"]["team2Score"]["inngs2"]["overs"],
                    // ),
                  ),
                ),
              ),
            );
          }
          print("Match Lenth: ${rapidRecentList.length}");
          print("Series Name: ${rapidRecentList[0].matchInfo!.seriesName!}");

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  List<RapidMatch> rapidUpcomingList = [];

  Future<void> getUpcomingMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.upComingMatchData),
        onSuccess: (response) {
          print(response);

          var matches = response["typeMatches"][0]["seriesMatches"][0]
              ["seriesAdWrapper"]["matches"];

          //  recentMatchModel = recentMatchModelFromJson(jsonEncode(response));
          //   printWrapped("Recent Response: ${matches[0]["matchScore"]["team1Score"]["inngs1"]["inningsId"]}\n\n");
          for (var match in matches) {
            rapidUpcomingList.add(
              RapidMatch(
                matchInfo: RapidMatchInfo(
                  matchId: match["matchInfo"]["matchId"],
                  seriesId: match["matchInfo"]["seriesId"],
                  seriesName: match["matchInfo"]["seriesName"],
                  matchDesc: match["matchInfo"]["matchDesc"],
                  startDate: match["matchInfo"]["startDate"],
                  endDate: match["matchInfo"]["endDate"],
                  state: match["matchInfo"]["state"],
                  status: match["matchInfo"]["status"],
                  team1: RapidTeam(
                    teamId: match["matchInfo"]["team1"]["teamId"],
                    teamName: match["matchInfo"]["team1"]["teamName"],
                    teamSName: match["matchInfo"]["team1"]["teamSName"],
                    imageId: match["matchInfo"]["team1"]["imageId"],
                  ),
                  team2: RapidTeam(
                    teamId: match["matchInfo"]["team2"]["teamId"],
                    teamName: match["matchInfo"]["team2"]["teamName"],
                    teamSName: match["matchInfo"]["team2"]["teamSName"],
                    imageId: match["matchInfo"]["team2"]["imageId"],
                  ),
                  venueInfo: RapidVenueInfo(
                    id: match["matchInfo"]["venueInfo"]["id"],
                    ground: match["matchInfo"]["venueInfo"]["ground"],
                    city: match["matchInfo"]["venueInfo"]["city"],
                  ),
                  currBatTeamId: match["matchInfo"]["currBatTeamId"],
                  seriesStartDt: match["matchInfo"]["seriesStartDt"],
                  seriesEndDt: match["matchInfo"]["seriesEndDt"],
                  isTimeAnnounced: match["matchInfo"]["isTimeAnnounced"],
                  stateTitle: match["matchInfo"]["stateTitle"],
                ),
              ),
            );
          }

          print("Rapid Upcomming Match Lenth: ${rapidUpcomingList.length}");
          print(
              "Rapid Upcomming Series Name: ${rapidUpcomingList[0].matchInfo!.seriesName!}");

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  List<RapidMatch> rapidFixturesList = [];
  Future<void> getFixturesMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.fixturesMatchDayData),
        onSuccess: (response) {
          var matches = response["matchScheduleMap"][0]["scheduleAdWrapper"]
              ["matchScheduleList"];
          print("Fixture: ${matches[0]["matchInfo"][0]["matchId"]}");

          for (var match in matches) {
            rapidFixturesList.add(
              RapidMatch(
                matchInfo: RapidMatchInfo(
                  matchId: match["matchInfo"][0]["matchId"],
                  seriesId: match["matchInfo"][0]["seriesId"],
                  seriesName: match["seriesName"],
                  matchDesc: match["matchInfo"][0]["matchDesc"],
                  startDate: match["matchInfo"][0]["startDate"],
                  endDate: match["matchInfo"][0]["endDate"] ?? "",
                  state: match["matchInfo"][0]["state"] ?? "",
                  status: match["seriesCategory"] ?? "",
                  team1: RapidTeam(
                    teamId: match["matchInfo"][0]["team1"]["teamId"],
                    teamName: match["matchInfo"][0]["team1"]["teamName"],
                    teamSName: match["matchInfo"][0]["team1"]["teamSName"],
                    imageId: match["matchInfo"][0]["team1"]["imageId"],
                  ),
                  team2: RapidTeam(
                    teamId: match["matchInfo"][0]["team2"]["teamId"],
                    teamName: match["matchInfo"][0]["team2"]["teamName"],
                    teamSName: match["matchInfo"][0]["team2"]["teamSName"],
                    imageId: match["matchInfo"][0]["team2"]["imageId"],
                  ),
                  venueInfo: RapidVenueInfo(
                    ground: match["matchInfo"][0]["venueInfo"]["ground"],
                    city: match["matchInfo"][0]["venueInfo"]["city"],
                  ),
                  stateTitle: match["seriesCategory"] ?? "",
                ),
              ),
            );
          }

          print("Rapid Fixture Match Lenth: ${rapidFixturesList.length}");
          print(
              "Rapid Fixture Series Name: ${rapidFixturesList[0].matchInfo!.seriesName!}");

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });

    update();
  }

  List<SeriesListModel> rapidFeatureSeriesList = [];
  Future<void> getFeatureSeries() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.featureSeriesData),
        onSuccess: (response) {
          var matches = response["seriesMapProto"];

          print("Series: ${matches[0]["date"]}");

          for (var match in matches) {
            rapidFeatureSeriesList.add(
              SeriesListModel(
                  date: match["date"],
                  seriesModel: SeriesModel(
                    id: match["series"][0]["id"],
                    name: match["series"][0]["name"],
                    startDt: match["series"][0]["startDt"],
                    endDt: match["series"][0]["endDt"],
                  )),
            );
          }
          //
          print("Rapid Series Match Lenth: ${rapidFeatureSeriesList.length}");
          print("Rapid Series Name: ${rapidFeatureSeriesList[0].date!}");

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  List<RapidMatch> rapidSeriesMatchList = [];
  Future<void> getSeriesMatches(String seriesID) async {
    rapidSeriesMatchList = [];
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.seriesMatchListData + seriesID),
        onSuccess: (response) {
          var matches = response["matchDetails"];

          for (var i = 0; i < matches.length; i++) {
            if (i != 1 && i != 5) {
              print(
                  "S.Match ID: ${matches[i]["matchDetailsMap"]["match"][0]["matchInfo"]["matchId"]}");
              rapidSeriesMatchList.add(
                RapidMatch(
                  matchInfo: RapidMatchInfo(
                    matchId: matches[i]["matchDetailsMap"]["match"][0]
                        ["matchInfo"]["matchId"],
                    seriesId: matches[i]["matchDetailsMap"]["match"][0]
                        ["matchInfo"]["seriesId"],
                    seriesName: matches[i]["matchDetailsMap"]["match"][0]
                        ["matchInfo"]["seriesName"],
                    matchDesc: matches[i]["matchDetailsMap"]["match"][0]
                        ["matchInfo"]["matchDesc"],
                    startDate: matches[i]["matchDetailsMap"]["match"][0]
                        ["matchInfo"]["startDate"],
                    endDate: matches[i]["matchDetailsMap"]["match"][0]
                        ["matchInfo"]["endDate"],
                    state: matches[i]["matchDetailsMap"]["match"][0]
                        ["matchInfo"]["state"],
                    status: matches[i]["matchDetailsMap"]["match"][0]
                        ["matchInfo"]["status"],
                    team1: RapidTeam(
                      teamId: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["team1"]["teamId"],
                      teamName: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["team1"]["teamName"],
                      teamSName: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["team1"]["teamSName"],
                      imageId: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["team1"]["imageId"],
                    ),
                    team2: RapidTeam(
                      teamId: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["team2"]["teamId"],
                      teamName: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["team2"]["teamName"],
                      teamSName: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["team2"]["teamSName"],
                      imageId: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["team2"]["imageId"],
                    ),
                    venueInfo: RapidVenueInfo(
                      ground: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["venueInfo"]["ground"],
                      city: matches[i]["matchDetailsMap"]["match"][0]
                          ["matchInfo"]["venueInfo"]["city"],
                    ),

                    //  stateTitle: match["matchDetailsMap"]["match"][0]["seriesCategory"]??"",
                  ),
                ),
              );
            }
          }

          print("Rapid S.Match Match Lenth: ${rapidSeriesMatchList.length}");
          print(
              "Rapid S.Match Series Name: ${rapidSeriesMatchList[0].matchInfo!.seriesName!}");

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });

    update();
  }

  List<RapidPointTableModel> rapidPointTableList = [];
  Future<void> getPointTable(String seriesID) async {
    loading(true);
    rapidPointTableList = [];
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance.get(
            ApiEndpoints.seriesPointTableData + seriesID + "/points-table"),
        onSuccess: (response) {
          var points = response["pointsTable"][0]["pointsTableInfo"];
          for (var point in points) {
            rapidPointTableList.add(RapidPointTableModel(
              teamId: point["teamId"],
              teamName: point["teamName"],
              matchesPlayed: point["matchesPlayed"],
              matchesWon: point["matchesWon"],
              matchesDrawn: point["matchesDrawn"] ?? 0,
              matchesLost: point["matchesLost"],
              noRes: point["noRes"],
              points: point["points"],
              nrr: point["nrr"],
              teamFullName: point["teamFullName"],
              teamImageId: point["teamImageId"],
            ));
          }
          print("S.Match ID: ${rapidPointTableList.first.teamFullName}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  List<RapidMatch> rapidTeamFormList = [];
  Future<void> getTeamFormMatches(String teamId) async {
    loading(true);

    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.teamForm + teamId + "/results"),
        onSuccess: (response) {
          print(" Recent: $response");

          var matches = response["teamMatchesData"][0]["seriesMatches"][0]
              ["seriesAdWrapper"]["matches"];

          //  recentMatchModel = recentMatchModelFromJson(jsonEncode(response));
          printWrapped(
              "Recent Response: ${matches[0]["matchScore"]["team1Score"]["inngs1"]["inningsId"]}\n\n");
          for (var match in matches) {
            rapidTeamFormList.add(
              RapidMatch(
                matchInfo: RapidMatchInfo(
                  matchId: match["matchInfo"]["matchId"],
                  seriesId: match["matchInfo"]["seriesId"],
                  seriesName: match["matchInfo"]["seriesName"],
                  matchDesc: match["matchInfo"]["matchDesc"],
                  startDate: match["matchInfo"]["startDate"],
                  endDate: match["matchInfo"]["endDate"],
                  state: match["matchInfo"]["state"],
                  status: match["matchInfo"]["status"],
                  team1: RapidTeam(
                    teamId: match["matchInfo"]["team1"]["teamId"],
                    teamName: match["matchInfo"]["team1"]["teamName"],
                    teamSName: match["matchInfo"]["team1"]["teamSName"],
                    imageId: match["matchInfo"]["team1"]["imageId"],
                  ),
                  team2: RapidTeam(
                    teamId: match["matchInfo"]["team2"]["teamId"],
                    teamName: match["matchInfo"]["team2"]["teamName"],
                    teamSName: match["matchInfo"]["team2"]["teamSName"],
                    imageId: match["matchInfo"]["team2"]["imageId"],
                  ),
                  venueInfo: RapidVenueInfo(
                    id: match["matchInfo"]["venueInfo"]["id"],
                    ground: match["matchInfo"]["venueInfo"]["ground"],
                    city: match["matchInfo"]["venueInfo"]["city"],
                  ),
                  currBatTeamId: match["matchInfo"]["currBatTeamId"],
                  seriesStartDt: match["matchInfo"]["seriesStartDt"],
                  seriesEndDt: match["matchInfo"]["seriesEndDt"],
                  isTimeAnnounced: match["matchInfo"]["isTimeAnnounced"],
                  stateTitle: match["matchInfo"]["stateTitle"],
                ),
                matchScore: RapidMatchScore(
                  team1Score: RapidTeamScore(
                    inngs1: RapidInngs(
                      inningsId: match["matchScore"]["team1Score"]["inngs1"]
                          ["inningsId"],
                      runs: match["matchScore"]["team1Score"]["inngs1"]["runs"],
                      wickets: match["matchScore"]["team1Score"]["inngs1"]
                          ["wickets"],
                      overs: match["matchScore"]["team1Score"]["inngs1"]
                          ["overs"],
                    ),
                    // inngs2:  RapidInngs(
                    //   inningsId: match["matchScore"]["team1Score"]["inngs2"]["inningsId"],
                    //   runs: match["matchScore"]["team1Score"]["inngs2"]["runs"],
                    //   wickets: match["matchScore"]["team1Score"]["inngs2"]["wickets"],
                    //   overs: match["matchScore"]["team1Score"]["inngs2"]["overs"],
                    // ),
                  ),
                  team2Score: RapidTeamScore(
                    inngs1: RapidInngs(
                      inningsId: match["matchScore"]["team2Score"]["inngs1"]
                          ["inningsId"],
                      runs: match["matchScore"]["team2Score"]["inngs1"]["runs"],
                      wickets: match["matchScore"]["team2Score"]["inngs1"]
                          ["wickets"],
                      overs: match["matchScore"]["team2Score"]["inngs1"]
                          ["overs"],
                    ),
                    // inngs2:  RapidInngs(
                    //   inningsId: match["matchScore"]["team2Score"]["inngs2"]["inningsId"],
                    //   runs: match["matchScore"]["team2Score"]["inngs2"]["runs"],
                    //   wickets: match["matchScore"]["team2Score"]["inngs2"]["wickets"],
                    //   overs: match["matchScore"]["team2Score"]["inngs2"]["overs"],
                    // ),
                  ),
                ),
              ),
            );
          }
          print("Match Lenth: ${rapidTeamFormList.length}");
          print("Series Name: ${rapidTeamFormList[0].matchInfo!.seriesName!}");

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  RecentMatchInfoModel recentMatchInfoModel = RecentMatchInfoModel();
  Future<void> getMatchInfo(String matchId) async {
    loading(true);

    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.matchesInfo + "41881"),
        onSuccess: (response) {
          //  print(" Match Info : $response");

          var matcheInfo = response["matchInfo"];
          var venueInfo = response["venueInfo"];
          var team1Player = response["matchInfo"]["team1"]["playerDetails"];
          var team2Player = response["matchInfo"]["team2"]["playerDetails"];
          // print(" Match Info : $matcheInfo");
          print(" Match Info : $team1Player");
          // recentMatchModel = recentMatchModelFromJson(jsonEncode(response));

          List<PlayerRapid> t1PL = [];
          List<PlayerRapid> t2PL = [];
          List<dynamic> team1players = team1Player;

          for (var player in team1players) {
            t1PL.add(
              PlayerRapid(
                id: player["id"],
                name: player["name"],
                fullName: player["fullName"],
                nickName: player["nickName"],
                captain: player["captain"],
                keeper: player["keeper"],
                substitute: player["substitute"],
                teamId: player["teamId"],
                bowlingStyle: player["bowlingStyle"],
                faceImageId: player["faceImageId"],
              ),
            );
          }
          List<dynamic> team2players = team2Player;
          for (var player in team2players) {
            t2PL.add(
              PlayerRapid(
                id: player["id"],
                name: player["name"],
                fullName: player["fullName"],
                nickName: player["nickName"],
                captain: player["captain"],
                keeper: player["keeper"],
                substitute: player["substitute"],
                teamId: player["teamId"],
                bowlingStyle: player["bowlingStyle"],
                faceImageId: player["faceImageId"],
              ),
            );
          }

          recentMatchInfoModel = RecentMatchInfoModel(
            matchInfo: MatchInfoRapid(
              matchId: matcheInfo["matchId"],
              matchDescription: matcheInfo["matchDescription"],
              matchFormat: matcheInfo["matchFormat"],
              matchType: matcheInfo["matchType"],
              complete: matcheInfo["complete"],
              domestic: matcheInfo["domestic"],
              team1: TeamRapid(
                id: matcheInfo["team1"]["id"],
                name: matcheInfo["team1"]["name"],
                playerDetails: t1PL,
              ),
              team2: TeamRapid(
                id: matcheInfo["team2"]["id"],
                name: matcheInfo["team2"]["name"],
                playerDetails: t2PL,
              ),
              umpire1: Referee(
                id: matcheInfo["umpire1"]["id"],
                name: matcheInfo["umpire1"]["name"],
                country: matcheInfo["umpire1"]["country"],
              ),
              umpire2: Referee(
                id: matcheInfo["umpire2"]["id"],
                name: matcheInfo["umpire2"]["name"],
                country: matcheInfo["umpire2"]["country"],
              ),
              umpire3: Referee(
                id: matcheInfo["umpire3"]["id"],
                name: matcheInfo["umpire3"]["name"],
                country: matcheInfo["umpire3"]["country"],
              ),
              referee: Referee(
                id: matcheInfo["referee"]["id"],
                name: matcheInfo["referee"]["name"],
                country: matcheInfo["referee"]["country"],
              ),
              status: matcheInfo["status"],
              playersOfTheMatch: PlayerRapid(
                id: matcheInfo["playersOfTheMatch"][0]["id"] ?? 0,
                name: matcheInfo["playersOfTheMatch"][0]["name"] ?? "",
                faceImageId:
                    matcheInfo["playersOfTheMatch"][0]["faceImageId"] ?? 0,
                role: matcheInfo["playersOfTheMatch"][0]["role"] ?? "",
              ),

              // playersOfTheSeries:matcheInfo["playersOfTheSeries"],
            ),
            venueInfo: VenueInfoRapid(
              knownAs: venueInfo["knownAs"],
              ends: venueInfo["ends"],
              city: venueInfo["city"],
              country: venueInfo["country"],
              homeTeam: venueInfo["homeTeam"],
              curator: venueInfo["curator"],
              imageUrl: venueInfo["imageUrl"],
              ground: venueInfo["ground"],
            ),
          );
          // printWrapped(
          //     "Recent Response: ${matches[0]["matchScore"]["team1Score"]["inngs1"]["inningsId"]}\n\n");
          // for (var match in matches) {
          //   rapidTeamFormList.add(
          //     RapidMatch(
          //       matchInfo: RapidMatchInfo(
          //         matchId: match["matchInfo"]["matchId"],
          //         seriesId: match["matchInfo"]["seriesId"],
          //         seriesName: match["matchInfo"]["seriesName"],
          //         matchDesc: match["matchInfo"]["matchDesc"],
          //         startDate: match["matchInfo"]["startDate"],
          //         endDate: match["matchInfo"]["endDate"],
          //         state: match["matchInfo"]["state"],
          //         status: match["matchInfo"]["status"],
          //         team1: RapidTeam(
          //           teamId: match["matchInfo"]["team1"]["teamId"],
          //           teamName: match["matchInfo"]["team1"]["teamName"],
          //           teamSName: match["matchInfo"]["team1"]["teamSName"],
          //           imageId: match["matchInfo"]["team1"]["imageId"],
          //         ),
          //         team2: RapidTeam(
          //           teamId: match["matchInfo"]["team2"]["teamId"],
          //           teamName: match["matchInfo"]["team2"]["teamName"],
          //           teamSName: match["matchInfo"]["team2"]["teamSName"],
          //           imageId: match["matchInfo"]["team2"]["imageId"],
          //         ),
          //         venueInfo: RapidVenueInfo(
          //           id: match["matchInfo"]["venueInfo"]["id"],
          //           ground: match["matchInfo"]["venueInfo"]["ground"],
          //           city: match["matchInfo"]["venueInfo"]["city"],
          //         ),
          //         currBatTeamId: match["matchInfo"]["currBatTeamId"],
          //         seriesStartDt: match["matchInfo"]["seriesStartDt"],
          //         seriesEndDt: match["matchInfo"]["seriesEndDt"],
          //         isTimeAnnounced: match["matchInfo"]["isTimeAnnounced"],
          //         stateTitle: match["matchInfo"]["stateTitle"],
          //       ),
          //       matchScore: RapidMatchScore(
          //         team1Score: RapidTeamScore(
          //           inngs1: RapidInngs(
          //             inningsId: match["matchScore"]["team1Score"]["inngs1"]
          //             ["inningsId"],
          //             runs: match["matchScore"]["team1Score"]["inngs1"]["runs"],
          //             wickets: match["matchScore"]["team1Score"]["inngs1"]
          //             ["wickets"],
          //             overs: match["matchScore"]["team1Score"]["inngs1"]
          //             ["overs"],
          //           ),
          //           // inngs2:  RapidInngs(
          //           //   inningsId: match["matchScore"]["team1Score"]["inngs2"]["inningsId"],
          //           //   runs: match["matchScore"]["team1Score"]["inngs2"]["runs"],
          //           //   wickets: match["matchScore"]["team1Score"]["inngs2"]["wickets"],
          //           //   overs: match["matchScore"]["team1Score"]["inngs2"]["overs"],
          //           // ),
          //         ),
          //         team2Score: RapidTeamScore(
          //           inngs1: RapidInngs(
          //             inningsId: match["matchScore"]["team2Score"]["inngs1"]
          //             ["inningsId"],
          //             runs: match["matchScore"]["team2Score"]["inngs1"]["runs"],
          //             wickets: match["matchScore"]["team2Score"]["inngs1"]
          //             ["wickets"],
          //             overs: match["matchScore"]["team2Score"]["inngs1"]
          //             ["overs"],
          //           ),
          //           // inngs2:  RapidInngs(
          //           //   inningsId: match["matchScore"]["team2Score"]["inngs2"]["inningsId"],
          //           //   runs: match["matchScore"]["team2Score"]["inngs2"]["runs"],
          //           //   wickets: match["matchScore"]["team2Score"]["inngs2"]["wickets"],
          //           //   overs: match["matchScore"]["team2Score"]["inngs2"]["overs"],
          //           // ),
          //         ),
          //       ),
          //     ),
          //   );
          // }
          print(
              "Match Info Lenth: ${recentMatchInfoModel.matchInfo!.playersOfTheMatch!.name}");
          // print("Series Name: ${rapidTeamFormList[0].matchInfo!.seriesName!}");

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }
  //
  // Future<void> getCommentaries(String matchID) async {
  //   loading(true);
  //   await ApiService.instance.apiCall(
  //       execute: () async => await ApiService.instance
  //           .get(ApiEndpoints.commentariesData + matchID + "/comm?=&="),
  //       onSuccess: (response) {
  //         print("Commentaries Response: ${response}");
  //
  //         commentariesModel = commentariesModelFromJson(jsonEncode(response));
  //
  //         print(
  //             "Commentaries Data: ${commentariesModel.commentaryList!.length}");
  //         loading(false);
  //       },
  //       onError: (error) {
  //         print(error.toString());
  //         loading(false);
  //       });
  //   update();
  // }

  Future<void> getPlayerInfo(String playerId) async {
    print("Player Info URL ${ApiEndpoints.playerInfoData + playerId}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.playerInfoData + playerId),
        onSuccess: (response) {
          print("Player Info Response: ${response}");

          playerInfoModel = playerInfoModelFromJson(jsonEncode(response));

          print("Player Info model Data: ${playerInfoModel.name}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getPlayerSquad(String seriesID, String squadID) async {
    print(
        "Squad URL ${ApiEndpoints.playerSquadsData + "$seriesID/squads/$squadID"}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.playerSquadsData + "$seriesID/squads/$squadID"),
        onSuccess: (response) {
          print("Player Squad Response: ${response}");

          playerSquadModel = playerSquadModelFromJson(jsonEncode(response));

          print(
              "Player Squad model Data: ${playerSquadModel.player!.first.name}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getMatchSquad(String seriesID) async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.squadsData + "$seriesID/squads"),
        onSuccess: (response) {
          print("Squad Response: ${response}");

          matchSquadModel = matchSquadModelFromJson(jsonEncode(response));
          print("Squad model Data: ${matchSquadModel.seriesName}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getScoreCard(String matchID) async {
    //  print("Score Card URL ${ApiEndpoints.scoreCardData + matchID}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.scoreCardData + matchID),
        onSuccess: (response) {
          print("Score Response: ${response}");

          scoreCardModel = scoreCardModelFromJson(jsonEncode(response));

          print(
              "Player Of the Match: ${scoreCardModel.scoreCard!.first.matchId!}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  //Monk API Service
  Future<List<MonkLive>> getLive() async {
    List<MonkLive> monk_live = [];
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.monkLiveMatches),
        onSuccess: (response) {
          print("Live Response: $response");
          var lives = response["data"];
          for (var live in lives) {
            monk_live.add(MonkLive(
              id: live["id"],
              league_id: live["league_id"],
              round: live["round"],
              localteam_id: live["localteam_id"],
              visitorteam_id: live["visitorteam_id"],
              starting_at: live["starting_at"],
              type: live["type"],
              live: live["live"],
              status: live["status"],
              note: live["note"],
              venue_id: live["venue_id"],
              toss_won_team_id: live["toss_won_team_id"],
              winner_team_id: live["winner_team_id"],
              draw_noresult: live["draw_noresult"],
              total_overs_played: live["total_overs_played"],
              localteam_dl_data: Score(
                  score: live["localteam_dl_data"]["score"],
                  overs: live["localteam_dl_data"]["overs"],
                  wickets_out: live["localteam_dl_data"]["wickets_out"]),
              visitorteam_dl_data: Score(
                  score: live["visitorteam_dl_data"]["score"],
                  overs: live["visitorteam_dl_data"]["overs"],
                  wickets_out: live["visitorteam_dl_data"]["wickets_out"]),
            ));
          }
        },
        onError: (error) {
          print(error.toString());
        });

    // print(monk_live[0].round);
    return monk_live;
  }

  Future<MonkLeague> getLeague(String leagueId) async {
    MonkLeague monk_league = MonkLeague();
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance.get(
            ApiEndpoints.monkLeague + leagueId + ApiEndpoints.monkAPIToken),
        onSuccess: (response) {
          print("Leauge Response: ${response}");
          var data = response["data"];
          monk_league = MonkLeague(
              id: data["id"],
              name: data["name"],
              code: data["code"],
              image_path: data["image_path"]);
        },
        onError: (error) {
          print(error.toString());
        });

    print(monk_league.name);
    update();
    return monk_league;
  }

  Future<MonkVanue> getVenue(String venueId) async {
    MonkVanue monk_venue = MonkVanue();
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.monkVanue + venueId + ApiEndpoints.monkAPIToken),
        onSuccess: (response) {
          print("venue Response: ${response}");
          var data = response["data"];
          monk_venue = MonkVanue(
              id: data["id"],
              name: data["name"],
              city: data["code"],
              image_path: data["image_path"]);
        },
        onError: (error) {
          print(error.toString());
        });

    print(monk_venue.name);
    update();
    return monk_venue;
  }

  Future<MonkTeam> getTeam(String teamId) async {
    MonkTeam monkTeam = MonkTeam();
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.monkTeams + teamId + ApiEndpoints.monkAPIToken),
        onSuccess: (response) {
          print("Team Response: ${response}");
          var data = response["data"];
          monkTeam = MonkTeam(
              id: data["id"],
              name: data["name"],
              code: data["code"],
              image_path: data["image_path"]);
        },
        onError: (error) {
          print(error.toString());
        });

    print(monkTeam.name);
    update();
    return monkTeam;
  }

  // Future<List<LeagueUpdateModel>> getLeague(String leagueId) async {
  //   loading(true);
  //
  //
  //
  //   await ApiService.instance.apiCall(
  //       execute: () async => await ApiService.instance
  //           .getWithoutHeader(ApiEndpoints.monkLeague+leagueId+ApiEndpoints.monkAPIToken),
  //       onSuccess: (response) {
  //         print(response);
  //         // MonkLeagueModel(resource: )
  //
  //         var  responseData = jsonDecode(response.body);
  //
  //         monkListLeagueModel = leagueUpdateModelFromJson(jsonEncode(responseData["data"]));
  //         // monkLeague = monkLeague.fromJason(e);
  //         // monkLeague = leagueFromJson(jsonEncode(response));
  //         //
  //         //  print("Monk League :${monkLeagueModel.data!.length}");
  //         loading(false);
  //       },
  //       onError: (error) {
  //         print(error.toString());
  //         loading(false);
  //       });
  //   update();
  //   return monkListLeagueModel;
  //
  // }

  // Future<void> getLiveMatches() async {
  //   loading(true);
  //   await ApiService.instance.apiCall(
  //       execute: () async =>
  //           await ApiService.instance.get(ApiEndpoints.liveMatches),
  //       onSuccess: (response) {
  //         print(response);
  //
  //         liveMatchesModel = liveMatchesModelFromJson(jsonEncode(response));
  //         //
  //         print(
  //             "Live Matches:${liveMatchesModel.filters!.matchType!.first.capitalizeFirst}");
  //         loading(false);
  //       },
  //       onError: (error) {
  //         print(error.toString());
  //         loading(false);
  //       });
  //   update();
  // }

  Future<void> getOverSummery(String matchID) async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.overSummery + matchID + "/overs"),
        onSuccess: (response) {
          print("Over Summery Model: ${response}");
          overSummeryModel = overSummeryModelFromJson(jsonEncode(response));

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<bool> registerUser(String firstName, String lastName, String phone,
      String password, String imageUrl) async {
    final snapshot1 =
        await FirebaseFirestore.instance.collection('Users').doc(phone).get();
    if (snapshot1.exists) {
      showToast('This User is Already Exist');
      return false;
    } else {
      DateTime date = DateTime.now();
      String dateData = '${date.day}-${date.month}-${date.year}';
      Map<String, dynamic> map = {
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'password': password,
        'date': dateData,
        'id': phone,
        'profileImage': imageUrl,
        'totalPoint': '00',
      };

      try {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(map['id'])
            .set(map);
        await getUser(phone);
        return true;
      } catch (err) {
        showToast('$err');
        print(err);

        return false;
      }
    }
  }

  Future<bool> registerUserWithGoogle(String firstName, String lastName,
      String phone, String email, String password, String imageUrl) async {
    // final snapshot1 =
    // await FirebaseFirestore.instance.collection('Users').doc(phone).get();

    DateTime date = DateTime.now();
    String dateData = '${date.day}-${date.month}-${date.year}';
    Map<String, dynamic> map = {
      'firstName': firstName,
      'lastName': lastName,
      'phone': "",
      'email': email,
      'password': password,
      'date': dateData,
      'id': phone,
      'profileImage': imageUrl,
      'totalPoint': '00',
    };

    try {
      final docRef =
          FirebaseFirestore.instance.collection("Users").doc(map['id']).get();
      docRef.then((doc) async {
        if (doc.exists) {
          return true;
        } else {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(map['id'])
              .set(map);
          await getUser(phone);
          return true;
        }
      });
      return true;
    } catch (err) {
      showToast('$err');
      print(err);

      return false;
    }
  }

  // RxBool isLogIn = false.obs;
  Future<void> getUser(String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get()
          .then((snapShot) {
        UserModel user = UserModel(
          firstName: snapShot['firstName'],
          lastName: snapShot['lastName'],
          phone: snapShot['phone'],
          password: snapShot['password'],
          date: snapShot['date'],
          id: snapShot['id'],
          profileImage: snapShot['profileImage'],
          totalPoint: snapShot['totalPoint'],
        );
        userModel = user;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', userModel.id!);
    } catch (error) {
      showToast('$error');
    }
    update();
  }

  Future<bool> loginData(String inputPhone, String inputPassword) async {
    final snapshot1 = await FirebaseFirestore.instance
        .collection('Users')
        .doc(inputPhone)
        .get();
    if (snapshot1.exists) {
      await getUser(inputPhone);
      update();
      return false;
    } else {
      showToast('This User is Not Exist');
    }
    update();
    return false;
  }

  Future<bool> sellPoint(String sellPoints, String transectionAddress,
      String password, String transectionMethod) async {
    DateTime date = DateTime.now();
    String dateData = '${date.day}-${date.month}-${date.year}';
    Map<String, dynamic> map = {
      'sellPoints': sellPoints,
      'transectionAddress': transectionAddress,
      'transectionMethod': transectionMethod,
      'password': password,
      'date': dateData,
      'id': "${date.microsecondsSinceEpoch}",
    };
    try {
      await FirebaseFirestore.instance
          .collection("SellPoint")
          .doc(map['id'])
          .set(map);

      await updatePoints(sellPoints, false);

      return true;
    } catch (err) {
      showToast('$err');
      print(err);

      return false;
    }
  }

  Future<bool> updatePoints(String sellPoint, bool isAdd) async {
    final prefs = await SharedPreferences.getInstance();

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(prefs.getString('userId'))
        .update({
      "totalPoint": isAdd
          ? "${int.parse(userModel.totalPoint!) + int.parse(sellPoint)}"
          : "${int.parse(userModel.totalPoint!) - int.parse(sellPoint)}",
    });
    await getUser(prefs.getString('userId')!);
    return true;
  }

  Future<bool> updateProfile(
      String firstName, String lastName, String phoneNo) async {
    final prefs = await SharedPreferences.getInstance();

    print(firstName);
    print(lastName);
    print(phoneNo);
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(prefs.getString('userId'))
        .update({
      "firstName": firstName,
      "lastName": lastName,
      "phone": phoneNo,
    });
    await getUser(prefs.getString('userId')!);
    return true;
  }
}
