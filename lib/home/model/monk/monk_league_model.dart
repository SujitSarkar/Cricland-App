// To parse this JSON data, do
//
//     final leagueUpdateModel = leagueUpdateModelFromJson(jsonString);

import 'dart:convert';

LeagueUpdateModel leagueUpdateModelFromJson(String str) => LeagueUpdateModel.fromJson(json.decode(str));

String leagueUpdateModelToJson(LeagueUpdateModel data) => json.encode(data.toJson());

class LeagueUpdateModel {
  LeagueUpdateModel({
    this.data,
  });

  Data? data;

  factory LeagueUpdateModel.fromJson(Map<String, dynamic> json) => LeagueUpdateModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.resource,
    this.id,
    this.seasonId,
    this.countryId,
    this.name,
    this.code,
    this.imagePath,
    this.type,
    this.updatedAt,
  });

  String? resource;
  int? id;
  int? seasonId;
  int? countryId;
  String? name;
  String? code;
  String? imagePath;
  String? type;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    resource: json["resource"],
    id: json["id"],
    seasonId: json["season_id"],
    countryId: json["country_id"],
    name: json["name"],
    code: json["code"],
    imagePath: json["image_path"],
    type: json["type"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "season_id": seasonId,
    "country_id": countryId,
    "name": name,
    "code": code,
    "image_path": imagePath,
    "type": type,
    "updated_at": updatedAt!.toIso8601String(),
  };
}
