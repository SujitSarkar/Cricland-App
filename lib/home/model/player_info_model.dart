// To parse this JSON data, do
//
//     final playerInfoModel = playerInfoModelFromJson(jsonString);

import 'dart:convert';

PlayerInfoModel playerInfoModelFromJson(String str) =>
    PlayerInfoModel.fromJson(json.decode(str));

String playerInfoModelToJson(PlayerInfoModel data) =>
    json.encode(data.toJson());

class PlayerInfoModel {
  PlayerInfoModel({
    this.id,
    this.bat,
    this.bowl,
    this.name,
    this.nickName,
    this.height,
    this.role,
    this.birthPlace,
    this.intlTeam,
    this.teams,
    this.doB,
    this.image,
    this.bio,
    this.rankings,
    this.appIndex,
    this.doBFormat,
    this.faceImageId,
  });

  String? id;
  String? bat;
  String? bowl;
  String? name;
  String? nickName;
  String? height;
  String? role;
  String? birthPlace;
  String? intlTeam;
  String? teams;
  String? doB;
  String? image;
  String? bio;
  Rankings? rankings;
  AppIndex? appIndex;
  String? doBFormat;
  String? faceImageId;

  factory PlayerInfoModel.fromJson(Map<String, dynamic> json) =>
      PlayerInfoModel(
        id: json["id"],
        bat: json["bat"],
        bowl: json["bowl"],
        name: json["name"],
        nickName: json["nickName"],
        height: json["height"],
        role: json["role"],
        birthPlace: json["birthPlace"],
        intlTeam: json["intlTeam"],
        teams: json["teams"],
        doB: json["DoB"],
        image: json["image"],
        bio: json["bio"],
        rankings: Rankings.fromJson(json["rankings"]),
        appIndex: AppIndex.fromJson(json["appIndex"]),
        doBFormat: json["DoBFormat"],
        faceImageId: json["faceImageId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bat": bat,
        "bowl": bowl,
        "name": name,
        "nickName": nickName,
        "height": height,
        "role": role,
        "birthPlace": birthPlace,
        "intlTeam": intlTeam,
        "teams": teams,
        "DoB": doB,
        "image": image,
        "bio": bio,
        "rankings": rankings!.toJson(),
        "appIndex": appIndex!.toJson(),
        "DoBFormat": doBFormat,
        "faceImageId": faceImageId,
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

class Rankings {
  Rankings({
    this.bat,
    this.bowl,
    this.all,
  });

  List<Bat>? bat;
  List<Bowl>? bowl;
  List<All>? all;

  factory Rankings.fromJson(Map<String, dynamic> json) => Rankings(
        bat: List<Bat>.from(json["bat"].map((x) => Bat.fromJson(x))),
        bowl: List<Bowl>.from(json["bowl"].map((x) => Bowl.fromJson(x))),
        all: List<All>.from(json["all"].map((x) => All.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bat": List<dynamic>.from(bat!.map((x) => x.toJson())),
        "bowl": List<dynamic>.from(bowl!.map((x) => x.toJson())),
        "all": List<dynamic>.from(all!.map((x) => x.toJson())),
      };
}

class All {
  All();

  factory All.fromJson(Map<String, dynamic> json) => All();

  Map<String, dynamic> toJson() => {};
}

class Bat {
  Bat({
    this.testRank,
    this.testBestRank,
    this.odiBestRank,
    this.t20BestRank,
    this.testDiffRank,
  });

  String? testRank;
  String? testBestRank;
  String? odiBestRank;
  String? t20BestRank;
  String? testDiffRank;

  factory Bat.fromJson(Map<String, dynamic> json) => Bat(
        testRank: json["testRank"],
        testBestRank: json["testBestRank"],
        odiBestRank: json["odiBestRank"],
        t20BestRank: json["t20BestRank"],
        testDiffRank: json["testDiffRank"],
      );

  Map<String, dynamic> toJson() => {
        "testRank": testRank,
        "testBestRank": testBestRank,
        "odiBestRank": odiBestRank,
        "t20BestRank": t20BestRank,
        "testDiffRank": testDiffRank,
      };
}

class Bowl {
  Bowl({
    this.testBestRank,
    this.odiBestRank,
    this.t20BestRank,
  });

  String? testBestRank;
  String? odiBestRank;
  String? t20BestRank;

  factory Bowl.fromJson(Map<String, dynamic> json) => Bowl(
        testBestRank: json["testBestRank"],
        odiBestRank: json["odiBestRank"],
        t20BestRank: json["t20BestRank"],
      );

  Map<String, dynamic> toJson() => {
        "testBestRank": testBestRank,
        "odiBestRank": odiBestRank,
        "t20BestRank": t20BestRank,
      };
}
