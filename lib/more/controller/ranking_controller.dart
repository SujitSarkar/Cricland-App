import 'dart:convert';
import 'package:cricland/more/model/ranking_model.dart';
import 'package:cricland/more/model/team_ranking_model.dart';
import 'package:cricland/public/variables/api_endpoint.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RankingController extends GetxController {
  RxBool bodyLoading = false.obs;
  late TabController manPlayerTypeTabController;
  late TabController womenPlayerTypeTabController;

  RxString selectedManGameType = Variables.manGameType.first.obs;
  RxString selectedWomenGameType = Variables.manGameType.first.obs;

  RxList<RankingModel> manRankingList = <RankingModel>[].obs;
  RxList<TeamRankingModel> manTeamRankingList = <TeamRankingModel>[].obs;

  RxList<RankingModel> womenRankingList = <RankingModel>[].obs;
  RxList<TeamRankingModel> womwnTeamRankingList = <TeamRankingModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> initData() async {
    await getManRankingList();
  }

  Future<void> getManRankingList() async {
    if (!bodyLoading.value) {
      bodyLoading(true);
      try {
        final url =
            '${ApiEndpoint.baseUrl}${ApiEndpoint.rankings}/${Variables.manCategoryList[manPlayerTypeTabController.index].toLowerCase()}?formatType=${selectedManGameType.value.toLowerCase()}';
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
}
