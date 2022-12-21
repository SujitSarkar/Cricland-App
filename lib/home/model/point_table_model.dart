// To parse this JSON data, do
//
//     final pointTableModel = pointTableModelFromJson(jsonString);

import 'dart:convert';

PointTableModel pointTableModelFromJson(String str) =>
    PointTableModel.fromJson(json.decode(str));

String pointTableModelToJson(PointTableModel data) =>
    json.encode(data.toJson());

class PointTableModel {
  PointTableModel({
    this.pointsTable,
    this.appIndex,
  });

  List<PointsTable>? pointsTable;
  AppIndex? appIndex;

  factory PointTableModel.fromJson(Map<String, dynamic> json) =>
      PointTableModel(
        pointsTable: List<PointsTable>.from(
            json["pointsTable"].map((x) => PointsTable.fromJson(x))),
        appIndex: AppIndex.fromJson(json["appIndex"]),
      );

  Map<String, dynamic> toJson() => {
        "pointsTable": List<dynamic>.from(pointsTable!.map((x) => x.toJson())),
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

class PointsTable {
  PointsTable({
    this.groupName,
    this.pointsTableInfo,
  });

  String? groupName;
  List<PointsTableInfo>? pointsTableInfo;

  factory PointsTable.fromJson(Map<String, dynamic> json) => PointsTable(
        groupName: json["groupName"],
        pointsTableInfo: List<PointsTableInfo>.from(
            json["pointsTableInfo"].map((x) => PointsTableInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "groupName": groupName,
        "pointsTableInfo":
            List<dynamic>.from(pointsTableInfo!.map((x) => x.toJson())),
      };
}

class PointsTableInfo {
  PointsTableInfo({
    this.teamId,
    this.teamName,
    this.matchesPlayed,
    this.matchesWon,
    this.matchesDrawn,
    this.noRes,
    this.points,
    this.nrr,
    this.teamFullName,
    this.teamMatches,
    this.form,
    this.teamImageId,
    this.matchesLost,
  });

  int? teamId;
  Name? teamName;
  int? matchesPlayed;
  int? matchesWon;
  int? matchesDrawn;
  int? noRes;
  int? points;
  String? nrr;
  TeamFullName? teamFullName;
  List<TeamMatch>? teamMatches;
  List<Form>? form;
  int? teamImageId;
  int? matchesLost;

  factory PointsTableInfo.fromJson(Map<String, dynamic> json) =>
      PointsTableInfo(
        teamId: json["teamId"],
        teamName: nameValues.map![json["teamName"]],
        matchesPlayed: json["matchesPlayed"],
        matchesWon: json["matchesWon"],
        matchesDrawn:
            json["matchesDrawn"] == null ? null : json["matchesDrawn"],
        noRes: json["noRes"] == null ? null : json["noRes"],
        points: json["points"],
        nrr: json["nrr"],
        teamFullName: teamFullNameValues.map![json["teamFullName"]],
        teamMatches: List<TeamMatch>.from(
            json["teamMatches"].map((x) => TeamMatch.fromJson(x))),
        form: List<Form>.from(json["form"].map((x) => formValues.map![x])),
        teamImageId: json["teamImageId"],
        matchesLost: json["matchesLost"] == null ? null : json["matchesLost"],
      );

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": nameValues.reverse[teamName],
        "matchesPlayed": matchesPlayed,
        "matchesWon": matchesWon,
        "matchesDrawn": matchesDrawn == null ? null : matchesDrawn,
        "noRes": noRes == null ? null : noRes,
        "points": points,
        "nrr": nrr,
        "teamFullName": teamFullNameValues.reverse[teamFullName],
        "teamMatches": List<dynamic>.from(teamMatches!.map((x) => x.toJson())),
        "form": List<dynamic>.from(form!.map((x) => formValues.reverse[x])),
        "teamImageId": teamImageId,
        "matchesLost": matchesLost == null ? null : matchesLost,
      };
}

enum Form { W, A, D, L }

final formValues =
    EnumValues({"A": Form.A, "D": Form.D, "L": Form.L, "W": Form.W});

enum TeamFullName {
  NORTHERN_KNIGHTS,
  OTAGO,
  CANTERBURY,
  WELLINGTON,
  CENTRAL_DISTRICTS,
  AUCKLAND
}

final teamFullNameValues = EnumValues({
  "Auckland": TeamFullName.AUCKLAND,
  "Canterbury": TeamFullName.CANTERBURY,
  "Central Districts": TeamFullName.CENTRAL_DISTRICTS,
  "Northern Knights": TeamFullName.NORTHERN_KNIGHTS,
  "Otago": TeamFullName.OTAGO,
  "Wellington": TeamFullName.WELLINGTON
});

class TeamMatch {
  TeamMatch({
    this.opponent,
    this.startdt,
    this.result,
    this.opponentSName,
    this.matchId,
    this.matchName,
    this.winner,
    this.opponentId,
    this.opponentImageId,
  });

  TeamFullName? opponent;
  String? startdt;
  String? result;
  Name? opponentSName;
  int? matchId;
  String? matchName;
  int? winner;
  int? opponentId;
  int? opponentImageId;

  factory TeamMatch.fromJson(Map<String, dynamic> json) => TeamMatch(
        opponent: teamFullNameValues.map![json["opponent"]],
        startdt: json["startdt"],
        result: json["result"],
        opponentSName: nameValues.map![json["opponentSName"]],
        matchId: json["matchId"],
        matchName: json["matchName"],
        winner: json["winner"] == null ? null : json["winner"],
        opponentId: json["opponentId"],
        opponentImageId: json["opponentImageId"],
      );

  Map<String, dynamic> toJson() => {
        "opponent": teamFullNameValues.reverse[opponent],
        "startdt": startdt,
        "result": result,
        "opponentSName": nameValues.reverse[opponentSName],
        "matchId": matchId,
        "matchName": matchName,
        "winner": winner == null ? null : winner,
        "opponentId": opponentId,
        "opponentImageId": opponentImageId,
      };
}

enum Name { NK, OTG, CNTBRY, WEL, CD, AKL }

final nameValues = EnumValues({
  "AKL": Name.AKL,
  "CD": Name.CD,
  "CNTBRY": Name.CNTBRY,
  "NK": Name.NK,
  "OTG": Name.OTG,
  "WEL": Name.WEL
});

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
