import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricland/home/model/player_info_model.dart';
import 'package:cricland/more/model/ranking_model.dart';
import 'package:cricland/more/model/team_ranking_model.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_details_man.dart';
import 'package:cricland/more/view/icc_women_ranking/player_details/player_details_women.dart';
import 'package:cricland/news/model/article_model.dart';
import 'package:cricland/public/variables/api_endpoint.dart';
import 'package:cricland/public/variables/app_string.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/foundation.dart';
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

  late RxList<ArticleModel> recentArticleList;

  @override
  void onInit() async {
    super.onInit();
    recentArticleList = <ArticleModel>[].obs;
    getRecentArticleList();
  }

    Future<void> getRecentArticleList() async {
    bodyLoading(true);
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(AppString.articleCollection)
          .where('youtube_video_link', isEqualTo: "")
          .orderBy('time_stamp', descending: true)
          .limit(30)
          .get();
      recentArticleList.clear();
      for (var element in snapshot.docChanges) {
        ArticleModel model = ArticleModel(
          id: element.doc['id'],
          title: element.doc['title'],
          category: element.doc['category'],
          article: element.doc['article'],
          imageLink: element.doc['image_link'],
          youtubeVideoLink: element.doc['youtube_video_link'],
          timeStamp: element.doc['time_stamp'],
        );
        recentArticleList.add(model);
      }
      if (kDebugMode) {
        print('Recent Article: ${recentArticleList.length}');
      }
      bodyLoading(false);
    } on SocketException {
      bodyLoading(false);
      showToast(AppString.noInternet);
    } catch (error) {
      bodyLoading(false);
      showToast(error.toString());
      print(error.toString());
    }
  }

  Future<void> getManTeamRankingList() async {
    if (!bodyLoading.value) {
      bodyLoading(true);
      try {
        final url =
            '${ApiEndpoint.finalBaseUrl}/${ApiEndpoint.teamRanking}?filter[type]=${selectedManGameType.value}&filter[gender]=men&api_token=${ApiEndpoint.apiToken}';
        final http.Response response =
            await http.get(Uri.parse(url));
        debugPrint(url);
        debugPrint(response.statusCode.toString());
        debugPrint(response.body);
        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          for(var element in jsonData['data']){
            if(element['gender']=='men'){
              manTeamRankingList.value = teamRankingModelFromJson(jsonEncode(element['team']));
            }
          }
        } else {
          showToast('Man\'s ranking data fetching error');
        }
        bodyLoading(false);
      } catch (error) {
        bodyLoading(false);
        showToast(error.toString());
      }
    } else {
      // showToast('Another process running');
    }
  }

  Future<void> getWomenTeamRankingList() async {
    if (!bodyLoading.value) {
      bodyLoading(true);
      try {
        final url =
            '${ApiEndpoint.finalBaseUrl}/${ApiEndpoint.teamRanking}?filter[type]=${selectedWomenGameType.value}&filter[gender]=women&api_token=${ApiEndpoint.apiToken}';
        final http.Response response =
        await http.get(Uri.parse(url));
        debugPrint(url);
        debugPrint(response.statusCode.toString());
        debugPrint(response.body);
        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          for(var element in jsonData['data']){
            if(element['gender']=='women'){
              womenTeamRankingList.value = teamRankingModelFromJson(jsonEncode(element['team']));
            }
          }
        } else {
          showToast('Women\'s ranking data fetching error');
        }
        bodyLoading(false);
      } catch (error) {
        bodyLoading(false);
        showToast(error.toString());
      }
    } else {
      // showToast('Another process running');
    }
  }

  Future<void> manPlayerOnTap(String id) async {
    selectedPlayerId = id;
    getPlayerInfo();
    Get.to(() => const PlayerDetailsPageMan());
  }

  Future<void> womenPlayerOnTap(String id) async {
    selectedPlayerId = id;
    getPlayerInfo();
    Get.to(() => const PlayerDetailsPageWomen());
  }

  Future<void> manTeamOnTap() async {}

  Future<void> womenTeamOnTap() async {}

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
