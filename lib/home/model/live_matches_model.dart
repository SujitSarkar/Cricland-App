// To parse this JSON data, do
//
//     final liveMatcheModel = liveMatcheModelFromJson(jsonString);

import 'dart:convert';

LiveMatchesModel liveMatchesModelFromJson(String str) =>
    LiveMatchesModel.fromJson(json.decode(str));

String liveMatchesModelToJson(LiveMatchesModel data) =>
    json.encode(data.toJson());

class LiveMatchesModel {
  LiveMatchesModel({
    this.typeMatches,
    this.filters,
    this.appIndex,
    this.responseLastUpdated,
  });

  List<TypeMatch>? typeMatches;
  Filters? filters;
  AppIndex? appIndex;
  String? responseLastUpdated;

  factory LiveMatchesModel.fromJson(Map<String, dynamic> json) =>
      LiveMatchesModel(
        typeMatches: List<TypeMatch>.from(
            json["typeMatches"].map((x) => TypeMatch.fromJson(x))),
        filters: Filters.fromJson(json["filters"]),
        appIndex: AppIndex.fromJson(json["appIndex"]),
        responseLastUpdated: json["responseLastUpdated"],
      );

  Map<String, dynamic> toJson() => {
        "typeMatches": List<dynamic>.from(typeMatches!.map((x) => x.toJson())),
        "filters": filters!.toJson(),
        "appIndex": appIndex!.toJson(),
        "responseLastUpdated": responseLastUpdated,
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

class Filters {
  Filters({
    this.matchType,
  });

  List<String>? matchType;

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        matchType: List<String>.from(json["matchType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "matchType": List<dynamic>.from(matchType!.map((x) => x)),
      };
}

class TypeMatch {
  TypeMatch({
    this.matchType,
    this.seriesMatches,
  });

  String? matchType;
  List<SeriesMatch>? seriesMatches;

  factory TypeMatch.fromJson(Map<String, dynamic> json) => TypeMatch(
        matchType: json["matchType"],
        seriesMatches: List<SeriesMatch>.from(
            json["seriesMatches"].map((x) => SeriesMatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "matchType": matchType,
        "seriesMatches":
            List<dynamic>.from(seriesMatches!.map((x) => x.toJson())),
      };
}

class SeriesMatch {
  SeriesMatch({
    this.seriesAdWrapper,
    this.adDetail,
  });

  SeriesAdWrapper? seriesAdWrapper;
  AdDetail? adDetail;

  factory SeriesMatch.fromJson(Map<String, dynamic> json) => SeriesMatch(
        seriesAdWrapper: json["seriesAdWrapper"] == null
            ? null
            : SeriesAdWrapper.fromJson(json["seriesAdWrapper"]),
        adDetail: json["adDetail"] == null
            ? null
            : AdDetail.fromJson(json["adDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "seriesAdWrapper":
            seriesAdWrapper == null ? null : seriesAdWrapper!.toJson(),
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

class SeriesAdWrapper {
  SeriesAdWrapper({
    this.seriesId,
    this.seriesName,
    this.matches,
  });

  int? seriesId;
  String? seriesName;
  List<Match>? matches;

  factory SeriesAdWrapper.fromJson(Map<String, dynamic> json) =>
      SeriesAdWrapper(
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
        matches:
            List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seriesId": seriesId,
        "seriesName": seriesName,
        "matches": List<dynamic>.from(matches!.map((x) => x.toJson())),
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
        matchScore: json["matchScore"] == null
            ? null
            : MatchScore.fromJson(json["matchScore"]),
      );

  Map<String, dynamic> toJson() => {
        "matchInfo": matchInfo!.toJson(),
        "matchScore": matchScore == null ? null : matchScore!.toJson(),
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
    this.stateTitle,
  });

  int? matchId;
  int? seriesId;
  String? seriesName;
  String? matchDesc;
  MatchFormat? matchFormat;
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
  String? stateTitle;

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
        matchDesc: json["matchDesc"],
        matchFormat: matchFormatValues.map[json["matchFormat"]],
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
        stateTitle: json["stateTitle"],
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "seriesId": seriesId,
        "seriesName": seriesName,
        "matchDesc": matchDesc,
        "matchFormat": matchFormatValues.reverse[matchFormat],
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
        "stateTitle": stateTitle,
      };
}

enum MatchFormat { TEST, ODI, T20 }

final matchFormatValues = EnumValues(
    {"ODI": MatchFormat.ODI, "T20": MatchFormat.T20, "TEST": MatchFormat.TEST});

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

  Team1Score? team1Score;
  Team2Score? team2Score;

  factory MatchScore.fromJson(Map<String, dynamic> json) => MatchScore(
        team1Score: Team1Score.fromJson(json["team1Score"]),
        team2Score: json["team2Score"] == null
            ? null
            : Team2Score.fromJson(json["team2Score"]),
      );

  Map<String, dynamic> toJson() => {
        "team1Score": team1Score!.toJson(),
        "team2Score": team2Score == null ? null : team2Score!.toJson(),
      };
}

class Team1Score {
  Team1Score({
    this.inngs1,
    this.inngs2,
  });

  Inngs? inngs1;
  Inngs? inngs2;

  factory Team1Score.fromJson(Map<String, dynamic> json) => Team1Score(
        inngs1: Inngs.fromJson(json["inngs1"]),
        inngs2: json["inngs2"] == null ? null : Inngs.fromJson(json["inngs2"]),
      );

  Map<String, dynamic> toJson() => {
        "inngs1": inngs1!.toJson(),
        "inngs2": inngs2 == null ? null : inngs2!.toJson(),
      };
}

class Inngs {
  Inngs({
    this.inningsId,
    this.runs,
    this.wickets,
    this.overs,
    this.isDeclared,
  });

  int? inningsId;
  int? runs;
  int? wickets;
  double? overs;
  bool? isDeclared;

  factory Inngs.fromJson(Map<String, dynamic> json) => Inngs(
        inningsId: json["inningsId"],
        runs: json["runs"],
        wickets: json["wickets"],
        overs: json["overs"].toDouble(),
        isDeclared: json["isDeclared"],
      );

  Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "runs": runs,
        "wickets": wickets,
        "overs": overs,
        "isDeclared": isDeclared,
      };
}

class Team2Score {
  Team2Score({
    this.inngs1,
  });

  Inngs? inngs1;

  factory Team2Score.fromJson(Map<String, dynamic> json) => Team2Score(
        inngs1: json["inngs1"] == null ? null : Inngs.fromJson(json["inngs1"]),
      );

  Map<String, dynamic> toJson() => {
        "inngs1": inngs1 == null ? null : inngs1!.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
