// import 'dart:convert';
// import 'dart:io';
//
// import 'package:cricland/home/constants.dart';
// import 'package:cricland/home/controller/connection_helper.dart';
// import 'package:cricland/home/model/data_model.dart';
// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
//
// class DataFetcher {
//   final ConnectionHelper _connectionHelper = ConnectionHelper();
//
//   Future<List<MatchesModel>> fetchMatches() async {
//     List<MatchesModel> matches = [];
//     List<SeriesMatchesModel> seriesMatchesList = [];
//
//     MatchesModel matchesModel;
//
//
//     Response<dynamic>? response = await _connectionHelper.getDataWithHeaders(
//       API.getMatches,
//
//     );
//     if (response != null) {
//       print('Status Code: ${response.statusCode}');
//       if (response.statusCode == 200) {
//         var data = response.data["typeMatches"];
//         var appIndexData = response.data["appIndex"];
//         var filtersData = response.data["filters"];
//         var responseLastUpdatedData = response.data["responseLastUpdated"];
//         for (var match in data) {
//           seriesMatchesList.add(SeriesMatchesModel(
//               seriesAdWrapperModel: SeriesAdWrapperModel(
//             seriesId: match["seriesMatches"][0]["seriesAdWrapper"]["seriesId"],
//             seriesName: match["seriesMatches"][0]["seriesAdWrapper"]
//                 ["seriesName"],
//             matchModel: [
//               MatchModel(
//                 matchScoreModel: MatchScoreModel(
//                   teamOneScoreModel: TeamScoreModel(
//                     inningsModel: InningsModel(
//                       inningsId: match
//                       ["seriesMatches"][0]
//                       ["seriesAdWrapper"]["matches"][0]
//                       ["matchScore"]["team1Score"]
//                       ["inngs1"]["inningsId"],
//                       runs: match["seriesMatches"][0]
//                       ["seriesAdWrapper"]["matches"][0]
//                       ["matchScore"]["team1Score"]
//                       ["inngs1"]["runs"],
//                       wickets: match
//                       ["seriesMatches"][0]
//                       ["seriesAdWrapper"]["matches"][0]
//                       ["matchScore"]["team1Score"]
//                       ["inngs1"]["wickets"],
//                       overs: match["seriesMatches"][0]
//                       ["seriesAdWrapper"]["matches"][0]
//                       ["matchScore"]["team1Score"]
//                       ["inngs1"]["overs"],
//                     ),
//                   ),
//                   teamTwoScoreModel: TeamScoreModel(
//                     inningsModel: InningsModel(
//                       inningsId: match
//                       ["seriesMatches"][0]
//                       ["seriesAdWrapper"]["matches"][0]
//                       ["matchScore"]["team1Score"]
//                       ["inngs1"]["inningsId"],
//                       runs: match["seriesMatches"][0]
//                       ["seriesAdWrapper"]["matches"][0]
//                       ["matchScore"]["team1Score"]
//                       ["inngs1"]["runs"],
//                       wickets: match
//                       ["seriesMatches"][0]
//                       ["seriesAdWrapper"]["matches"][0]
//                       ["matchScore"]["team1Score"]
//                       ["inngs1"]["wickets"],
//                       overs: match["seriesMatches"][0]
//                       ["seriesAdWrapper"]["matches"][0]
//                       ["matchScore"]["team1Score"]
//                       ["inngs1"]["overs"],
//                     ),
//                   ),
//                 ),
//                 matchInfoModel: MatchInfoModel(
//                     status: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["status"],
//                     seriesName: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["seriesName"],
//                     currBatTeamId: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["currBatTeamId"],
//                     teamOneModel: TeamModel(
//                         imageId:  match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["team1"]["imageId"],
//                         teamId: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["team1"]["teamId"],
//                         teamSName: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["team1"]["teamSName"],
//                         teamName: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["team1"]["teamName"]),
//                     endDate: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["endDate"],
//                     seriesId: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["seriesId"],
//                     isTimeAnnounced: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["isTimeAnnounced"],
//                     matchId: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["matchId"],
//                     stateTitle: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["stateTitle"],
//                     startDate: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["startDate"],
//                     teamTwoModel: TeamModel(
//                         imageId:  match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["team2"]["imageId"],
//                         teamId: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["team2"]["teamId"],
//                         teamSName: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["team2"]["teamSName"],
//                         teamName: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["team2"]["teamName"]),
//                     venueInfoModel: VenueInfoModel(
//                         timezone: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["venueInfo"]["timezone"],
//                         ground: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["venueInfo"]["ground"],
//                         id: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["venueInfo"]["id"],
//                         city: match["seriesMatches"][0]
//                         ["seriesAdWrapper"]["matches"][0]["matchInfo"]["venueInfo"]["city"]),
//                     seriesEndDt: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["seriesEndDt"],
//                     seriesStartDt: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["seriesStartDt"],
//                     state: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["state"],
//                     matchFormat: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["matchFormat"],
//                     matchDesc: match["seriesMatches"][0]
//                     ["seriesAdWrapper"]["matches"][0]
//                     ["matchInfo"]["matchDesc"]),
//               ),
//             ],
//           )));
//           matchesModel = MatchesModel(
//             // typeMatchesModel: [],
//             typeMatchesModel: TypeMatchesModel(
//                 matchType: match["matchType"],
//                 seriesMatchesModel: seriesMatchesList),
//             filtersModel: FiltersModel(matchType: filtersData["matchType"]),
//             appIndexModel: AppIndexModel(
//               seoTitle: appIndexData["seoTitle"],
//               webURL: appIndexData["webURL"],
//             ),
//             //  appIndexModel: AppIndexModel(seoTitle: '', webURL: ''),
//             responseLastUpdated: responseLastUpdatedData,
//           );
//
//           matches.add(matchesModel);
//         }
//
//         // appIndexData
//         print(matches[0].appIndexModel.seoTitle);
//
//       }
//     }
//     return matches;
//   }
//
// // Future<bool> resendOTP({required String email}) async {
//   //   dynamic data = {"email": email};
//   //   Response<dynamic>? response = await _connectionHelper.postData(
//   //     API.postSendOTP,
//   //     data,
//   //   );
//   //   if (response != null && response.statusCode == 201) {
//   //     try {
//   //       return true;
//   //     } catch (e, s) {
//   //       await FirebaseCrashlytics.instance
//   //           .recordError(e, null, reason: s, fatal: true);
//   //     }
//   //   }
//   //   return false;
//   // }
//
// }
