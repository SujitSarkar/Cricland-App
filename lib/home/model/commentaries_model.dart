// To parse this JSON data, do
//
//     final commentariesModel = commentariesModelFromJson(jsonString);

import 'dart:convert';

CommentariesModel commentariesModelFromJson(String str) =>
    CommentariesModel.fromJson(json.decode(str));

String commentariesModelToJson(CommentariesModel data) =>
    json.encode(data.toJson());

class CommentariesModel {
  CommentariesModel({
    this.commentaryList,
    this.matchHeader,
    this.miniscore,
    this.commentarySnippetList,
    this.page,
    this.enableNoContent,
    this.matchVideos,
    this.responseLastUpdated,
  });

  List<CommentaryList>? commentaryList;
  MatchHeader? matchHeader;
  Miniscore? miniscore;
  List<dynamic>? commentarySnippetList;
  String? page;
  bool? enableNoContent;
  List<dynamic>? matchVideos;
  dynamic responseLastUpdated;

  factory CommentariesModel.fromJson(Map<String, dynamic> json) =>
      CommentariesModel(
        commentaryList: List<CommentaryList>.from(
            json["commentaryList"].map((x) => CommentaryList.fromJson(x))),
        matchHeader: MatchHeader.fromJson(json["matchHeader"]),
        miniscore: Miniscore.fromJson(json["miniscore"]),
        commentarySnippetList:
            List<dynamic>.from(json["commentarySnippetList"].map((x) => x)),
        page: json["page"],
        enableNoContent: json["enableNoContent"],
        matchVideos: List<dynamic>.from(json["matchVideos"].map((x) => x)),
        responseLastUpdated: json["responseLastUpdated"],
      );

  Map<String, dynamic> toJson() => {
        "commentaryList":
            List<dynamic>.from(commentaryList!.map((x) => x.toJson())),
        "matchHeader": matchHeader!.toJson(),
        "miniscore": miniscore!.toJson(),
        "commentarySnippetList":
            List<dynamic>.from(commentarySnippetList!.map((x) => x)),
        "page": page,
        "enableNoContent": enableNoContent,
        "matchVideos": List<dynamic>.from(matchVideos!.map((x) => x)),
        "responseLastUpdated": responseLastUpdated,
      };
}

class CommentaryList {
  CommentaryList({
    this.commText,
    this.timestamp,
    this.ballNbr,
    this.inningsId,
    this.event,
    this.batTeamName,
    this.commentaryFormats,
    this.overNumber,
    this.overSeparator,
  });

  String? commText;
  dynamic timestamp;
  dynamic ballNbr;
  dynamic inningsId;
  Event? event;
  BatTeamName? batTeamName;
  CommentaryFormats? commentaryFormats;
  double? overNumber;
  OverSeparator? overSeparator;

  factory CommentaryList.fromJson(Map<String, dynamic> json) => CommentaryList(
        commText: json["commText"],
        timestamp: json["timestamp"],
        ballNbr: json["ballNbr"],
        inningsId: json["inningsId"],
        event: eventValues.map![json["event"]],
        batTeamName: batTeamNameValues.map![json["batTeamName"]],
        commentaryFormats:
            CommentaryFormats.fromJson(json["commentaryFormats"]),
        overNumber:
            json["overNumber"] == null ? null : json["overNumber"].toDouble(),
        overSeparator: json["overSeparator"] == null
            ? null
            : OverSeparator.fromJson(json["overSeparator"]),
      );

  Map<String, dynamic> toJson() => {
        "commText": commText,
        "timestamp": timestamp,
        "ballNbr": ballNbr,
        "inningsId": inningsId,
        "event": eventValues.reverse[event],
        "batTeamName": batTeamNameValues.reverse[batTeamName],
        "commentaryFormats": commentaryFormats!.toJson(),
        "overNumber": overNumber == null ? null : overNumber,
        "overSeparator": overSeparator == null ? null : overSeparator!.toJson(),
      };
}

enum BatTeamName { ENG }

final batTeamNameValues = EnumValues({"ENG": BatTeamName.ENG});

class CommentaryFormats {
  CommentaryFormats({
    this.bold,
  });

  Bold? bold;

  factory CommentaryFormats.fromJson(Map<String, dynamic> json) =>
      CommentaryFormats(
        bold: json["bold"] == null ? null : Bold.fromJson(json["bold"]),
      );

  Map<String, dynamic> toJson() => {
        "bold": bold == null ? null : bold!.toJson(),
      };
}

class Bold {
  Bold({
    this.formatId,
    this.formatValue,
  });

  List<FormatId>? formatId;
  List<String>? formatValue;

  factory Bold.fromJson(Map<String, dynamic> json) => Bold(
        formatId: List<FormatId>.from(
            json["formatId"].map((x) => formatIdValues.map![x])),
        formatValue: List<String>.from(json["formatValue"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "formatId":
            List<dynamic>.from(formatId!.map((x) => formatIdValues.reverse[x])),
        "formatValue": List<dynamic>.from(formatValue!.map((x) => x)),
      };
}

enum FormatId { B0, B1, B2 }

final formatIdValues = EnumValues({
  "B0\u0024": FormatId.B0,
  "B1\u0024": FormatId.B1,
  "B2\u0024": FormatId.B2
});

enum Event { NONE, WICKET, FOUR, OVER_BREAK_WICKET }

final eventValues = EnumValues({
  "FOUR": Event.FOUR,
  "NONE": Event.NONE,
  "over-break,WICKET": Event.OVER_BREAK_WICKET,
  "WICKET": Event.WICKET
});

class OverSeparator {
  OverSeparator({
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

  dynamic score;
  dynamic wickets;
  dynamic inningsId;
  String? oSummary;
  dynamic runs;
  List<int>? batStrikerIds;
  List<String>? batStrikerNames;
  dynamic batStrikerRuns;
  dynamic batStrikerBalls;
  List<int>? batNonStrikerIds;
  List<String>? batNonStrikerNames;
  dynamic batNonStrikerRuns;
  dynamic batNonStrikerBalls;
  List<int>? bowlIds;
  List<String>? bowlNames;
  dynamic bowlOvers;
  dynamic bowlMaidens;
  dynamic bowlRuns;
  dynamic bowlWickets;
  dynamic timestamp;
  double? overNum;
  BatTeamName? batTeamName;
  String? event;

  factory OverSeparator.fromJson(Map<String, dynamic> json) => OverSeparator(
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
        bowlNames: List<String>.from(json["bowlNames"].map((x) => x)),
        bowlOvers: json["bowlOvers"],
        bowlMaidens: json["bowlMaidens"],
        bowlRuns: json["bowlRuns"],
        bowlWickets: json["bowlWickets"],
        timestamp: json["timestamp"],
        overNum: json["overNum"].toDouble(),
        batTeamName: batTeamNameValues.map![json["batTeamName"]],
        event: json["event"],
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
        "bowlNames": List<dynamic>.from(bowlNames!.map((x) => x)),
        "bowlOvers": bowlOvers,
        "bowlMaidens": bowlMaidens,
        "bowlRuns": bowlRuns,
        "bowlWickets": bowlWickets,
        "timestamp": timestamp,
        "overNum": overNum,
        "batTeamName": batTeamNameValues.reverse[batTeamName],
        "event": event,
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

  dynamic matchId;
  String? matchDescription;
  String? matchFormat;
  String? matchType;
  bool? complete;
  bool? domestic;
  dynamic matchStartTimestamp;
  dynamic matchCompleteTimestamp;
  bool? dayNight;
  dynamic year;
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
  dynamic seriesId;
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
        "state": state,
        "status": status,
        "tossResults": tossResults!.toJson(),
        "result": result!.toJson(),
        "revisedTarget": revisedTarget!.toJson(),
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

  dynamic battingTeamId;
  String? battingTeamShortName;
  dynamic bowlingTeamId;
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

  dynamic id;
  String? name;
  String? fullName;
  String? nickName;
  bool? captain;
  bool? keeper;
  bool? substitute;
  String? teamName;
  dynamic faceImageId;
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
  dynamic winningteamId;
  dynamic winningMargin;
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

  dynamic id;
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

  dynamic tossWinnerId;
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

class Miniscore {
  Miniscore({
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
    this.matchUdrs,
    this.overSummaryList,
    this.status,
    this.lastWicketScore,
    this.remRunsToWin,
    this.responseLastUpdated,
  });

  dynamic inningsId;
  BatsmanNStriker? batsmanStriker;
  BatsmanNStriker? batsmanNonStriker;
  BatTeam? batTeam;
  BowlerStriker? bowlerStriker;
  BowlerStriker? bowlerNonStriker;
  double? overs;
  String? recentOvsStats;
  dynamic target;
  PartnerShip? partnerShip;
  double? currentRunRate;
  dynamic requiredRunRate;
  String? lastWicket;
  MatchScoreDetails? matchScoreDetails;
  List<LatestPerformance>? latestPerformance;
  PpData? ppData;
  MatchUdrs? matchUdrs;
  List<dynamic>? overSummaryList;
  String? status;
  dynamic lastWicketScore;
  dynamic remRunsToWin;
  dynamic responseLastUpdated;

  factory Miniscore.fromJson(Map<String, dynamic> json) => Miniscore(
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
        matchUdrs: MatchUdrs.fromJson(json["matchUdrs"]),
        overSummaryList:
            List<dynamic>.from(json["overSummaryList"].map((x) => x)),
        status: json["status"],
        lastWicketScore: json["lastWicketScore"],
        remRunsToWin: json["remRunsToWin"],
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
        "matchUdrs": matchUdrs!.toJson(),
        "overSummaryList": List<dynamic>.from(overSummaryList!.map((x) => x)),
        "status": status,
        "lastWicketScore": lastWicketScore,
        "remRunsToWin": remRunsToWin,
        "responseLastUpdated": responseLastUpdated,
      };
}

class BatTeam {
  BatTeam({
    this.teamId,
    this.teamScore,
    this.teamWkts,
  });

  dynamic teamId;
  dynamic teamScore;
  dynamic teamWkts;

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

  dynamic batBalls;
  dynamic batDots;
  dynamic batFours;
  dynamic batId;
  String? batName;
  dynamic batMins;
  dynamic batRuns;
  dynamic batSixes;
  dynamic batStrikeRate;

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

  dynamic bowlId;
  String? bowlName;
  dynamic bowlMaidens;
  dynamic bowlNoballs;
  double? bowlOvs;
  dynamic bowlRuns;
  dynamic bowlWides;
  dynamic bowlWkts;
  double? bowlEcon;

  factory BowlerStriker.fromJson(Map<String, dynamic> json) => BowlerStriker(
        bowlId: json["bowlId"],
        bowlName: json["bowlName"],
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
        "bowlName": bowlName,
        "bowlMaidens": bowlMaidens,
        "bowlNoballs": bowlNoballs,
        "bowlOvs": bowlOvs,
        "bowlRuns": bowlRuns,
        "bowlWides": bowlWides,
        "bowlWkts": bowlWkts,
        "bowlEcon": bowlEcon,
      };
}

class LatestPerformance {
  LatestPerformance({
    this.runs,
    this.wkts,
    this.label,
  });

  dynamic runs;
  dynamic wkts;
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

  dynamic matchId;
  List<InningsScoreList>? inningsScoreList;
  TossResults? tossResults;
  List<MatchTeamInfo>? matchTeamInfo;
  bool? isMatchNotCovered;
  String? matchFormat;
  String? state;
  String? customStatus;
  dynamic highlightedTeamId;

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

  dynamic inningsId;
  dynamic batTeamId;
  String? batTeamName;
  dynamic score;
  dynamic wickets;
  double? overs;
  bool? isDeclared;
  bool? isFollowOn;
  dynamic ballNbr;

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

class MatchUdrs {
  MatchUdrs({
    this.matchId,
    this.inningsId,
    this.timestamp,
    this.team1Id,
    this.team1Remaining,
    this.team1Successful,
    this.team1Unsuccessful,
    this.team2Id,
    this.team2Remaining,
    this.team2Successful,
    this.team2Unsuccessful,
  });

  dynamic matchId;
  dynamic inningsId;
  DateTime? timestamp;
  dynamic team1Id;
  dynamic team1Remaining;
  dynamic team1Successful;
  dynamic team1Unsuccessful;
  dynamic team2Id;
  dynamic team2Remaining;
  dynamic team2Successful;
  dynamic team2Unsuccessful;

  factory MatchUdrs.fromJson(Map<String, dynamic> json) => MatchUdrs(
        matchId: json["matchId"],
        inningsId: json["inningsId"],
        timestamp: DateTime.parse(json["timestamp"]),
        team1Id: json["team1Id"],
        team1Remaining: json["team1Remaining"],
        team1Successful: json["team1Successful"],
        team1Unsuccessful: json["team1Unsuccessful"],
        team2Id: json["team2Id"],
        team2Remaining: json["team2Remaining"],
        team2Successful: json["team2Successful"],
        team2Unsuccessful: json["team2Unsuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "inningsId": inningsId,
        "timestamp": timestamp!.toIso8601String(),
        "team1Id": team1Id,
        "team1Remaining": team1Remaining,
        "team1Successful": team1Successful,
        "team1Unsuccessful": team1Unsuccessful,
        "team2Id": team2Id,
        "team2Remaining": team2Remaining,
        "team2Successful": team2Successful,
        "team2Unsuccessful": team2Unsuccessful,
      };
}

class PartnerShip {
  PartnerShip({
    this.balls,
    this.runs,
  });

  dynamic balls;
  dynamic runs;

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
  PpData({
    this.pp1,
  });

  Pp1? pp1;

  factory PpData.fromJson(Map<String, dynamic> json) => PpData(
        pp1: Pp1.fromJson(json["pp_1"]),
      );

  Map<String, dynamic> toJson() => {
        "pp_1": pp1!.toJson(),
      };
}

class Pp1 {
  Pp1({
    this.ppId,
    this.ppOversFrom,
    this.ppOversTo,
    this.ppType,
    this.runsScored,
  });

  dynamic ppId;
  double? ppOversFrom;
  dynamic ppOversTo;
  String? ppType;
  dynamic runsScored;

  factory Pp1.fromJson(Map<String, dynamic> json) => Pp1(
        ppId: json["ppId"],
        ppOversFrom: json["ppOversFrom"].toDouble(),
        ppOversTo: json["ppOversTo"],
        ppType: json["ppType"],
        runsScored: json["runsScored"],
      );

  Map<String, dynamic> toJson() => {
        "ppId": ppId,
        "ppOversFrom": ppOversFrom,
        "ppOversTo": ppOversTo,
        "ppType": ppType,
        "runsScored": runsScored,
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
