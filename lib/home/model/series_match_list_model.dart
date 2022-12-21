// To parse this JSON data, do
//
//     final seriesMatchListModel = seriesMatchListModelFromJson(jsonString);

import 'dart:convert';

SeriesMatchListModel seriesMatchListModelFromJson(String str) =>
    SeriesMatchListModel.fromJson(json.decode(str));

String seriesMatchListModelToJson(SeriesMatchListModel data) =>
    json.encode(data.toJson());

class SeriesMatchListModel {
  SeriesMatchListModel({
    this.matchDetails,
    this.landingPosition,
    this.appIndex,
  });

  List<MatchDetail>? matchDetails;
  int? landingPosition;
  AppIndex? appIndex;

  factory SeriesMatchListModel.fromJson(Map<String, dynamic> json) =>
      SeriesMatchListModel(
        matchDetails: List<MatchDetail>.from(
            json["matchDetails"].map((x) => MatchDetail.fromJson(x))),
        landingPosition: json["landingPosition"],
        appIndex: AppIndex.fromJson(json["appIndex"]),
      );

  Map<String, dynamic> toJson() => {
        "matchDetails":
            List<dynamic>.from(matchDetails!.map((x) => x.toJson())),
        "landingPosition": landingPosition,
        "appIndex": appIndex!.toJson(),
      };
}

class AppIndex {
  AppIndex({
    this.seoTitle,
    this.webUrl,
  });

  String? seoTitle;
  String? webUrl;

  factory AppIndex.fromJson(Map<String, dynamic> json) => AppIndex(
        seoTitle: json["seoTitle"],
        webUrl: json["webURL"],
      );

  Map<String, dynamic> toJson() => {
        "seoTitle": seoTitle,
        "webURL": webUrl,
      };
}

class MatchDetail {
  MatchDetail({
    this.matchDetailsMap,
    this.adDetail,
  });

  MatchDetailsMap? matchDetailsMap;
  AdDetail? adDetail;

  factory MatchDetail.fromJson(Map<String, dynamic> json) => MatchDetail(
        matchDetailsMap: json["matchDetailsMap"] == null
            ? null
            : MatchDetailsMap.fromJson(json["matchDetailsMap"]),
        adDetail: json["adDetail"] == null
            ? null
            : AdDetail.fromJson(json["adDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "matchDetailsMap":
            matchDetailsMap == null ? null : matchDetailsMap!.toJson(),
        "adDetail": adDetail == null ? null : adDetail!.toJson(),
      };
}

class AdDetail {
  AdDetail({
    this.name,
    this.layout,
    this.position,
  });

  String? name;
  String? layout;
  int? position;

  factory AdDetail.fromJson(Map<String, dynamic> json) => AdDetail(
        name: json["name"],
        layout: json["layout"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "layout": layout,
        "position": position,
      };
}

class MatchDetailsMap {
  MatchDetailsMap({
    this.key,
    this.match,
    this.seriesId,
  });

  String? key;
  List<Match>? match;
  int? seriesId;

  factory MatchDetailsMap.fromJson(Map<String, dynamic> json) =>
      MatchDetailsMap(
        key: json["key"],
        match: List<Match>.from(json["match"].map((x) => Match.fromJson(x))),
        seriesId: json["seriesId"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "match": List<dynamic>.from(match!.map((x) => x.toJson())),
        "seriesId": seriesId,
      };
}

class Match {
  Match({
    this.matchInfo,
    this.matchScore,
  });

  MatchInfo? matchInfo;
  MatchScore? matchScore;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchInfo: MatchInfo.fromJson(json["matchInfo"]),
        matchScore: MatchScore.fromJson(json["matchScore"]),
      );

  Map<String, dynamic> toJson() => {
        "matchInfo": matchInfo!.toJson(),
        "matchScore": matchScore!.toJson(),
      };
}

class MatchInfo {
  MatchInfo({
    this.matchId,
    this.seriesId,
    this.seriesName,
    this.matchDesc,
    this.matchFormat,
    this.startDate,
    this.endDate,
    this.state,
    this.status,
    this.team1,
    this.team2,
    this.venueInfo,
    this.currBatTeamId,
    this.seriesStartDt,
    this.seriesEndDt,
    this.isTimeAnnounced,
  });

  int? matchId;
  int? seriesId;
  String? seriesName;
  String? matchDesc;
  String? matchFormat;
  String? startDate;
  String? endDate;
  String? state;
  String? status;
  Team? team1;
  Team? team2;
  VenueInfo? venueInfo;
  int? currBatTeamId;
  String? seriesStartDt;
  String? seriesEndDt;
  bool? isTimeAnnounced;

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
        matchDesc: json["matchDesc"],
        matchFormat: json["matchFormat"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        state: json["state"],
        status: json["status"],
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        venueInfo: VenueInfo.fromJson(json["venueInfo"]),
        currBatTeamId: json["currBatTeamId"],
        seriesStartDt: json["seriesStartDt"],
        seriesEndDt: json["seriesEndDt"],
        isTimeAnnounced: json["isTimeAnnounced"],
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "seriesId": seriesId,
        "seriesName": seriesName,
        "matchDesc": matchDesc,
        "matchFormat": matchFormat,
        "startDate": startDate,
        "endDate": endDate,
        "state": state,
        "status": status,
        "team1": team1!.toJson(),
        "team2": team2!.toJson(),
        "venueInfo": venueInfo!.toJson(),
        "currBatTeamId": currBatTeamId,
        "seriesStartDt": seriesStartDt,
        "seriesEndDt": seriesEndDt,
        "isTimeAnnounced": isTimeAnnounced,
      };
}

class Team {
  Team({
    this.teamId,
    this.teamName,
    this.teamSName,
    this.imageId,
  });

  int? teamId;
  String? teamName;
  String? teamSName;
  int? imageId;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["teamId"],
        teamName: json["teamName"],
        teamSName: json["teamSName"],
        imageId: json["imageId"],
      );
  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamSName": teamSName,
        "imageId": imageId,
      };
}

class VenueInfo {
  VenueInfo({
    this.id,
    this.ground,
    this.city,
    this.timezone,
  });

  int? id;
  String? ground;
  String? city;
  String? timezone;

  factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
        id: json["id"],
        ground: json["ground"],
        city: json["city"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ground": ground,
        "city": city,
        "timezone": timezone,
      };
}

class MatchScore {
  MatchScore({
    this.team1Score,
    this.team2Score,
  });

  TeamScore? team1Score;
  TeamScore? team2Score;

  factory MatchScore.fromJson(Map<String, dynamic> json) => MatchScore(
        team1Score: TeamScore.fromJson(json["team1Score"]),
        team2Score: TeamScore.fromJson(json["team2Score"]),
      );

  Map<String, dynamic> toJson() => {
        "team1Score": team1Score!.toJson(),
        "team2Score": team2Score!.toJson(),
      };
}

class TeamScore {
  TeamScore({
    this.inngs1,
  });

  Inngs1? inngs1;

  factory TeamScore.fromJson(Map<String, dynamic> json) => TeamScore(
        inngs1: Inngs1.fromJson(json["inngs1"]),
      );

  Map<String, dynamic> toJson() => {
        "inngs1": inngs1!.toJson(),
      };
}

class Inngs1 {
  Inngs1({
    this.inningsId,
    this.runs,
    this.wickets,
    this.overs,
  });

  int? inningsId;
  int? runs;
  int? wickets;
  double? overs;

  factory Inngs1.fromJson(Map<String, dynamic> json) => Inngs1(
        inningsId: json["inningsId"],
        runs: json["runs"],
        wickets: json["wickets"],
        overs: json["overs"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "runs": runs,
        "wickets": wickets,
        "overs": overs,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
