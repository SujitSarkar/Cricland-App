import 'dart:convert';
import 'dart:ffi';
import 'package:cricland/home/model/recent_match_model.dart';
import 'package:http/http.dart' as http;

import 'package:cricland/home/model/all_sports_model/live_match_model.dart';
import 'package:cricland/home/model/live_matches_model.dart';
import 'package:cricland/home/model/matches_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // late MatchesModel matchesModel;
  late LiveMatchesModel liveMatchesModel;
  late RecentMatchModel recentMatchModel;

  RxBool loading = false.obs;
  @override
  void onInit() {
    //  matchesModel = MatchesModel();
    liveMatchesModel = LiveMatchesModel();
    recentMatchModel = RecentMatchModel();
    getRecentMatches();
    getLiveMatches();

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
