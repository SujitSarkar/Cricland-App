// To parse this JSON data, do
//
//     final overSummeryModel = overSummeryModelFromJson(jsonString);

import 'dart:convert';

OverSummeryModel overSummeryModelFromJson(String str) =>
    OverSummeryModel.fromJson(json.decode(str));

String overSummeryModelToJson(OverSummeryModel data) =>
    json.encode(data.toJson());

class OverSummeryModel {
  OverSummeryModel({
    this.inningsId,
    this.batsmanStriker,
    this.batsmanNonStriker,
    this.batTeam,
    this.bowlerStriker,
    this.bowlerNonStriker,
    this.overs,
    this.recentOvsStats,
    this.target,
    this.partnerShip,
    this.currentRunRate,
    this.requiredRunRate,
    this.lastWicket,
    this.matchScoreDetails,
    this.latestPerformance,
    this.ppData,
    this.overSummaryList,
    this.status,
    this.lastWicketScore,
    this.remRunsToWin,
    this.matchHeader,
    this.responseLastUpdated,
  });

  int? inningsId;
  BatsmanNStriker? batsmanStriker;
  BatsmanNStriker? batsmanNonStriker;
  BatTeam? batTeam;
  BowlerStriker? bowlerStriker;
  BowlerStriker? bowlerNonStriker;
  double? overs;
  String? recentOvsStats;
  int? target;
  PartnerShip? partnerShip;
  double? currentRunRate;
  double? requiredRunRate;
  String? lastWicket;
  MatchScoreDetails? matchScoreDetails;
  List<LatestPerformance>? latestPerformance;
  PpData? ppData;
  List<OverSummaryList>? overSummaryList;
  String? status;
  int? lastWicketScore;
  int? remRunsToWin;
  MatchHeader? matchHeader;
  int? responseLastUpdated;

  factory OverSummeryModel.fromJson(Map<String, dynamic> json) =>
      OverSummeryModel(
        inningsId: json["inningsId"],
        batsmanStriker: BatsmanNStriker.fromJson(json["batsmanStriker"]),
        batsmanNonStriker: BatsmanNStriker.fromJson(json["batsmanNonStriker"]),
        batTeam: BatTeam.fromJson(json["batTeam"]),
        bowlerStriker: BowlerStriker.fromJson(json["bowlerStriker"]),
        bowlerNonStriker: BowlerStriker.fromJson(json["bowlerNonStriker"]),
        overs: json["overs"].toDouble(),
        recentOvsStats: json["recentOvsStats"],
        target: json["target"],
        partnerShip: PartnerShip.fromJson(json["partnerShip"]),
        currentRunRate: json["currentRunRate"].toDouble(),
        requiredRunRate: json["requiredRunRate"],
        lastWicket: json["lastWicket"],
        matchScoreDetails:
            MatchScoreDetails.fromJson(json["matchScoreDetails"]),
        latestPerformance: List<LatestPerformance>.from(
            json["latestPerformance"]
                .map((x) => LatestPerformance.fromJson(x))),
        ppData: PpData.fromJson(json["ppData"]),
        overSummaryList: List<OverSummaryList>.from(
            json["overSummaryList"].map((x) => OverSummaryList.fromJson(x))),
        status: json["status"],
        lastWicketScore: json["lastWicketScore"],
        remRunsToWin: json["remRunsToWin"],
        matchHeader: MatchHeader.fromJson(json["matchHeader"]),
        responseLastUpdated: json["responseLastUpdated"],
      );

  Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "batsmanStriker": batsmanStriker!.toJson(),
        "batsmanNonStriker": batsmanNonStriker!.toJson(),
        "batTeam": batTeam!.toJson(),
        "bowlerStriker": bowlerStriker!.toJson(),
        "bowlerNonStriker": bowlerNonStriker!.toJson(),
        "overs": overs,
        "recentOvsStats": recentOvsStats,
        "target": target,
        "partnerShip": partnerShip!.toJson(),
        "currentRunRate": currentRunRate,
        "requiredRunRate": requiredRunRate,
        "lastWicket": lastWicket,
        "matchScoreDetails": matchScoreDetails!.toJson(),
        "latestPerformance":
            List<dynamic>.from(latestPerformance!.map((x) => x.toJson())),
        "ppData": ppData!.toJson(),
        "overSummaryList":
            List<dynamic>.from(overSummaryList!.map((x) => x.toJson())),
        "status": status,
        "lastWicketScore": lastWicketScore,
        "remRunsToWin": remRunsToWin,
        "matchHeader": matchHeader!.toJson(),
        "responseLastUpdated": responseLastUpdated,
      };
}

class BatTeam {
  BatTeam({
    this.teamId,
    this.teamScore,
    this.teamWkts,
  });

  int? teamId;
  int? teamScore;
  int? teamWkts;

  factory BatTeam.fromJson(Map<String, dynamic> json) => BatTeam(
        teamId: json["teamId"],
        teamScore: json["teamScore"],
        teamWkts: json["teamWkts"],
      );

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamScore": teamScore,
        "teamWkts": teamWkts,
      };
}

class BatsmanNStriker {
  BatsmanNStriker({
    this.batBalls,
    this.batDots,
    this.batFours,
    this.batId,
    this.batName,
    this.batMins,
    this.batRuns,
    this.batSixes,
    this.batStrikeRate,
  });

  int? batBalls;
  int? batDots;
  int? batFours;
  int? batId;
  String? batName;
  int? batMins;
  int? batRuns;
  int? batSixes;
  double? batStrikeRate;

  factory BatsmanNStriker.fromJson(Map<String, dynamic> json) =>
      BatsmanNStriker(
        batBalls: json["batBalls"],
        batDots: json["batDots"],
        batFours: json["batFours"],
        batId: json["batId"],
        batName: json["batName"],
        batMins: json["batMins"],
        batRuns: json["batRuns"],
        batSixes: json["batSixes"],
        batStrikeRate: json["batStrikeRate"],
      );

  Map<String, dynamic> toJson() => {
        "batBalls": batBalls,
        "batDots": batDots,
        "batFours": batFours,
        "batId": batId,
        "batName": batName,
        "batMins": batMins,
        "batRuns": batRuns,
        "batSixes": batSixes,
        "batStrikeRate": batStrikeRate,
      };
}

class BowlerStriker {
  BowlerStriker({
    this.bowlId,
    this.bowlName,
    this.bowlMaidens,
    this.bowlNoballs,
    this.bowlOvs,
    this.bowlRuns,
    this.bowlWides,
    this.bowlWkts,
    this.bowlEcon,
  });

  int? bowlId;
  BowlName? bowlName;
  int? bowlMaidens;
  int? bowlNoballs;
  double? bowlOvs;
  int? bowlRuns;
  int? bowlWides;
  int? bowlWkts;
  double? bowlEcon;

  factory BowlerStriker.fromJson(Map<String, dynamic> json) => BowlerStriker(
        bowlId: json["bowlId"],
        bowlName: bowlNameValues.map![json["bowlName"]],
        bowlMaidens: json["bowlMaidens"],
        bowlNoballs: json["bowlNoballs"],
        bowlOvs: json["bowlOvs"].toDouble(),
        bowlRuns: json["bowlRuns"],
        bowlWides: json["bowlWides"],
        bowlWkts: json["bowlWkts"],
        bowlEcon: json["bowlEcon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "bowlId": bowlId,
        "bowlName": bowlNameValues.reverse[bowlName],
        "bowlMaidens": bowlMaidens,
        "bowlNoballs": bowlNoballs,
        "bowlOvs": bowlOvs,
        "bowlRuns": bowlRuns,
        "bowlWides": bowlWides,
        "bowlWkts": bowlWkts,
        "bowlEcon": bowlEcon,
      };
}

enum BowlName { TANUSH_KOTIAN, SHAMS_MULANI, CHINTAN_GAJA }

final bowlNameValues = EnumValues({
  "Chintan Gaja": BowlName.CHINTAN_GAJA,
  "Shams Mulani": BowlName.SHAMS_MULANI,
  "Tanush Kotian": BowlName.TANUSH_KOTIAN
});

class LatestPerformance {
  LatestPerformance({
    this.runs,
    this.wkts,
    this.label,
  });

  int? runs;
  int? wkts;
  String? label;

  factory LatestPerformance.fromJson(Map<String, dynamic> json) =>
      LatestPerformance(
        runs: json["runs"],
        wkts: json["wkts"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "runs": runs,
        "wkts": wkts,
        "label": label,
      };
}

class MatchHeader {
  MatchHeader({
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
    this.dayNumber,
    this.state,
    this.status,
    this.tossResults,
    this.result,
    this.revisedTarget,
    this.playersOfTheMatch,
    this.playersOfTheSeries,
    this.matchTeamInfo,
    this.isMatchNotCovered,
    this.team1,
    this.team2,
    this.seriesDesc,
    this.seriesId,
    this.seriesName,
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
  int? dayNumber;
  String? state;
  String? status;
  TossResults? tossResults;
  Result? result;
  RevisedTarget? revisedTarget;
  List<PlayersOfThe>? playersOfTheMatch;
  List<PlayersOfThe>? playersOfTheSeries;
  List<MatchTeamInfo>? matchTeamInfo;
  bool? isMatchNotCovered;
  Team? team1;
  Team? team2;
  String? seriesDesc;
  int? seriesId;
  String? seriesName;

  factory MatchHeader.fromJson(Map<String, dynamic> json) => MatchHeader(
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
        dayNumber: json["dayNumber"],
        state: json["state"],
        status: json["status"],
        tossResults: TossResults.fromJson(json["tossResults"]),
        result: Result.fromJson(json["result"]),
        revisedTarget: RevisedTarget.fromJson(json["revisedTarget"]),
        playersOfTheMatch: List<PlayersOfThe>.from(
            json["playersOfTheMatch"].map((x) => PlayersOfThe.fromJson(x))),
        playersOfTheSeries: List<PlayersOfThe>.from(
            json["playersOfTheSeries"].map((x) => PlayersOfThe.fromJson(x))),
        matchTeamInfo: List<MatchTeamInfo>.from(
            json["matchTeamInfo"].map((x) => MatchTeamInfo.fromJson(x))),
        isMatchNotCovered: json["isMatchNotCovered"],
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        seriesDesc: json["seriesDesc"],
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
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
        "dayNumber": dayNumber,
        "state": state,
        "status": status,
        "tossResults": tossResults?.toJson(),
        "result": result?.toJson(),
        "revisedTarget": revisedTarget?.toJson(),
        "playersOfTheMatch":
            List<dynamic>.from(playersOfTheMatch!.map((x) => x.toJson())),
        "playersOfTheSeries":
            List<dynamic>.from(playersOfTheSeries!.map((x) => x.toJson())),
        "matchTeamInfo":
            List<dynamic>.from(matchTeamInfo!.map((x) => x.toJson())),
        "isMatchNotCovered": isMatchNotCovered,
        "team1": team1!.toJson(),
        "team2": team2!.toJson(),
        "seriesDesc": seriesDesc,
        "seriesId": seriesId,
        "seriesName": seriesName,
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

class PlayersOfThe {
  PlayersOfThe({
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

  factory PlayersOfThe.fromJson(Map<String, dynamic> json) => PlayersOfThe(
        id: json["id"],
        name: json["name"],
        fullName: json["fullName"],
        nickName: json["nickName"],
        captain: json["captain"],
        keeper: json["keeper"],
        substitute: json["substitute"],
        teamName: json["teamName"] == null ? null : json["teamName"],
        faceImageId: json["faceImageId"],
        bowlingStyle:
            json["bowlingStyle"] == null ? null : json["bowlingStyle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullName": fullName,
        "nickName": nickName,
        "captain": captain,
        "keeper": keeper,
        "substitute": substitute,
        "teamName": teamName == null ? null : teamName,
        "faceImageId": faceImageId,
        "bowlingStyle": bowlingStyle == null ? null : bowlingStyle,
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

class Team {
  Team({
    this.id,
    this.name,
    this.playerDetails,
    this.shortName,
  });

  int? id;
  String? name;
  List<dynamic>? playerDetails;
  String? shortName;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        playerDetails: List<dynamic>.from(json["playerDetails"].map((x) => x)),
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "playerDetails": List<dynamic>.from(playerDetails!.map((x) => x)),
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

class MatchScoreDetails {
  MatchScoreDetails({
    this.matchId,
    this.inningsScoreList,
    this.tossResults,
    this.matchTeamInfo,
    this.isMatchNotCovered,
    this.matchFormat,
    this.state,
    this.customStatus,
    this.highlightedTeamId,
  });

  int? matchId;
  List<InningsScoreList>? inningsScoreList;
  TossResults? tossResults;
  List<MatchTeamInfo>? matchTeamInfo;
  bool? isMatchNotCovered;
  String? matchFormat;
  String? state;
  String? customStatus;
  int? highlightedTeamId;

  factory MatchScoreDetails.fromJson(Map<String, dynamic> json) =>
      MatchScoreDetails(
        matchId: json["matchId"],
        inningsScoreList: List<InningsScoreList>.from(
            json["inningsScoreList"].map((x) => InningsScoreList.fromJson(x))),
        tossResults: TossResults.fromJson(json["tossResults"]),
        matchTeamInfo: List<MatchTeamInfo>.from(
            json["matchTeamInfo"].map((x) => MatchTeamInfo.fromJson(x))),
        isMatchNotCovered: json["isMatchNotCovered"],
        matchFormat: json["matchFormat"],
        state: json["state"],
        customStatus: json["customStatus"],
        highlightedTeamId: json["highlightedTeamId"],
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "inningsScoreList":
            List<dynamic>.from(inningsScoreList!.map((x) => x.toJson())),
        "tossResults": tossResults!.toJson(),
        "matchTeamInfo":
            List<dynamic>.from(matchTeamInfo!.map((x) => x.toJson())),
        "isMatchNotCovered": isMatchNotCovered,
        "matchFormat": matchFormat,
        "state": state,
        "customStatus": customStatus,
        "highlightedTeamId": highlightedTeamId,
      };
}

class InningsScoreList {
  InningsScoreList({
    this.inningsId,
    this.batTeamId,
    this.batTeamName,
    this.score,
    this.wickets,
    this.overs,
    this.isDeclared,
    this.isFollowOn,
    this.ballNbr,
  });

  int? inningsId;
  int? batTeamId;
  String? batTeamName;
  int? score;
  int? wickets;
  double? overs;
  bool? isDeclared;
  bool? isFollowOn;
  int? ballNbr;

  factory InningsScoreList.fromJson(Map<String, dynamic> json) =>
      InningsScoreList(
        inningsId: json["inningsId"],
        batTeamId: json["batTeamId"],
        batTeamName: json["batTeamName"],
        score: json["score"],
        wickets: json["wickets"],
        overs: json["overs"].toDouble(),
        isDeclared: json["isDeclared"],
        isFollowOn: json["isFollowOn"],
        ballNbr: json["ballNbr"],
      );

  Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "batTeamId": batTeamId,
        "batTeamName": batTeamName,
        "score": score,
        "wickets": wickets,
        "overs": overs,
        "isDeclared": isDeclared,
        "isFollowOn": isFollowOn,
        "ballNbr": ballNbr,
      };
}

class OverSummaryList {
  OverSummaryList({
    this.score,
    this.wickets,
    this.inningsId,
    this.oSummary,
    this.runs,
    this.batStrikerIds,
    this.batStrikerNames,
    this.batStrikerRuns,
    this.batStrikerBalls,
    this.batNonStrikerIds,
    this.batNonStrikerNames,
    this.batNonStrikerRuns,
    this.batNonStrikerBalls,
    this.bowlIds,
    this.bowlNames,
    this.bowlOvers,
    this.bowlMaidens,
    this.bowlRuns,
    this.bowlWickets,
    this.timestamp,
    this.overNum,
    this.batTeamName,
    this.event,
  });

  int? score;
  int? wickets;
  int? inningsId;
  String? oSummary;
  int? runs;
  List<int>? batStrikerIds;
  List<String>? batStrikerNames;
  int? batStrikerRuns;
  int? batStrikerBalls;
  List<int>? batNonStrikerIds;
  List<String>? batNonStrikerNames;
  int? batNonStrikerRuns;
  int? batNonStrikerBalls;
  List<int>? bowlIds;
  List<BowlName>? bowlNames;
  double? bowlOvers;
  int? bowlMaidens;
  int? bowlRuns;
  int? bowlWickets;
  int? timestamp;
  double? overNum;
  BatTeamName? batTeamName;
  Event? event;

  factory OverSummaryList.fromJson(Map<String, dynamic> json) =>
      OverSummaryList(
        score: json["score"],
        wickets: json["wickets"],
        inningsId: json["inningsId"],
        oSummary: json["o_summary"],
        runs: json["runs"],
        batStrikerIds: List<int>.from(json["batStrikerIds"].map((x) => x)),
        batStrikerNames:
            List<String>.from(json["batStrikerNames"].map((x) => x)),
        batStrikerRuns: json["batStrikerRuns"],
        batStrikerBalls: json["batStrikerBalls"],
        batNonStrikerIds:
            List<int>.from(json["batNonStrikerIds"].map((x) => x)),
        batNonStrikerNames:
            List<String>.from(json["batNonStrikerNames"].map((x) => x)),
        batNonStrikerRuns: json["batNonStrikerRuns"],
        batNonStrikerBalls: json["batNonStrikerBalls"],
        bowlIds: List<int>.from(json["bowlIds"].map((x) => x)),
        bowlNames: List<BowlName>.from(
            json["bowlNames"].map((x) => bowlNameValues.map![x])),
        bowlOvers: json["bowlOvers"].toDouble(),
        bowlMaidens: json["bowlMaidens"],
        bowlRuns: json["bowlRuns"],
        bowlWickets: json["bowlWickets"],
        timestamp: json["timestamp"],
        overNum: json["overNum"].toDouble(),
        batTeamName: batTeamNameValues.map![json["batTeamName"]],
        event: eventValues.map![json["event"]],
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "wickets": wickets,
        "inningsId": inningsId,
        "o_summary": oSummary,
        "runs": runs,
        "batStrikerIds": List<dynamic>.from(batStrikerIds!.map((x) => x)),
        "batStrikerNames": List<dynamic>.from(batStrikerNames!.map((x) => x)),
        "batStrikerRuns": batStrikerRuns,
        "batStrikerBalls": batStrikerBalls,
        "batNonStrikerIds": List<dynamic>.from(batNonStrikerIds!.map((x) => x)),
        "batNonStrikerNames":
            List<dynamic>.from(batNonStrikerNames!.map((x) => x)),
        "batNonStrikerRuns": batNonStrikerRuns,
        "batNonStrikerBalls": batNonStrikerBalls,
        "bowlIds": List<dynamic>.from(bowlIds!.map((x) => x)),
        "bowlNames": List<dynamic>.from(
            bowlNames!.map((x) => bowlNameValues.reverse[x])),
        "bowlOvers": bowlOvers,
        "bowlMaidens": bowlMaidens,
        "bowlRuns": bowlRuns,
        "bowlWickets": bowlWickets,
        "timestamp": timestamp,
        "overNum": overNum,
        "batTeamName": batTeamNameValues.reverse[batTeamName],
        "event": eventValues.reverse[event],
      };
}

enum BatTeamName { SZONE }

final batTeamNameValues = EnumValues({"SZONE": BatTeamName.SZONE});

enum Event { OVER_BREAK }

final eventValues = EnumValues({"over-break": Event.OVER_BREAK});

class PartnerShip {
  PartnerShip({
    this.balls,
    this.runs,
  });

  int? balls;
  int? runs;

  factory PartnerShip.fromJson(Map<String, dynamic> json) => PartnerShip(
        balls: json["balls"],
        runs: json["runs"],
      );

  Map<String, dynamic> toJson() => {
        "balls": balls,
        "runs": runs,
      };
}

class PpData {
  PpData();

  factory PpData.fromJson(Map<String, dynamic> json) => PpData();

  Map<String, dynamic> toJson() => {};
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
