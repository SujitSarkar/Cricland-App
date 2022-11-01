// To parse this JSON data, do
//
//     final monkLiveModel = monkLiveModelFromJson(jsonString);

import 'dart:convert';

MonkLiveModel monkLiveModelFromJson(String str) =>
    MonkLiveModel.fromJson(json.decode(str));

String monkLiveModelToJson(MonkLiveModel data) => json.encode(data.toJson());

class MonkLiveModel {
  MonkLiveModel({
    this.data,
  });

  List<Datum>? data;

  factory MonkLiveModel.fromJson(Map<String, dynamic> json) => MonkLiveModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.resource,
    this.id,
    this.leagueId,
    this.seasonId,
    this.stageId,
    this.round,
    this.localteamId,
    this.visitorteamId,
    this.startingAt,
    this.type,
    this.live,
    this.status,
    this.lastPeriod,
    this.note,
    this.venueId,
    this.tossWonTeamId,
    this.winnerTeamId,
    this.drawNoresult,
    this.firstUmpireId,
    this.secondUmpireId,
    this.tvUmpireId,
    this.refereeId,
    this.manOfMatchId,
    this.manOfSeriesId,
    this.totalOversPlayed,
    this.elected,
    this.superOver,
    this.followOn,
    this.localteamDlData,
    this.visitorteamDlData,
    this.rpcOvers,
    this.rpcTarget,
    this.weatherReport,
  });

  String? resource;
  int? id;
  int? leagueId;
  int? seasonId;
  int? stageId;
  String? round;
  int? localteamId;
  int? visitorteamId;
  DateTime? startingAt;
  String? type;
  bool? live;
  String? status;
  dynamic lastPeriod;
  String? note;
  int? venueId;
  int? tossWonTeamId;
  dynamic winnerTeamId;
  dynamic drawNoresult;
  int? firstUmpireId;
  int? secondUmpireId;
  int? tvUmpireId;
  int? refereeId;
  dynamic manOfMatchId;
  dynamic manOfSeriesId;
  int? totalOversPlayed;
  String? elected;
  bool? superOver;
  bool? followOn;
  TeamDlData? localteamDlData;
  TeamDlData? visitorteamDlData;
  dynamic rpcOvers;
  dynamic rpcTarget;
  List<dynamic>? weatherReport;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        resource: json["resource"],
        id: json["id"],
        leagueId: json["league_id"],
        seasonId: json["season_id"],
        stageId: json["stage_id"],
        round: json["round"],
        localteamId: json["localteam_id"],
        visitorteamId: json["visitorteam_id"],
        startingAt: DateTime.parse(json["starting_at"]),
        type: json["type"],
        live: json["live"],
        status: json["status"],
        lastPeriod: json["last_period"],
        note: json["note"],
        venueId: json["venue_id"],
        tossWonTeamId: json["toss_won_team_id"],
        winnerTeamId: json["winner_team_id"],
        drawNoresult: json["draw_noresult"],
        firstUmpireId: json["first_umpire_id"],
        secondUmpireId: json["second_umpire_id"],
        tvUmpireId: json["tv_umpire_id"],
        refereeId: json["referee_id"],
        manOfMatchId: json["man_of_match_id"],
        manOfSeriesId: json["man_of_series_id"],
        totalOversPlayed: json["total_overs_played"],
        elected: json["elected"],
        superOver: json["super_over"],
        followOn: json["follow_on"],
        localteamDlData: TeamDlData.fromJson(json["localteam_dl_data"]),
        visitorteamDlData: TeamDlData.fromJson(json["visitorteam_dl_data"]),
        rpcOvers: json["rpc_overs"],
        rpcTarget: json["rpc_target"],
        weatherReport: List<dynamic>.from(json["weather_report"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "resource": resource,
        "id": id,
        "league_id": leagueId,
        "season_id": seasonId,
        "stage_id": stageId,
        "round": round,
        "localteam_id": localteamId,
        "visitorteam_id": visitorteamId,
        "starting_at": startingAt!.toIso8601String(),
        "type": type,
        "live": live,
        "status": status,
        "last_period": lastPeriod,
        "note": note,
        "venue_id": venueId,
        "toss_won_team_id": tossWonTeamId,
        "winner_team_id": winnerTeamId,
        "draw_noresult": drawNoresult,
        "first_umpire_id": firstUmpireId,
        "second_umpire_id": secondUmpireId,
        "tv_umpire_id": tvUmpireId,
        "referee_id": refereeId,
        "man_of_match_id": manOfMatchId,
        "man_of_series_id": manOfSeriesId,
        "total_overs_played": totalOversPlayed,
        "elected": elected,
        "super_over": superOver,
        "follow_on": followOn,
        "localteam_dl_data": localteamDlData!.toJson(),
        "visitorteam_dl_data": visitorteamDlData!.toJson(),
        "rpc_overs": rpcOvers,
        "rpc_target": rpcTarget,
        "weather_report": List<dynamic>.from(weatherReport!.map((x) => x)),
      };
}

class TeamDlData {
  TeamDlData({
    this.score,
    this.overs,
    this.wicketsOut,
  });

  dynamic score;
  dynamic overs;
  dynamic wicketsOut;

  factory TeamDlData.fromJson(Map<String, dynamic> json) => TeamDlData(
        score: json["score"],
        overs: json["overs"],
        wicketsOut: json["wickets_out"],
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "overs": overs,
        "wickets_out": wicketsOut,
      };
}
