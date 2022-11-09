import 'dart:convert';
import 'package:cricland/home/model/player_info_model.dart';
import 'package:cricland/more/model/ranking_model.dart';
import 'package:cricland/more/model/team_ranking_model.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_details.dart';
import 'package:cricland/public/variables/api_endpoint.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RankingController extends GetxController {
  static final RankingController instance = Get.find();
  RxBool bodyLoading = false.obs;
  late TabController manPlayerTypeTabController;
  late TabController womenPlayerTypeTabController;

  RxString selectedManGameType = Variables.manGameType.first.obs;
  RxString selectedWomenGameType = Variables.manGameType.first.obs;

  RxList<RankingModel> manRankingList = <RankingModel>[].obs;
  RxList<TeamRankingModel> manTeamRankingList = <TeamRankingModel>[].obs;

  RxList<RankingModel> womenRankingList = <RankingModel>[].obs;
  RxList<TeamRankingModel> womenTeamRankingList = <TeamRankingModel>[].obs;

  Rx<PlayerInfoModel> playerInfoModel = PlayerInfoModel().obs;
  String selectedPlayerId = '';
  String selectedTeamId = '';

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> initData() async {
    // await getManRankingList();
  }

  Future<void> getManRankingList() async {
    if (!bodyLoading.value) {
      bodyLoading(true);
      try {
        final url =
            '${ApiEndpoint.baseUrl}${ApiEndpoint.rankings}${Variables.manCategoryList[manPlayerTypeTabController.index].toLowerCase()}?formatType=${selectedManGameType.value.toLowerCase()}';
        http.Response response =
            await http.get(Uri.parse(url), headers: ApiEndpoint.header);
        print(url);
        print(response.statusCode);
        // print(response.body);
        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          if (manPlayerTypeTabController.index == 3) {
            manTeamRankingList.value =
                teamRankingModelFromJson(jsonEncode(jsonData['rank']));
          } else {
            manRankingList.value =
                rankingModelFromJson(jsonEncode(jsonData['rank']));
          }
        } else if (response.statusCode == 204) {
          manTeamRankingList.clear();
          manRankingList.clear();
          showToast('No data found');
        } else {
          showToast('Man\'s ranking data fetching error');
        }
        bodyLoading(false);
      } catch (error) {
        bodyLoading(false);
        print(error.toString());
        showToast(error.toString());
      }
    } else {
      // showToast('Another process running');
    }
  }

  Future<void> getWomenRankingList() async {
    if (!bodyLoading.value) {
      bodyLoading(true);
      try {
        final url =
            '${ApiEndpoint.baseUrl}${ApiEndpoint.rankings}${Variables.manCategoryList[womenPlayerTypeTabController.index].toLowerCase()}?isWomen=1&formatType=${selectedWomenGameType.value.toLowerCase()}';
        http.Response response =
            await http.get(Uri.parse(url), headers: ApiEndpoint.header);
        print(url);
        print(response.statusCode);
        // print(response.body);
        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          if (womenPlayerTypeTabController.index == 3) {
            womenTeamRankingList.value =
                teamRankingModelFromJson(jsonEncode(jsonData['rank']));
          } else {
            womenRankingList.value =
                rankingModelFromJson(jsonEncode(jsonData['rank']));
          }
        } else if (response.statusCode == 204) {
          womenTeamRankingList.clear();
          womenRankingList.clear();
          showToast('No data found');
        } else {
          showToast('Women\'s ranking data fetching error');
        }
        bodyLoading(false);
      } catch (error) {
        bodyLoading(false);
        print(error.toString());
        showToast(error.toString());
      }
    } else {
      // showToast('Another process running');
    }
  }

  Future<void> manPlayerOnTap(String id) async {
    selectedPlayerId = id;
    getPlayerInfo();
    Get.to(() => const PlayerDetailsPage());
  }

  Future<void> manTeamOnTap() async {}

  Future<void> getPlayerInfo() async {
    if (!bodyLoading.value) {
      bodyLoading(true);
      try {
        final url =
            '${ApiEndpoint.baseUrl}${ApiEndpoint.playerInfo}$selectedPlayerId';
        http.Response response =
            await http.get(Uri.parse(url), headers: ApiEndpoint.header);
        print(url);
        print(response.statusCode);
        // print(response.body);
        if (response.statusCode == 200) {
          playerInfoModel.value = playerInfoModelFromJson(response.body);
        } else if (response.statusCode == 204) {
          showToast('Player info not found');
        } else {
          showToast('Player info fetching error');
        }
        bodyLoading(false);
      } catch (error) {
        bodyLoading(false);
        print(error.toString());
        showToast(error.toString());
      }
    } else {
      // showToast('Another process running');
    }
  }
}
