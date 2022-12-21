import 'dart:convert';

PlayerInfoModel playerInfoModelFromJson(String str) =>
    PlayerInfoModel.fromJson(json.decode(str));

class PlayerInfoModel {
  PlayerInfoModel({
    this.id,
    this.bat,
    this.bowl,
    this.name,
    this.nickName,
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

  final String? id;
  final String? bat;
  final String? bowl;
  final String? name;
  final String? nickName;
  final String? role;
  final String? birthPlace;
  final String? intlTeam;
  final String? teams;
  final String? doB;
  final String? image;
  final String? bio;
  final Rankings? rankings;
  final AppIndex? appIndex;
  final String? doBFormat;
  final String? faceImageId;

  factory PlayerInfoModel.fromJson(Map<String, dynamic> json) =>
      PlayerInfoModel(
        id: json["id"],
        bat: json["bat"],
        bowl: json["bowl"],
        name: json["name"],
        nickName: json["nickName"],
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
}

class AppIndex {
  AppIndex({
    this.seoTitle,
    this.webUrl,
  });

  final String? seoTitle;
  final String? webUrl;

  factory AppIndex.fromJson(Map<String, dynamic> json) => AppIndex(
        seoTitle: json["seoTitle"],
        webUrl: json["webURL"],
      );
}

class Rankings {
  Rankings({
    this.bat,
    this.bowl,
    this.all,
  });

  final List<All>? bat;
  final List<All>? bowl;
  final List<All>? all;

  factory Rankings.fromJson(Map<String, dynamic> json) => Rankings(
        bat: List<All>.from(json["bat"].map((x) => All.fromJson(x))),
        bowl: List<All>.from(json["bowl"].map((x) => All.fromJson(x))),
        all: List<All>.from(json["all"].map((x) => All.fromJson(x))),
      );
}

class All {
  All({
    this.testRank,
    this.odiRank,
    this.t20Rank,
    this.testBestRank,
    this.odiBestRank,
    this.t20BestRank,
    this.odiDiffRank,
  });

  final String? testRank;
  final String? odiRank;
  final String? t20Rank;
  final String? testBestRank;
  final String? odiBestRank;
  final String? t20BestRank;
  final String? odiDiffRank;

  factory All.fromJson(Map<String, dynamic> json) => All(
        testRank: json["testRank"],
        odiRank: json["odiRank"],
        t20Rank: json["t20Rank"],
        testBestRank: json["testBestRank"],
        odiBestRank: json["odiBestRank"],
        t20BestRank: json["t20BestRank"],
        odiDiffRank: json["odiDiffRank"],
      );
}
