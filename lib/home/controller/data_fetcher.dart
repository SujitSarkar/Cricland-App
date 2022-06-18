import 'dart:convert';
import 'dart:io';

import 'package:cricland/home/constants.dart';
import 'package:cricland/home/controller/connection_helper.dart';
import 'package:cricland/home/model/data_model.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DataFetcher {
  final ConnectionHelper _connectionHelper = ConnectionHelper();

  Future<List<MatchesModel>> fetchMatches({
    required int productType,
    required String countryID,
  }) async {
    List<MatchesModel> matches = [];

    MatchesModel matchesModel;

    // Map<String, dynamic> queryData = {
    //   "productType": productType,
    //   "countryId": countryID,
    // };
    Response<dynamic>? response = await _connectionHelper.getDataWithHeaders(
      API.getMatches,
     // queryData: queryData,
    );
    if (response != null) {
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = response.data["typeMatches"];
        var appIndexData = response.data["appIndex"];
        var filtersData = response.data["filters"];
        var responseLastUpdatedData = response.data["responseLastUpdated"];

        for (var match in data) {
          matchesModel = MatchesModel(
            // typeMatchesModel: [],
            typeMatchesModel: [
              TypeMatchesModel(
                matchType: match["matchType"],
                seriesMatchesModel: [
                  SeriesMatchesModel(seriesAdWrapperModel: [
                    SeriesAdWrapperModel(
                      seriesId: match["seriesMatches"]["seriesAdWrapper"]
                          ["seriesId"],
                      seriesName: match["seriesMatches"]["seriesAdWrapper"]
                          ["seriesName"],
                      matchModel: [
                        MatchModel(
                          matchScoreModel: MatchScoreModel(
                            teamOneScoreModel: TeamScoreModel(
                              inningsModel: InningsModel(
                                inningsId: match
                                ["seriesMatches"]
                                ["seriesAdWrapper"]["matches"]
                                ["matchScore"]["team1Score"]
                                ["inngs1"]["inningsId"],
                                runs: match["seriesMatches"]
                                ["seriesAdWrapper"]["matches"]
                                ["matchScore"]["team1Score"]
                                ["inngs1"]["runs"],
                                wickets: match
                                ["seriesMatches"]
                                ["seriesAdWrapper"]["matches"]
                                ["matchScore"]["team1Score"]
                                ["inngs1"]["wickets"],
                                overs: match["seriesMatches"]
                                ["seriesAdWrapper"]["matches"]
                                ["matchScore"]["team1Score"]
                                ["inngs1"]["overs"],
                              ),
                            ),
                            teamTwoScoreModel: TeamScoreModel(
                              inningsModel: InningsModel(
                                inningsId: match["typeMatches"]
                                ["seriesMatches"]
                                ["seriesAdWrapper"]["matches"]
                                ["matchScore"]["team2Score"]
                                ["inngs1"]["inningsId"],
                                runs: match["typeMatches"]["seriesMatches"]
                                ["seriesAdWrapper"]["matches"]
                                ["matchScore"]["team2Score"]
                                ["inngs1"]["runs"],
                                wickets: match["typeMatches"]
                                ["seriesMatches"]
                                ["seriesAdWrapper"]["matches"]
                                ["matchScore"]["team2Score"]
                                ["inngs1"]["wickets"],
                                overs: match["typeMatches"]["seriesMatches"]
                                ["seriesAdWrapper"]["matches"]
                                ["matchScore"]["team2Score"]
                                ["inngs1"]["overs"],
                              ),
                            ),
                          ),
                          matchInfoModel: MatchInfoModel(
                              status: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["status"],
                              seriesName: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["seriesName"],
                              currBatTeamId: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["currBatTeamId"],
                              teamOneModel: TeamModel(
                                  imageId:  match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["team1"]["imageId"],
                                  teamId: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["team1"]["teamId"],
                                  teamSName: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["team1"]["teamSName"],
                                  teamName: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["team1"]["teamName"]),
                              endDate: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["endDate"],
                              seriesId: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["seriesId"],
                              isTimeAnnounced: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["isTimeAnnounced"],
                              matchId: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["matchId"],
                              stateTitle: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["stateTitle"],
                              startDate: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["startDate"],
                              teamTwoModel: TeamModel(
                                  imageId:  match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["team2"]["imageId"],
                                  teamId: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["team2"]["teamId"],
                                  teamSName: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["team2"]["teamSName"],
                                  teamName: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["team2"]["teamName"]),
                              venueInfoModel: VenueInfoModel(
                                  timezone: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["venueInfo"]["timezone"],
                                  ground: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["venueInfo"]["ground"],
                                  id: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["venueInfo"]["id"],
                                  city: match["typeMatches"]["seriesMatches"]
                                  ["seriesAdWrapper"]["matches"]["matchInfo"]["venueInfo"]["city"]),
                              seriesEndDt: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["seriesEndDt"],
                              seriesStartDt: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["seriesStartDt"],
                              state: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["state"],
                              matchFormat: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["matchFormat"],
                              matchDesc: match["typeMatches"]["seriesMatches"]
                              ["seriesAdWrapper"]["matches"]
                              ["matchInfo"]["matchDesc"]),
                        ),
                      ],
                    )
                  ])
                ],
              ),
            ],
            filtersModel: FiltersModel(matchType: filtersData["matchType"]),
            appIndexModel: AppIndexModel(
              seoTitle: appIndexData["seoTitle"],
              webURL: appIndexData["webURL"],
            ),
            //  appIndexModel: AppIndexModel(seoTitle: '', webURL: ''),
            responseLastUpdated: responseLastUpdatedData,
          );
          print(matchesModel.typeMatchesModel.first.seriesMatchesModel.first
              .seriesAdWrapperModel.first.seriesId);
        }
      }
    }
    return matches;
  }

// Future<bool> resendOTP({required String email}) async {
  //   dynamic data = {"email": email};
  //   Response<dynamic>? response = await _connectionHelper.postData(
  //     API.postSendOTP,
  //     data,
  //   );
  //   if (response != null && response.statusCode == 201) {
  //     try {
  //       return true;
  //     } catch (e, s) {
  //       await FirebaseCrashlytics.instance
  //           .recordError(e, null, reason: s, fatal: true);
  //     }
  //   }
  //   return false;
  // }

}
