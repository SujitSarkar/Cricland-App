import 'dart:convert';
import 'package:cricland/home/model/commentaries_model.dart';
import 'package:cricland/home/model/feature_series_model.dart';
import 'package:cricland/home/model/fixtures_match_model.dart';
import 'package:cricland/home/model/match_info_model.dart';
import 'package:cricland/home/model/point_table_model.dart';
import 'package:cricland/home/model/recent_match_model.dart';
import 'package:cricland/home/model/live_matches_model.dart';
import 'package:cricland/home/model/series_match_list_model.dart';
import 'package:cricland/home/model/squads_model.dart';
import 'package:cricland/home/model/upcoming_match_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/api_service.dart';
import 'package:get/get.dart';

import '../model/player_squad_model.dart';
import '../model/score_card_model.dart';

class HomeController extends GetxController {
  // late MatchesModel matchesModel;
  late LiveMatchesModel liveMatchesModel;
  late RecentMatchModel recentMatchModel;
  late UpcomingMatchModel upcomingMatchModel;
  late FixturesMatchModel fixturesMatchModel;
  late FeatureSeriesModel featureSeriesModel;
  late ScoreCardModel scoreCardModel;
  late PointTableModel pointTableModel;
  late CommentariesModel commentariesModel;
  late SeriesMatchListModel seriesMatchListModel;
  late MatchInfoModel matcheInfoModel;
  late MatchSquadModel matchSquadModel;
  late PlayerSquadModel playerSquadModel;

  RxList fixtureMatchList = [].obs;
  RxList playerSquadModelList = [].obs;

  RxBool loading = false.obs;
  @override
  void onInit() async {
    //  matchesModel = MatchesModel();
    liveMatchesModel = LiveMatchesModel();
    recentMatchModel = RecentMatchModel();
    upcomingMatchModel = UpcomingMatchModel();
    fixturesMatchModel = FixturesMatchModel();
    featureSeriesModel = FeatureSeriesModel();
    scoreCardModel = ScoreCardModel();
    pointTableModel = PointTableModel();
    seriesMatchListModel = SeriesMatchListModel();
    commentariesModel = CommentariesModel();
    matcheInfoModel = MatchInfoModel();
    matchSquadModel = MatchSquadModel();
    playerSquadModel = PlayerSquadModel();
    await getRecentMatches();
    await getLiveMatches();
    await getUpComingMatches();
    await getFixturesMatches();
    await getFeatureSeries();
    await getPointTable("3718");
    await getCommentaries("38356");
    await getMatchSquad("3718");
    await getPlayerSquad("3718", "15826");
    // await getMatchInfo("38356");

    super.onInit();
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
    print("Squad URL ${ApiEndpoints.squadsData + "3718/squads"}");
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

  Future<void> getSeriesMatches(String seriesID) async {
    print("Series URL ${ApiEndpoints.seriesMatchListData + seriesID}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.seriesMatchListData + seriesID),
        onSuccess: (response) {
          print("Series Response: ${response}");

          seriesMatchListModel =
              seriesMatchListModelFromJson(jsonEncode(response));

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getCommentaries(String matchID) async {
    print(
        "Commentaries URL ${ApiEndpoints.commentariesData + matchID + "/comm?=&="}");
    print(
        "Commentaries URL ${ApiEndpoints.commentariesData + matchID + "/comm?=&="}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.commentariesData + matchID + "/comm?=&="),
        onSuccess: (response) {
          print("Commentaries Response: ${response}");

          commentariesModel = commentariesModelFromJson(jsonEncode(response));

          print(
              "Commentaries Data: ${commentariesModel.commentaryList!.length}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getPointTable(String seriesID) async {
    print(
        "Point URL ${ApiEndpoints.scoreCardData + seriesID + "/points-table"}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance.get(
            ApiEndpoints.seriesPointTableData + seriesID + "/points-table"),
        onSuccess: (response) {
          print("Point Response: ${response}");

          pointTableModel = pointTableModelFromJson(jsonEncode(response));

          print("Point Table Data: ${pointTableModel.pointsTable!.length}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getScoreCard(String matchID) async {
    print("Score Card URL ${ApiEndpoints.scoreCardData + matchID}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.scoreCardData + matchID),
        onSuccess: (response) {
          print("Score Response: ${response}");

          scoreCardModel = scoreCardModelFromJson(jsonEncode(response));

          print(
              "Player Of the Match: ${scoreCardModel.matchHeader!.playersOfTheMatch!.first.name!}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getRecentMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.recentMatchData),
        onSuccess: (response) {
          print("Recent Response: ${response}");

          recentMatchModel = recentMatchModelFromJson(jsonEncode(response));
          print("\n\nDDDDDDDD");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getUpComingMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.upComingMatchData),
        onSuccess: (response) {
          print("Upcoming Response: ${response}");
          upcomingMatchModel = upcomingMatchModelFromJson(jsonEncode(response));
          print("\n\nDDDDDDDD");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getFixturesMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.fixturesMatchDayData),
        onSuccess: (response) {
          print("Fixtures Response: ${response}");
          fixturesMatchModel = fixturesMatchModelFromJson(jsonEncode(response));
          print("\n\nDDDDDDDD");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });

    update();
  }

  Future<void> getFeatureSeries() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.featureSeriesData),
        onSuccess: (response) {
          print("Feature Response: ${response}");
          featureSeriesModel = featureSeriesModelFromJson(jsonEncode(response));
          print("\n\nDDDDDDDD");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getMatchInfo(String matchId) async {
    loading(true);

    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.matchesInfo + matchId),
        onSuccess: (response) {
          print("Match Info Response: ${response}");

          //TODO
          matcheInfoModel = matchInfoModelFromJson(response);
          //
          print("\n\n${matcheInfoModel.matchInfo!.status}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getLiveMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.liveMatches),
        onSuccess: (response) {
          print(response);

          liveMatchesModel = liveMatchesModelFromJson(jsonEncode(response));
          //
          print(
              "Live Matches:${liveMatchesModel.filters!.matchType!.first.capitalizeFirst}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }
}
