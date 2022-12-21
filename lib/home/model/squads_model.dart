// To parse this JSON data, do
//
//     final matchSquadModel = matchSquadModelFromJson(jsonString);

import 'dart:convert';

MatchSquadModel matchSquadModelFromJson(String str) =>
    MatchSquadModel.fromJson(json.decode(str));

String matchSquadModelToJson(MatchSquadModel data) =>
    json.encode(data.toJson());

class MatchSquadModel {
  MatchSquadModel({
    this.squads,
    this.appIndex,
    this.seriesName,
    this.seriesId,
  });

  List<Squad>? squads;
  AppIndex? appIndex;
  String? seriesName;
  int? seriesId;

  factory MatchSquadModel.fromJson(Map<String, dynamic> json) =>
      MatchSquadModel(
        squads: List<Squad>.from(json["squads"].map((x) => Squad.fromJson(x))),
        appIndex: AppIndex.fromJson(json["appIndex"]),
        seriesName: json["seriesName"],
        seriesId: json["seriesId"],
      );

  Map<String, dynamic> toJson() => {
        "squads": List<dynamic>.from(squads!.map((x) => x.toJson())),
        "appIndex": appIndex!.toJson(),
        "seriesName": seriesName,
        "seriesId": seriesId,
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

class Squad {
  Squad({
    this.squadType,
    this.isHeader,
    this.squadId,
    this.imageId,
    this.teamId,
  });

  String? squadType;
  bool? isHeader;
  int? squadId;
  int? imageId;
  int? teamId;

  factory Squad.fromJson(Map<String, dynamic> json) => Squad(
        squadType: json["squadType"],
        isHeader: json["isHeader"],
        squadId: json["squadId"],
        imageId: json["imageId"],
        teamId: json["teamId"],
      );

  Map<String, dynamic> toJson() => {
        "squadType": squadType,
        "isHeader": isHeader,
        "squadId": squadId,
        "imageId": imageId,
        "teamId": teamId,
      };
}
