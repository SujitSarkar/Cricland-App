// To parse this JSON data, do
//
//     final featureSeriesModel = featureSeriesModelFromJson(jsonString);

import 'dart:convert';

FeatureSeriesModel featureSeriesModelFromJson(String str) =>
    FeatureSeriesModel.fromJson(json.decode(str));

String featureSeriesModelToJson(FeatureSeriesModel data) =>
    json.encode(data.toJson());

class FeatureSeriesModel {
  FeatureSeriesModel({
    this.seriesMapProto,
    this.appIndex,
  });

  List<SeriesMapProto>? seriesMapProto;
  AppIndex? appIndex;

  factory FeatureSeriesModel.fromJson(Map<String, dynamic> json) =>
      FeatureSeriesModel(
        seriesMapProto: List<SeriesMapProto>.from(
            json["seriesMapProto"].map((x) => SeriesMapProto.fromJson(x))),
        appIndex: AppIndex.fromJson(json["appIndex"]),
      );

  Map<String, dynamic> toJson() => {
        "seriesMapProto":
            List<dynamic>.from(seriesMapProto!.map((x) => x.toJson())),
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

class SeriesMapProto {
  SeriesMapProto({
    this.date,
    this.series,
  });

  String? date;
  List<Series>? series;

  factory SeriesMapProto.fromJson(Map<String, dynamic> json) => SeriesMapProto(
        date: json["date"],
        series:
            List<Series>.from(json["series"].map((x) => Series.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "series": List<dynamic>.from(series!.map((x) => x.toJson())),
      };
}

class Series {
  Series({
    this.id,
    this.name,
    this.startDt,
    this.endDt,
  });

  int? id;
  String? name;
  String? startDt;
  String? endDt;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        id: json["id"],
        name: json["name"],
        startDt: json["startDt"],
        endDt: json["endDt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startDt": startDt,
        "endDt": endDt,
      };
}
