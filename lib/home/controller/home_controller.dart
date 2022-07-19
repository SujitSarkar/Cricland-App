import 'dart:convert';
import 'package:cricland/home/model/feature_series_model.dart';
import 'package:cricland/home/model/fixtures_match_model.dart';
import 'package:cricland/home/model/recent_match_model.dart';
import 'package:cricland/home/model/live_matches_model.dart';
import 'package:cricland/home/model/upcoming_match_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // late MatchesModel matchesModel;
  late LiveMatchesModel liveMatchesModel;
  late RecentMatchModel recentMatchModel;
  late UpcomingMatchModel upcomingMatchModel;
  late FixturesMatchModel fixturesMatchModel;
  late FeatureSeriesModel featureSeriesModel;

  RxBool loading = false.obs;
  @override
  void onInit() {
    //  matchesModel = MatchesModel();
    liveMatchesModel = LiveMatchesModel();
    recentMatchModel = RecentMatchModel();
    upcomingMatchModel = UpcomingMatchModel();
    fixturesMatchModel = FixturesMatchModel();
    featureSeriesModel = FeatureSeriesModel();
    getRecentMatches();
    getLiveMatches();
    getUpComingMatches();
    getFixturesMatches();
    getFeatureSeries();
    super.onInit();
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
            await ApiService.instance.get(ApiEndpoints.fixturesMatchData),
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

  // Future<void> getMatchInfo(String matchId) async {
  //   loading(true);
  //
  //   await ApiService.instance.apiCall(
  //       execute: () async =>
  //           await ApiService.instance.get(ApiEndpoints.matchesInfo + matchId),
  //       onSuccess: (response) {
  //         print("Response2: ${response}");
  //
  //         //TODO
  //         matchesModel = matchesModelFromJson(response);
  //         //
  //         print("\n\nDDDDDDDD");
  //         loading(false);
  //       },
  //       onError: (error) {
  //         print(error.toString());
  //         loading(false);
  //       });
  //   update();
  // }

  Future<void> getLiveMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.liveMatches),
        onSuccess: (response) {
          //  print(response);

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
