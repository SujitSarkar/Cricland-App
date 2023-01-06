// To parse this JSON data, do
//
//     final monkVanueModel = monkVanueModelFromJson(jsonString);

import 'dart:convert';

MonkVanueModel monkVanueModelFromJson(String str) => MonkVanueModel.fromJson(json.decode(str));

String monkVanueModelToJson(MonkVanueModel data) => json.encode(data.toJson());

class MonkVanueModel {
  MonkVanueModel({
    this.data,
  });

  Data? data;

  factory MonkVanueModel.fromJson(Map<String, dynamic> json) => MonkVanueModel(
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
    this.countryId,
    this.name,
    this.city,
    this.imagePath,
    this.capacity,
    this.floodlight,
    this.updatedAt,
  });

  String? resource;
  int? id;
  int? countryId;
  String? name;
  String? city;
  String? imagePath;
  int? capacity;
  bool? floodlight;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    resource: json["resource"],
    id: json["id"],
    countryId: json["country_id"],
    name: json["name"],
    city: json["city"],
    imagePath: json["image_path"],
    capacity: json["capacity"],
    floodlight: json["floodlight"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "country_id": countryId,
    "name": name,
    "city": city,
    "image_path": imagePath,
    "capacity": capacity,
    "floodlight": floodlight,
    "updated_at": updatedAt!.toIso8601String(),
  };
}
