// To parse this JSON data, do
//
//     final matcheInfoModel = matcheInfoModelFromJson(jsonString);

import 'dart:convert';

MatcheInfoModel matcheInfoModelFromJson(String str) =>
    MatcheInfoModel.fromJson(json.decode(str));

String matcheInfoModelToJson(MatcheInfoModel data) =>
    json.encode(data.toJson());

class MatcheInfoModel {
  MatcheInfoModel({
    this.matchInfo,
    this.venueInfo,
  });

  MatchInfo? matchInfo;
  VenueInfo? venueInfo;

  factory MatcheInfoModel.fromJson(Map<String, dynamic> json) =>
      MatcheInfoModel(
        matchInfo: MatchInfo.fromJson(json["matchInfo"]),
        venueInfo: VenueInfo.fromJson(json["venueInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "matchInfo": matchInfo!.toJson(),
        "venueInfo": venueInfo!.toJson(),
      };
}

class MatchInfo {
  MatchInfo({
    this.matchId,
    this.matchDescription,
    this.matchFormat,
    this.matchType,
    this.complete,
    this.domestic,
    this.matchStartTimestamp,
    this.matchCompleteTimestamp,
    this.dayNight,
    this.year,
    this.state,
    this.team1,
    this.team2,
    this.series,
    this.umpire1,
    this.umpire2,
    this.umpire3,
    this.referee,
    this.tossResults,
    this.result,
    this.venue,
    this.status,
    this.playersOfTheMatch,
    this.playersOfTheSeries,
    this.revisedTarget,
    this.matchTeamInfo,
    this.isMatchNotCovered,
    this.hysEnabled,
  });

  int? matchId;
  String? matchDescription;
  String? matchFormat;
  String? matchType;
  bool? complete;
  bool? domestic;
  int? matchStartTimestamp;
  int? matchCompleteTimestamp;
  bool? dayNight;
  int? year;
  String? state;
  Team? team1;
  Team? team2;
  Series? series;
  Referee? umpire1;
  Referee? umpire2;
  Referee? umpire3;
  Referee? referee;
  TossResults? tossResults;
  Result? result;
  Venue? venue;
  String? status;
  List<Player>? playersOfTheMatch;
  List<Player>? playersOfTheSeries;
  RevisedTarget? revisedTarget;
  List<MatchTeamInfo>? matchTeamInfo;
  bool? isMatchNotCovered;
  int? hysEnabled;

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        matchDescription: json["matchDescription"],
        matchFormat: json["matchFormat"],
        matchType: json["matchType"],
        complete: json["complete"],
        domestic: json["domestic"],
        matchStartTimestamp: json["matchStartTimestamp"],
        matchCompleteTimestamp: json["matchCompleteTimestamp"],
        dayNight: json["dayNight"],
        year: json["year"],
        state: json["state"],
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        series: Series.fromJson(json["series"]),
        umpire1: Referee.fromJson(json["umpire1"]),
        umpire2: Referee.fromJson(json["umpire2"]),
        umpire3: Referee.fromJson(json["umpire3"]),
        referee: Referee.fromJson(json["referee"]),
        tossResults: TossResults.fromJson(json["tossResults"]),
        result: Result.fromJson(json["result"]),
        venue: Venue.fromJson(json["venue"]),
        status: json["status"],
        playersOfTheMatch: List<Player>.from(
            json["playersOfTheMatch"].map((x) => Player.fromJson(x))),
        playersOfTheSeries: List<Player>.from(
            json["playersOfTheSeries"].map((x) => Player.fromJson(x))),
        revisedTarget: RevisedTarget.fromJson(json["revisedTarget"]),
        matchTeamInfo: List<MatchTeamInfo>.from(
            json["matchTeamInfo"].map((x) => MatchTeamInfo.fromJson(x))),
        isMatchNotCovered: json["isMatchNotCovered"],
        hysEnabled: json["HYSEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "matchDescription": matchDescription,
        "matchFormat": matchFormat,
        "matchType": matchType,
        "complete": complete,
        "domestic": domestic,
        "matchStartTimestamp": matchStartTimestamp,
        "matchCompleteTimestamp": matchCompleteTimestamp,
        "dayNight": dayNight,
        "year": year,
        "state": state,
        "team1": team1!.toJson(),
        "team2": team2!.toJson(),
        "series": series!.toJson(),
        "umpire1": umpire1!.toJson(),
        "umpire2": umpire2!.toJson(),
        "umpire3": umpire3!.toJson(),
        "referee": referee!.toJson(),
        "tossResults": tossResults!.toJson(),
        "result": result!.toJson(),
        "venue": venue!.toJson(),
        "status": status,
        "playersOfTheMatch":
            List<dynamic>.from(playersOfTheMatch!.map((x) => x.toJson())),
        "playersOfTheSeries":
            List<dynamic>.from(playersOfTheSeries!.map((x) => x.toJson())),
        "revisedTarget": revisedTarget!.toJson(),
        "matchTeamInfo":
            List<dynamic>.from(matchTeamInfo!.map((x) => x.toJson())),
        "isMatchNotCovered": isMatchNotCovered,
        "HYSEnabled": hysEnabled,
      };
}

class MatchTeamInfo {
  MatchTeamInfo({
    this.battingTeamId,
    this.battingTeamShortName,
    this.bowlingTeamId,
    this.bowlingTeamShortName,
  });

  int? battingTeamId;
  String? battingTeamShortName;
  int? bowlingTeamId;
  String? bowlingTeamShortName;

  factory MatchTeamInfo.fromJson(Map<String, dynamic> json) => MatchTeamInfo(
        battingTeamId: json["battingTeamId"],
        battingTeamShortName: json["battingTeamShortName"],
        bowlingTeamId: json["bowlingTeamId"],
        bowlingTeamShortName: json["bowlingTeamShortName"],
      );

  Map<String, dynamic> toJson() => {
        "battingTeamId": battingTeamId,
        "battingTeamShortName": battingTeamShortName,
        "bowlingTeamId": bowlingTeamId,
        "bowlingTeamShortName": bowlingTeamShortName,
      };
}

class Player {
  Player({
    this.id,
    this.name,
    this.fullName,
    this.nickName,
    this.captain,
    this.keeper,
    this.substitute,
    this.teamName,
    this.faceImageId,
    this.bowlingStyle,
    this.role,
    this.teamId,
    this.battingStyle,
  });

  int? id;
  String? name;
  String? fullName;
  String? nickName;
  bool? captain;
  bool? keeper;
  bool? substitute;
  String? teamName;
  int? faceImageId;
  String? bowlingStyle;
  Role? role;
  int? teamId;
  BattingStyle? battingStyle;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        name: json["name"],
        fullName: json["fullName"],
        nickName: json["nickName"],
        captain: json["captain"],
        keeper: json["keeper"],
        substitute: json["substitute"],
        teamName: json["teamName"],
        faceImageId: json["faceImageId"],
        bowlingStyle: json["bowlingStyle"],
        role: json["role"] == null ? null : roleValues.map[json["role"]],
        teamId: json["teamId"],
        battingStyle: json["battingStyle"] == null
            ? null
            : battingStyleValues.map[json["battingStyle"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullName": fullName,
        "nickName": nickName,
        "captain": captain,
        "keeper": keeper,
        "substitute": substitute,
        "teamName": teamName,
        "faceImageId": faceImageId,
        "bowlingStyle": bowlingStyle,
        "role": role == null ? null : roleValues.reverse[role],
        "teamId": teamId,
        "battingStyle": battingStyle == null
            ? null
            : battingStyleValues.reverse[battingStyle],
      };
}

enum BattingStyle { LEFT, RIGHT }

final battingStyleValues =
    EnumValues({"LEFT": BattingStyle.LEFT, "RIGHT": BattingStyle.RIGHT});

enum Role {
  BATTING_ALLROUNDER,
  BATSMAN,
  WK_BATSMAN,
  BOWLING_ALLROUNDER,
  BOWLER
}

final roleValues = EnumValues({
  "Batsman": Role.BATSMAN,
  "Batting Allrounder": Role.BATTING_ALLROUNDER,
  "Bowler": Role.BOWLER,
  "Bowling Allrounder": Role.BOWLING_ALLROUNDER,
  "WK-Batsman": Role.WK_BATSMAN
});

class Referee {
  Referee({
    this.id,
    this.name,
    this.country,
  });

  int? id;
  String? name;
  String? country;

  factory Referee.fromJson(Map<String, dynamic> json) => Referee(
        id: json["id"],
        name: json["name"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
      };
}

class Result {
  Result({
    this.resultType,
    this.winningTeam,
    this.winningteamId,
    this.winningMargin,
    this.winByRuns,
    this.winByInnings,
  });

  String? resultType;
  String? winningTeam;
  int? winningteamId;
  int? winningMargin;
  bool? winByRuns;
  bool? winByInnings;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        resultType: json["resultType"],
        winningTeam: json["winningTeam"],
        winningteamId: json["winningteamId"],
        winningMargin: json["winningMargin"],
        winByRuns: json["winByRuns"],
        winByInnings: json["winByInnings"],
      );

  Map<String, dynamic> toJson() => {
        "resultType": resultType,
        "winningTeam": winningTeam,
        "winningteamId": winningteamId,
        "winningMargin": winningMargin,
        "winByRuns": winByRuns,
        "winByInnings": winByInnings,
      };
}

class RevisedTarget {
  RevisedTarget({
    this.reason,
  });

  String? reason;

  factory RevisedTarget.fromJson(Map<String, dynamic> json) => RevisedTarget(
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
      };
}

class Series {
  Series({
    this.id,
    this.name,
    this.seriesType,
    this.startDate,
    this.endDate,
    this.seriesFolder,
    this.odiSeriesResult,
    this.t20SeriesResult,
    this.testSeriesResult,
  });

  int? id;
  String? name;
  String? seriesType;
  int? startDate;
  int? endDate;
  String? seriesFolder;
  String? odiSeriesResult;
  String? t20SeriesResult;
  String? testSeriesResult;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        id: json["id"],
        name: json["name"],
        seriesType: json["seriesType"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        seriesFolder: json["seriesFolder"],
        odiSeriesResult: json["odiSeriesResult"],
        t20SeriesResult: json["t20SeriesResult"],
        testSeriesResult: json["testSeriesResult"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "seriesType": seriesType,
        "startDate": startDate,
        "endDate": endDate,
        "seriesFolder": seriesFolder,
        "odiSeriesResult": odiSeriesResult,
        "t20SeriesResult": t20SeriesResult,
        "testSeriesResult": testSeriesResult,
      };
}

class Team {
  Team({
    this.id,
    this.name,
    this.playerDetails,
    this.shortName,
  });

  int? id;
  String? name;
  List<Player>? playerDetails;
  String? shortName;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        playerDetails: List<Player>.from(
            json["playerDetails"].map((x) => Player.fromJson(x))),
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "playerDetails":
            List<dynamic>.from(playerDetails!.map((x) => x.toJson())),
        "shortName": shortName,
      };
}

class TossResults {
  TossResults({
    this.tossWinnerId,
    this.tossWinnerName,
    this.decision,
  });

  int? tossWinnerId;
  String? tossWinnerName;
  String? decision;

  factory TossResults.fromJson(Map<String, dynamic> json) => TossResults(
        tossWinnerId: json["tossWinnerId"],
        tossWinnerName: json["tossWinnerName"],
        decision: json["decision"],
      );

  Map<String, dynamic> toJson() => {
        "tossWinnerId": tossWinnerId,
        "tossWinnerName": tossWinnerName,
        "decision": decision,
      };
}

class Venue {
  Venue({
    this.id,
    this.name,
    this.city,
    this.country,
    this.timezone,
    this.latitude,
    this.longitude,
  });

  int? id;
  String? name;
  String? city;
  String? country;
  String? timezone;
  String? latitude;
  String? longitude;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        country: json["country"],
        timezone: json["timezone"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "country": country,
        "timezone": timezone,
        "latitude": latitude,
        "longitude": longitude,
      };
}

class VenueInfo {
  VenueInfo({
    this.established,
    this.capacity,
    this.knownAs,
    this.ends,
    this.city,
    this.country,
    this.timezone,
    this.homeTeam,
    this.floodlights,
    this.curator,
    this.profile,
    this.imageUrl,
    this.ground,
    this.groundLength,
    this.groundWidth,
    this.otherSports,
  });

  int? established;
  String? capacity;
  String? knownAs;
  String? ends;
  String? city;
  String? country;
  String? timezone;
  String? homeTeam;
  bool? floodlights;
  dynamic curator;
  dynamic profile;
  String? imageUrl;
  String? ground;
  int? groundLength;
  int? groundWidth;
  dynamic otherSports;

  factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
        established: json["established"],
        capacity: json["capacity"],
        knownAs: json["knownAs"],
        ends: json["ends"],
        city: json["city"],
        country: json["country"],
        timezone: json["timezone"],
        homeTeam: json["homeTeam"],
        floodlights: json["floodlights"],
        curator: json["curator"],
        profile: json["profile"],
        imageUrl: json["imageUrl"],
        ground: json["ground"],
        groundLength: json["groundLength"],
        groundWidth: json["groundWidth"],
        otherSports: json["otherSports"],
      );

  Map<String, dynamic> toJson() => {
        "established": established,
        "capacity": capacity,
        "knownAs": knownAs,
        "ends": ends,
        "city": city,
        "country": country,
        "timezone": timezone,
        "homeTeam": homeTeam,
        "floodlights": floodlights,
        "curator": curator,
        "profile": profile,
        "imageUrl": imageUrl,
        "ground": ground,
        "groundLength": groundLength,
        "groundWidth": groundWidth,
        "otherSports": otherSports,
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
