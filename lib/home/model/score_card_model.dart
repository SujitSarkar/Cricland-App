// To parse this JSON data, do
//
//     final scoreCardModel = scoreCardModelFromJson(jsonString);

import 'dart:convert';

ScoreCardModel scoreCardModelFromJson(String str) =>
    ScoreCardModel.fromJson(json.decode(str));

String scoreCardModelToJson(ScoreCardModel data) => json.encode(data.toJson());

class ScoreCardModel {
  ScoreCardModel({
    this.scoreCard,

  });

  List<ScoreCard>? scoreCard;


  factory ScoreCardModel.fromJson(Map<String, dynamic> json) => ScoreCardModel(
        scoreCard: List<ScoreCard>.from(
            json["scoreCard"].map((x) => ScoreCard.fromJson(x))),

      );

  Map<String, dynamic> toJson() => {
        "scoreCard": List<dynamic>.from(scoreCard!.map((x) => x.toJson())),

      };
}



class ScoreCard {
  ScoreCard({
    this.matchId,
    this.inningsId,
    this.timeScore,
    this.batTeamDetails,
    this.bowlTeamDetails,
    this.scoreDetails,
    this.extrasData,

    this.wicketsData,

  });

  dynamic matchId;
  dynamic inningsId;
  dynamic timeScore;
  BatTeamDetails? batTeamDetails;
  BowlTeamDetails? bowlTeamDetails;
  ScoreDetails? scoreDetails;
  ExtrasData? extrasData;
  Map<String, WicketsDatum>? wicketsData;

  factory ScoreCard.fromJson(Map<String, dynamic> json) => ScoreCard(
        matchId: json["matchId"],
        inningsId: json["inningsId"],
        timeScore: json["timeScore"],
        batTeamDetails: BatTeamDetails.fromJson(json["batTeamDetails"]),
        bowlTeamDetails: BowlTeamDetails.fromJson(json["bowlTeamDetails"]),
        scoreDetails: ScoreDetails.fromJson(json["scoreDetails"]),
        extrasData: ExtrasData.fromJson(json["extrasData"]),
        wicketsData: Map.from(json["wicketsData"]).map((k, v) =>
            MapEntry<String, WicketsDatum>(k, WicketsDatum.fromJson(v))),

      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "inningsId": inningsId,
        "timeScore": timeScore,
        "batTeamDetails": batTeamDetails!.toJson(),
        "bowlTeamDetails": bowlTeamDetails!.toJson(),
        "scoreDetails": scoreDetails!.toJson(),
        "extrasData": extrasData!.toJson(),
        "wicketsData": Map.from(wicketsData!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class BatTeamDetails {
  BatTeamDetails({
    this.batTeamId,
    this.batTeamName,
    this.batTeamShortName,
    this.batsmenData,
  });

  dynamic batTeamId;
  String? batTeamName;
  String? batTeamShortName;
  Map<String, BatsmenDatum>? batsmenData;

  factory BatTeamDetails.fromJson(Map<String, dynamic> json) => BatTeamDetails(
        batTeamId: json["batTeamId"],
        batTeamName: json["batTeamName"],
        batTeamShortName: json["batTeamShortName"],
        batsmenData: Map.from(json["batsmenData"]).map((k, v) =>
            MapEntry<String, BatsmenDatum>(k, BatsmenDatum.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "batTeamId": batTeamId,
        "batTeamName": batTeamName,
        "batTeamShortName": batTeamShortName,
        "batsmenData": Map.from(batsmenData!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class BatsmenDatum {
  BatsmenDatum({
    this.batId,
    this.batName,
    this.batShortName,
    this.isCaptain,
    this.isKeeper,
    this.runs,
    this.balls,
    this.dots,
    this.fours,
    this.sixes,
    this.mins,
    this.strikeRate,
    this.outDesc,
    this.bowlerId,
    this.fielderId1,
    this.fielderId2,
    this.fielderId3,
    this.ones,
    this.twos,
    this.threes,
    this.fives,
    this.boundaries,
    this.sixers,
    this.wicketCode,
  });

  dynamic batId;
  String? batName;
  String? batShortName;
  bool? isCaptain;
  bool? isKeeper;
  dynamic runs;
  dynamic balls;
  dynamic dots;
  dynamic fours;
  dynamic sixes;
  dynamic mins;
  double? strikeRate;
  String? outDesc;
  dynamic bowlerId;
  dynamic fielderId1;
  dynamic fielderId2;
  dynamic fielderId3;
  dynamic ones;
  dynamic twos;
  dynamic threes;
  dynamic fives;
  dynamic boundaries;
  dynamic sixers;
  String? wicketCode;

  factory BatsmenDatum.fromJson(Map<String, dynamic> json) => BatsmenDatum(
        batId: json["batId"],
        batName: json["batName"],
        batShortName: json["batShortName"],
        isCaptain: json["isCaptain"],
        isKeeper: json["isKeeper"],
        runs: json["runs"],
        balls: json["balls"],
        dots: json["dots"],
        fours: json["fours"],
        sixes: json["sixes"],
        mins: json["mins"],
        strikeRate: json["strikeRate"].toDouble(),
        outDesc: json["outDesc"],
        bowlerId: json["bowlerId"],
        fielderId1: json["fielderId1"],
        fielderId2: json["fielderId2"],
        fielderId3: json["fielderId3"],
        ones: json["ones"],
        twos: json["twos"],
        threes: json["threes"],
        fives: json["fives"],
        boundaries: json["boundaries"],
        sixers: json["sixers"],
        wicketCode: json["wicketCode"],
      );

  Map<String, dynamic> toJson() => {
        "batId": batId,
        "batName": batName,
        "batShortName": batShortName,
        "isCaptain": isCaptain,
        "isKeeper": isKeeper,
        "runs": runs,
        "balls": balls,
        "dots": dots,
        "fours": fours,
        "sixes": sixes,
        "mins": mins,
        "strikeRate": strikeRate,
        "outDesc": outDesc,
        "bowlerId": bowlerId,
        "fielderId1": fielderId1,
        "fielderId2": fielderId2,
        "fielderId3": fielderId3,
        "ones": ones,
        "twos": twos,
        "threes": threes,
        "fives": fives,
        "boundaries": boundaries,
        "sixers": sixers,
        "wicketCode": wicketCode,
      };
}

class BowlTeamDetails {
  BowlTeamDetails({
    this.bowlTeamId,
    this.bowlTeamName,
    this.bowlTeamShortName,
    this.bowlersData,
  });

  dynamic bowlTeamId;
  String? bowlTeamName;
  String? bowlTeamShortName;
  BowlersData? bowlersData;

  factory BowlTeamDetails.fromJson(Map<String, dynamic> json) =>
      BowlTeamDetails(
        bowlTeamId: json["bowlTeamId"],
        bowlTeamName: json["bowlTeamName"],
        bowlTeamShortName: json["bowlTeamShortName"],
        bowlersData: BowlersData.fromJson(json["bowlersData"]),
      );

  Map<String, dynamic> toJson() => {
        "bowlTeamId": bowlTeamId,
        "bowlTeamName": bowlTeamName,
        "bowlTeamShortName": bowlTeamShortName,
        "bowlersData": bowlersData!.toJson(),
      };
}

class BowlersData {
  BowlersData({
    this.bowl1,
    this.bowl4,
    this.bowl6,
    this.bowl5,
    this.bowl3,
    this.bowl2,
  });

  Bowl? bowl1;
  Bowl? bowl4;
  Bowl? bowl6;
  Bowl? bowl5;
  Bowl? bowl3;
  Bowl? bowl2;

  factory BowlersData.fromJson(Map<String, dynamic> json) => BowlersData(
        bowl1: Bowl.fromJson(json["bowl_1"]),
        bowl4: Bowl.fromJson(json["bowl_4"]),
        bowl6: Bowl.fromJson(json["bowl_6"]),
        bowl5: Bowl.fromJson(json["bowl_5"]),
        bowl3: Bowl.fromJson(json["bowl_3"]),
        bowl2: Bowl.fromJson(json["bowl_2"]),
      );

  Map<String, dynamic> toJson() => {
        "bowl_1": bowl1!.toJson(),
        "bowl_4": bowl4!.toJson(),
        "bowl_6": bowl6!.toJson(),
        "bowl_5": bowl5!.toJson(),
        "bowl_3": bowl3!.toJson(),
        "bowl_2": bowl2!.toJson(),
      };
}

class Bowl {
  Bowl({
    this.bowlerId,
    this.bowlName,
    this.bowlShortName,
    this.isCaptain,
    this.isKeeper,
    this.overs,
    this.maidens,
    this.runs,
    this.wickets,
    this.economy,
    this.noBalls,
    this.wides,
    this.dots,
    this.balls,
    this.runsPerBall,
  });

  dynamic bowlerId;
  String? bowlName;
  String? bowlShortName;
  bool? isCaptain;
  bool? isKeeper;
  double? overs;
  dynamic maidens;
  dynamic runs;
  dynamic wickets;
  double? economy;
  dynamic noBalls;
  dynamic wides;
  dynamic dots;
  dynamic balls;
  //Double
  double? runsPerBall;

  factory Bowl.fromJson(Map<String, dynamic> json) => Bowl(
        bowlerId: json["bowlerId"],
        bowlName: json["bowlName"],
        bowlShortName: json["bowlShortName"],
        isCaptain: json["isCaptain"],
        isKeeper: json["isKeeper"],
        overs: json["overs"].toDouble(),
        maidens: json["maidens"],
        runs: json["runs"],
        wickets: json["wickets"],
        economy: json["economy"].toDouble(),
        noBalls: json["no_balls"],
        wides: json["wides"],
        dots: json["dots"],
        balls: json["balls"],
        runsPerBall: json["runsPerBall"],
      );

  Map<String, dynamic> toJson() => {
        "bowlerId": bowlerId,
        "bowlName": bowlName,
        "bowlShortName": bowlShortName,
        "isCaptain": isCaptain,
        "isKeeper": isKeeper,
        "overs": overs,
        "maidens": maidens,
        "runs": runs,
        "wickets": wickets,
        "economy": economy,
        "no_balls": noBalls,
        "wides": wides,
        "dots": dots,
        "balls": balls,
        "runsPerBall": runsPerBall,
      };
}

class ExtrasData {
  ExtrasData({
    this.noBalls,
    this.total,
    this.byes,
    this.penalty,
    this.wides,
    this.legByes,
  });

  dynamic noBalls;
  dynamic total;
  dynamic byes;
  dynamic penalty;
  dynamic wides;
  dynamic legByes;

  factory ExtrasData.fromJson(Map<String, dynamic> json) => ExtrasData(
        noBalls: json["noBalls"],
        total: json["total"],
        byes: json["byes"],
        penalty: json["penalty"],
        wides: json["wides"],
        legByes: json["legByes"],
      );

  Map<String, dynamic> toJson() => {
        "noBalls": noBalls,
        "total": total,
        "byes": byes,
        "penalty": penalty,
        "wides": wides,
        "legByes": legByes,
      };
}

// class PartnershipsDatum {
//   PartnershipsDatum({
//     this.bat1Id,
//     this.bat1Name,
//     this.bat1Runs,
//     this.bat1Fours,
//     this.bat1Sixes,
//     this.bat2Id,
//     this.bat2Name,
//     this.bat2Runs,
//     this.bat2Fours,
//     this.bat2Sixes,
//     this.totalRuns,
//     this.totalBalls,
//     this.bat1Balls,
//     this.bat2Balls,
//     this.bat1Ones,
//     this.bat1Twos,
//     this.bat1Threes,
//     this.bat1Fives,
//     this.bat1Boundaries,
//     this.bat1Sixers,
//     this.bat2Ones,
//     this.bat2Twos,
//     this.bat2Threes,
//     this.bat2Fives,
//     this.bat2Boundaries,
//     this.bat2Sixers,
//   });
//
//   dynamic bat1Id;
//   String? bat1Name;
//   dynamic bat1Runs;
//   dynamic bat1Fours;
//   dynamic bat1Sixes;
//   dynamic bat2Id;
//   String? bat2Name;
//   dynamic bat2Runs;
//   dynamic bat2Fours;
//   dynamic bat2Sixes;
//   dynamic totalRuns;
//   dynamic totalBalls;
//   dynamic bat1Balls;
//   dynamic bat2Balls;
//   dynamic bat1Ones;
//   dynamic bat1Twos;
//   dynamic bat1Threes;
//   dynamic bat1Fives;
//   dynamic bat1Boundaries;
//   dynamic bat1Sixers;
//   dynamic bat2Ones;
//   dynamic bat2Twos;
//   dynamic bat2Threes;
//   dynamic bat2Fives;
//   dynamic bat2Boundaries;
//   dynamic bat2Sixers;
//
//   factory PartnershipsDatum.fromJson(Map<String, dynamic> json) =>
//       PartnershipsDatum(
//         bat1Id: json["bat1Id"],
//         bat1Name: json["bat1Name"],
//         bat1Runs: json["bat1Runs"],
//         bat1Fours: json["bat1fours"],
//         bat1Sixes: json["bat1sixes"],
//         bat2Id: json["bat2Id"],
//         bat2Name: json["bat2Name"],
//         bat2Runs: json["bat2Runs"],
//         bat2Fours: json["bat2fours"],
//         bat2Sixes: json["bat2sixes"],
//         totalRuns: json["totalRuns"],
//         totalBalls: json["totalBalls"],
//         bat1Balls: json["bat1balls"],
//         bat2Balls: json["bat2balls"],
//         bat1Ones: json["bat1Ones"],
//         bat1Twos: json["bat1Twos"],
//         bat1Threes: json["bat1Threes"],
//         bat1Fives: json["bat1Fives"],
//         bat1Boundaries: json["bat1Boundaries"],
//         bat1Sixers: json["bat1Sixers"],
//         bat2Ones: json["bat2Ones"],
//         bat2Twos: json["bat2Twos"],
//         bat2Threes: json["bat2Threes"],
//         bat2Fives: json["bat2Fives"],
//         bat2Boundaries: json["bat2Boundaries"],
//         bat2Sixers: json["bat2Sixers"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "bat1Id": bat1Id,
//         "bat1Name": bat1Name,
//         "bat1Runs": bat1Runs,
//         "bat1fours": bat1Fours,
//         "bat1sixes": bat1Sixes,
//         "bat2Id": bat2Id,
//         "bat2Name": bat2Name,
//         "bat2Runs": bat2Runs,
//         "bat2fours": bat2Fours,
//         "bat2sixes": bat2Sixes,
//         "totalRuns": totalRuns,
//         "totalBalls": totalBalls,
//         "bat1balls": bat1Balls,
//         "bat2balls": bat2Balls,
//         "bat1Ones": bat1Ones,
//         "bat1Twos": bat1Twos,
//         "bat1Threes": bat1Threes,
//         "bat1Fives": bat1Fives,
//         "bat1Boundaries": bat1Boundaries,
//         "bat1Sixers": bat1Sixers,
//         "bat2Ones": bat2Ones,
//         "bat2Twos": bat2Twos,
//         "bat2Threes": bat2Threes,
//         "bat2Fives": bat2Fives,
//         "bat2Boundaries": bat2Boundaries,
//         "bat2Sixers": bat2Sixers,
//       };
// }

// class PpData {
//   PpData({
//     this.pp1,
//   });
//
//   Pp1? pp1;
//
//   factory PpData.fromJson(Map<String, dynamic> json) => PpData(
//         pp1: Pp1.fromJson(json["pp_1"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "pp_1": pp1!.toJson(),
//       };
// }

// class Pp1 {
//   Pp1({
//     this.ppId,
//     this.ppOversFrom,
//     this.ppOversTo,
//     this.ppType,
//     this.runsScored,
//   });
//
//   dynamic ppId;
//   double? ppOversFrom;
//   //Double
//   double? ppOversTo;
//   String? ppType;
//   dynamic runsScored;
//
//   factory Pp1.fromJson(Map<String, dynamic> json) => Pp1(
//         ppId: json["ppId"],
//         ppOversFrom: json["ppOversFrom"].toDouble(),
//         ppOversTo: json["ppOversTo"],
//         ppType: json["ppType"],
//         runsScored: json["runsScored"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "ppId": ppId,
//         "ppOversFrom": ppOversFrom,
//         "ppOversTo": ppOversTo,
//         "ppType": ppType,
//         "runsScored": runsScored,
//       };
// }

class ScoreDetails {
  ScoreDetails({
    this.ballNbr,
    this.isDeclared,
    this.isFollowOn,
    this.overs,
    this.revisedOvers,
    this.runRate,
    this.runs,
    this.wickets,
    this.runsPerBall,
  });

  dynamic ballNbr;
  bool? isDeclared;
  bool? isFollowOn;
  double? overs;
  dynamic revisedOvers;
  double? runRate;
  dynamic runs;
  dynamic wickets;
  double? runsPerBall;

  factory ScoreDetails.fromJson(Map<String, dynamic> json) => ScoreDetails(
        ballNbr: json["ballNbr"],
        isDeclared: json["isDeclared"],
        isFollowOn: json["isFollowOn"],
        overs: json["overs"].toDouble(),
        revisedOvers: json["revisedOvers"],
        runRate: json["runRate"].toDouble(),
        runs: json["runs"],
        wickets: json["wickets"],
        runsPerBall: json["runsPerBall"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ballNbr": ballNbr,
        "isDeclared": isDeclared,
        "isFollowOn": isFollowOn,
        "overs": overs,
        "revisedOvers": revisedOvers,
        "runRate": runRate,
        "runs": runs,
        "wickets": wickets,
        "runsPerBall": runsPerBall,
      };
}

class WicketsDatum {
  WicketsDatum({
    this.batId,
    this.batName,
    this.wktNbr,
    this.wktOver,
    this.wktRuns,
    this.ballNbr,
  });

  dynamic batId;
  String? batName;
  dynamic wktNbr;
  double? wktOver;
  dynamic wktRuns;
  dynamic ballNbr;

  factory WicketsDatum.fromJson(Map<String, dynamic> json) => WicketsDatum(
        batId: json["batId"],
        batName: json["batName"],
        wktNbr: json["wktNbr"],
        wktOver: json["wktOver"].toDouble(),
        wktRuns: json["wktRuns"],
        ballNbr: json["ballNbr"],
      );

  Map<String, dynamic> toJson() => {
        "batId": batId,
        "batName": batName,
        "wktNbr": wktNbr,
        "wktOver": wktOver,
        "wktRuns": wktRuns,
        "ballNbr": ballNbr,
      };
}
