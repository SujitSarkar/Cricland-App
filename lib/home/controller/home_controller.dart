import 'dart:convert';
import 'dart:ffi';

import 'package:cricland/home/model/all_sports_model/live_match_model.dart';
import 'package:cricland/home/model/live_matches_model.dart';
import 'package:cricland/home/model/matches_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // late MatchesModel matchesModel;
  // late LiveMatchesModel liveMatchesModel;

  //All Sports API
  late LiveMatchModel liveMatchModel;
  RxBool loading = false.obs;
  @override
  void onInit() {
    // matchesModel = MatchesModel();
    // //  getRecentMatches();
    // getLiveMatches();
    // getImage('236205');
    print("Method Calling");
    //All Sports API
    liveMatchModel = LiveMatchModel();
    getLiveMatch();
    super.onInit();
  }
  //
  // Future<void> getRecentMatches() async {
  //   loading(true);
  //   await ApiService.instance.apiCall(
  //       execute: () async =>
  //           await ApiService.instance.get(ApiEndpoints.matchesData),
  //       onSuccess: (response) {
  //         print("Response2: ${response}");
  //         matchesModel = matchesModelFromJson(jsonEncode(response));
  //         //  matchesModel = matchesModelFromJson(response);
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
  //
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
  //
  // Future<void> getLiveMatches() async {
  //   loading(true);
  //   await ApiService.instance.apiCall(
  //       execute: () async =>
  //           await ApiService.instance.get(ApiEndpoints.liveMatches),
  //       onSuccess: (response) {
  //         //  print(response);
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
  //
  // Future<void> getImage(String imageId) async {
  //   loading(true);
  //   await ApiService.instance.apiCall(
  //       execute: () async => await ApiService.instance
  //           .get(ApiEndpoints.image + "$imageId/i.jpg"),
  //       onSuccess: (response) {
  //         print("\n\n\n\n$response");
  //
  //         //  liveMatchesModel = liveMatchesModelFromJson(jsonEncode(response));
  //         //
  //         // print(
  //         //     "Live Matches:${liveMatchesModel.filters!.matchType!.first.capitalizeFirst}");
  //         loading(false);
  //       },
  //       onError: (error) {
  //         print(error.toString());
  //         loading(false);
  //       });
  //   update();
  // }

  //All Sports API
  Future<void> getLiveMatch() async {
    loading(true);
    print("Method Calling");
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.allSportsLiveMatch + ApiEndpoints.apiKey),
        onSuccess: (response) {
          //  print(response);

          liveMatchModel = liveMatchModelFromJson(jsonEncode(response));
          //
          print("Live Matches:${liveMatchModel.result!.first.leagueName}");
          loading(false);
        },
        onError: (error) {
          print("ERROR: ${error.toString()}");
          // loading(false);
        });
    update();
  }
}
