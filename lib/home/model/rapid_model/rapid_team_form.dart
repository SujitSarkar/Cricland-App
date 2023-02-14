// // To parse this JSON data, do
// //
// //     final rapidTeamFormModel = rapidTeamFormModelFromJson(jsonString);
//
// import 'dart:convert';
//
// RapidTeamFormModel rapidTeamFormModelFromJson(String str) => RapidTeamFormModel.fromJson(json.decode(str));
//
// String rapidTeamFormModelToJson(RapidTeamFormModel data) => json.encode(data.toJson());
//
// class RapidTeamFormModel {
//   RapidTeamFormModel({
//     this.teamMatchesData,
//     this.appIndex,
//   });
//
//   List<TeamMatchesDatum>? teamMatchesData;
//   AppIndex? appIndex;
//
//   factory RapidTeamFormModel.fromJson(Map<String, dynamic> json) => RapidTeamFormModel(
//     teamMatchesData: List<TeamMatchesDatum>.from(json["teamMatchesData"].map((x) => TeamMatchesDatum.fromJson(x))),
//     appIndex: AppIndex.fromJson(json["appIndex"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "teamMatchesData": List<dynamic>.from(teamMatchesData.map((x) => x.toJson())),
//     "appIndex": appIndex.toJson(),
//   };
// }
//
// class AppIndex {
//   AppIndex({
//     this.seoTitle,
//     this.webUrl,
//   });
//
//   String seoTitle;
//   String webUrl;
//
//   factory AppIndex.fromJson(Map<String, dynamic> json) => AppIndex(
//     seoTitle: json["seoTitle"],
//     webUrl: json["webURL"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "seoTitle": seoTitle,
//     "webURL": webUrl,
//   };
// }
//
// class TeamMatchesDatum {
//   TeamMatchesDatum({
//     this.matchDetailsMap,
//     this.adDetail,
//   });
//
//   MatchDetailsMap matchDetailsMap;
//   AdDetail adDetail;
//
//   factory TeamMatchesDatum.fromJson(Map<String, dynamic> json) => TeamMatchesDatum(
//     matchDetailsMap: MatchDetailsMap.fromJson(json["matchDetailsMap"]),
//     adDetail: AdDetail.fromJson(json["adDetail"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "matchDetailsMap": matchDetailsMap.toJson(),
//     "adDetail": adDetail.toJson(),
//   };
// }
//
// class AdDetail {
//   AdDetail({
//     this.name,
//     this.layout,
//     this.position,
//   });
//
//   String name;
//   String layout;
//   int position;
//
//   factory AdDetail.fromJson(Map<String, dynamic> json) => AdDetail(
//     name: json["name"],
//     layout: json["layout"],
//     position: json["position"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "layout": layout,
//     "position": position,
//   };
// }
//
// class MatchDetailsMap {
//   MatchDetailsMap({
//     this.key,
//     this.match,
//     this.seriesId,
//   });
//
//   Key key;
//   List<Match> match;
//   int seriesId;
//
//   factory MatchDetailsMap.fromJson(Map<String, dynamic> json) => MatchDetailsMap(
//     key: keyValues.map[json["key"]],
//     match: List<Match>.from(json["match"].map((x) => Match.fromJson(x))),
//     seriesId: json["seriesId"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "key": keyValues.reverse[key],
//     "match": List<dynamic>.from(match.map((x) => x.toJson())),
//     "seriesId": seriesId,
//   };
// }
//
// enum Key { NEW_ZEALAND_TOUR_OF_INDIA_2023, SRI_LANKA_TOUR_OF_INDIA_2023 }
//
// final keyValues = EnumValues({
//   "New Zealand tour of India, 2023": Key.NEW_ZEALAND_TOUR_OF_INDIA_2023,
//   "Sri Lanka tour of India, 2023": Key.SRI_LANKA_TOUR_OF_INDIA_2023
// });
//
// class Match {
//   Match({
//     this.matchInfo,
//     this.matchScore,
//   });
//
//   MatchInfo matchInfo;
//   MatchScore matchScore;
//
//   factory Match.fromJson(Map<String, dynamic> json) => Match(
//     matchInfo: MatchInfo.fromJson(json["matchInfo"]),
//     matchScore: MatchScore.fromJson(json["matchScore"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "matchInfo": matchInfo.toJson(),
//     "matchScore": matchScore.toJson(),
//   };
// }
//
// class MatchInfo {
//   MatchInfo({
//     this.matchId,
//     this.seriesId,
//     this.seriesName,
//     this.matchDesc,
//     this.matchFormat,
//     this.startDate,
//     this.endDate,
//     this.state,
//     this.status,
//     this.team1,
//     this.team2,
//     this.venueInfo,
//     this.currBatTeamId,
//     this.seriesStartDt,
//     this.seriesEndDt,
//     this.isTimeAnnounced,
//   });
//
//   int matchId;
//   int seriesId;
//   Key seriesName;
//   String matchDesc;
//   MatchFormat matchFormat;
//   String startDate;
//   String endDate;
//   State state;
//   String status;
//   Team team1;
//   Team team2;
//   VenueInfo venueInfo;
//   int currBatTeamId;
//   String seriesStartDt;
//   String seriesEndDt;
//   bool isTimeAnnounced;
//
//   factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
//     matchId: json["matchId"],
//     seriesId: json["seriesId"],
//     seriesName: keyValues.map[json["seriesName"]],
//     matchDesc: json["matchDesc"],
//     matchFormat: matchFormatValues.map[json["matchFormat"]],
//     startDate: json["startDate"],
//     endDate: json["endDate"],
//     state: stateValues.map[json["state"]],
//     status: json["status"],
//     team1: Team.fromJson(json["team1"]),
//     team2: Team.fromJson(json["team2"]),
//     venueInfo: VenueInfo.fromJson(json["venueInfo"]),
//     currBatTeamId: json["currBatTeamId"],
//     seriesStartDt: json["seriesStartDt"],
//     seriesEndDt: json["seriesEndDt"],
//     isTimeAnnounced: json["isTimeAnnounced"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "matchId": matchId,
//     "seriesId": seriesId,
//     "seriesName": keyValues.reverse[seriesName],
//     "matchDesc": matchDesc,
//     "matchFormat": matchFormatValues.reverse[matchFormat],
//     "startDate": startDate,
//     "endDate": endDate,
//     "state": stateValues.reverse[state],
//     "status": status,
//     "team1": team1.toJson(),
//     "team2": team2.toJson(),
//     "venueInfo": venueInfo.toJson(),
//     "currBatTeamId": currBatTeamId,
//     "seriesStartDt": seriesStartDt,
//     "seriesEndDt": seriesEndDt,
//     "isTimeAnnounced": isTimeAnnounced,
//   };
// }
//
// enum MatchFormat { T20, ODI }
//
// final matchFormatValues = EnumValues({
//   "ODI": MatchFormat.ODI,
//   "T20": MatchFormat.T20
// });
//
// enum State { COMPLETE }
//
// final stateValues = EnumValues({
//   "Complete": State.COMPLETE
// });
//
// class Team {
//   Team({
//     this.teamId,
//     this.teamName,
//     this.teamSName,
//     this.imageId,
//   });
//
//   int teamId;
//   TeamName teamName;
//   TeamSName teamSName;
//   int imageId;
//
//   factory Team.fromJson(Map<String, dynamic> json) => Team(
//     teamId: json["teamId"],
//     teamName: teamNameValues.map[json["teamName"]],
//     teamSName: teamSNameValues.map[json["teamSName"]],
//     imageId: json["imageId"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "teamId": teamId,
//     "teamName": teamNameValues.reverse[teamName],
//     "teamSName": teamSNameValues.reverse[teamSName],
//     "imageId": imageId,
//   };
// }
//
// enum TeamName { INDIA, NEW_ZEALAND, SRI_LANKA }
//
// final teamNameValues = EnumValues({
//   "India": TeamName.INDIA,
//   "New Zealand": TeamName.NEW_ZEALAND,
//   "Sri Lanka": TeamName.SRI_LANKA
// });
//
// enum TeamSName { IND, NZ, SL }
//
// final teamSNameValues = EnumValues({
//   "IND": TeamSName.IND,
//   "NZ": TeamSName.NZ,
//   "SL": TeamSName.SL
// });
//
// class VenueInfo {
//   VenueInfo({
//     this.id,
//     this.ground,
//     this.city,
//     this.timezone,
//   });
//
//   int id;
//   String ground;
//   String city;
//   Timezone timezone;
//
//   factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
//     id: json["id"],
//     ground: json["ground"],
//     city: json["city"],
//     timezone: timezoneValues.map[json["timezone"]],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "ground": ground,
//     "city": city,
//     "timezone": timezoneValues.reverse[timezone],
//   };
// }
//
// enum Timezone { THE_0530 }
//
// final timezoneValues = EnumValues({
//   "+05:30": Timezone.THE_0530
// });
//
// class MatchScore {
//   MatchScore({
//     this.team1Score,
//     this.team2Score,
//   });
//
//   TeamScore team1Score;
//   TeamScore team2Score;
//
//   factory MatchScore.fromJson(Map<String, dynamic> json) => MatchScore(
//     team1Score: TeamScore.fromJson(json["team1Score"]),
//     team2Score: TeamScore.fromJson(json["team2Score"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "team1Score": team1Score.toJson(),
//     "team2Score": team2Score.toJson(),
//   };
// }
//
// class TeamScore {
//   TeamScore({
//     this.inngs1,
//   });
//
//   Inngs1 inngs1;
//
//   factory TeamScore.fromJson(Map<String, dynamic> json) => TeamScore(
//     inngs1: Inngs1.fromJson(json["inngs1"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "inngs1": inngs1.toJson(),
//   };
// }
//
// class Inngs1 {
//   Inngs1({
//     this.inningsId,
//     this.runs,
//     this.wickets,
//     this.overs,
//   });
//
//   int inningsId;
//   int runs;
//   int wickets;
//   double overs;
//
//   factory Inngs1.fromJson(Map<String, dynamic> json) => Inngs1(
//     inningsId: json["inningsId"],
//     runs: json["runs"],
//     wickets: json["wickets"],
//     overs: json["overs"].toDouble(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "inningsId": inningsId,
//     "runs": runs,
//     "wickets": wickets,
//     "overs": overs,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
