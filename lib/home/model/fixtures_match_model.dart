// To parse this JSON data, do
//
//     final fixturesMatchModel = fixturesMatchModelFromJson(jsonString);

import 'dart:convert';

FixturesMatchModel fixturesMatchModelFromJson(String str) =>
    FixturesMatchModel.fromJson(json.decode(str));

String fixturesMatchModelToJson(FixturesMatchModel data) =>
    json.encode(data.toJson());

class FixturesMatchModel {
  FixturesMatchModel({
    this.matchScheduleMap,
    this.appIndex,
  });

  List<MatchScheduleMap>? matchScheduleMap;
  AppIndex? appIndex;

  factory FixturesMatchModel.fromJson(Map<String, dynamic> json) =>
      FixturesMatchModel(
        matchScheduleMap: List<MatchScheduleMap>.from(
            json["matchScheduleMap"].map((x) => MatchScheduleMap.fromJson(x))),
        appIndex: AppIndex.fromJson(json["appIndex"]),
      );

  Map<String, dynamic> toJson() => {
        "matchScheduleMap":
            List<dynamic>.from(matchScheduleMap!.map((x) => x.toJson())),
        "appIndex": appIndex!.toJson(),
      };
}

class AppIndex {
  AppIndex({
    this.seoTitle,
    this.webUrl
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

class MatchScheduleMap {
  MatchScheduleMap({
    this.scheduleAdWrapper,
    this.adDetail,
  });

  ScheduleAdWrapper? scheduleAdWrapper;
  AdDetail? adDetail;

  factory MatchScheduleMap.fromJson(Map<String, dynamic> json) =>
      MatchScheduleMap(
        scheduleAdWrapper: json["scheduleAdWrapper"] == null
            ? null
            : ScheduleAdWrapper.fromJson(json["scheduleAdWrapper"]),
        adDetail: json["adDetail"] == null
            ? null
            : AdDetail.fromJson(json["adDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "scheduleAdWrapper":
            scheduleAdWrapper == null ? null : scheduleAdWrapper!.toJson(),
        "adDetail": adDetail == null ? null : adDetail!.toJson(),
      };
}

class AdDetail {
  AdDetail({
    this.name,
    this.layout,
    this.position,
  });

  String? name;
  String? layout;
  int? position;

  factory AdDetail.fromJson(Map<String, dynamic> json) => AdDetail(
        name: json["name"],
        layout: json["layout"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "layout": layout,
        "position": position,
      };
}

class ScheduleAdWrapper {
  ScheduleAdWrapper({
    this.date,
    this.matchScheduleList,
    this.longDate,
  });

  String? date;
  List<MatchScheduleList>? matchScheduleList;
  String? longDate;

  factory ScheduleAdWrapper.fromJson(Map<String, dynamic> json) =>
      ScheduleAdWrapper(
        date: json["date"],
        matchScheduleList: List<MatchScheduleList>.from(
            json["matchScheduleList"]
                .map((x) => MatchScheduleList.fromJson(x))),
        longDate: json["longDate"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "matchScheduleList":
            List<dynamic>.from(matchScheduleList!.map((x) => x.toJson())),
        "longDate": longDate,
      };
}

class MatchScheduleList {
  MatchScheduleList({
    this.seriesName,
    this.matchInfo,
    this.seriesId,
    this.seriesHomeCountry,
    this.seriesCategory,
  });

  String? seriesName;
  List<MatchInfo>? matchInfo;
  int? seriesId;
  int? seriesHomeCountry;
  SeriesCategory? seriesCategory;

  factory MatchScheduleList.fromJson(Map<String, dynamic> json) =>
      MatchScheduleList(
        seriesName: json["seriesName"],
        matchInfo: List<MatchInfo>.from(
            json["matchInfo"].map((x) => MatchInfo.fromJson(x))),
        seriesId: json["seriesId"],
        seriesHomeCountry: json["seriesHomeCountry"],
        seriesCategory: seriesCategoryValues.map[json["seriesCategory"]],
      );

  Map<String, dynamic> toJson() => {
        "seriesName": seriesName,
        "matchInfo": List<dynamic>.from(matchInfo!.map((x) => x.toJson())),
        "seriesId": seriesId,
        "seriesHomeCountry": seriesHomeCountry,
        "seriesCategory": seriesCategoryValues.reverse[seriesCategory],
      };
}

class MatchInfo {
  MatchInfo({
    this.matchId,
    this.seriesId,
    this.matchDesc,
    this.matchFormat,
    this.startDate,
    this.endDate,
    this.team1,
    this.team2,
    this.venueInfo,
  });

  int? matchId;
  int? seriesId;
  String? matchDesc;
  MatchFormat? matchFormat;
  String? startDate;
  String? endDate;
  Team? team1;
  Team? team2;
  VenueInfo? venueInfo;

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        seriesId: json["seriesId"],
        matchDesc: json["matchDesc"],
        matchFormat: matchFormatValues.map[json["matchFormat"]],
        startDate: json["startDate"],
        endDate: json["endDate"],
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        venueInfo: VenueInfo.fromJson(json["venueInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "seriesId": seriesId,
        "matchDesc": matchDesc,
        "matchFormat": matchFormatValues.reverse[matchFormat],
        "startDate": startDate,
        "endDate": endDate,
        "team1": team1!.toJson(),
        "team2": team2!.toJson(),
        "venueInfo": venueInfo!.toJson(),
      };
}

enum MatchFormat { ODI, T20, TEST }

final matchFormatValues = EnumValues(
    {"ODI": MatchFormat.ODI, "T20": MatchFormat.T20, "TEST": MatchFormat.TEST});

class Team {
  Team({
    this.teamId,
    this.teamName,
    this.teamSName,
    this.isFullMember,
    this.imageId,
  });

  int? teamId;
  String? teamName;
  String? teamSName;
  bool? isFullMember;
  int? imageId;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["teamId"],
        teamName: json["teamName"],
        teamSName: json["teamSName"],
        isFullMember:
            json["isFullMember"] == null ? null : json["isFullMember"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamSName": teamSName,
        "isFullMember": isFullMember == null ? null : isFullMember,
        "imageId": imageId,
      };
}

class VenueInfo {
  VenueInfo({
    this.ground,
    this.city,
    this.country,
    this.timezone,
  });

  String? ground;
  String? city;
  Country? country;
  Timezone? timezone;

  factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
        ground: json["ground"],
        city: json["city"],
        country: countryValues.map[json["country"]],
        timezone: timezoneValues.map[json["timezone"]],
      );

  Map<String, dynamic> toJson() => {
        "ground": ground,
        "city": city,
        "country": countryValues.reverse[country],
        "timezone": timezoneValues.reverse[timezone],
      };
}

enum Country {
  WEST_INDIES,
  INDIA,
  SRI_LANKA,
  ENGLAND,
  FINLAND,
  SCOTLAND,
  WALES
}

final countryValues = EnumValues({
  "England": Country.ENGLAND,
  "Finland": Country.FINLAND,
  "India": Country.INDIA,
  "Scotland": Country.SCOTLAND,
  "Sri Lanka": Country.SRI_LANKA,
  "Wales": Country.WALES,
  "West Indies": Country.WEST_INDIES
});

enum Timezone { THE_0400, THE_0530, THE_0100, THE_0300 }

final timezoneValues = EnumValues({
  "+01:00": Timezone.THE_0100,
  "+03:00": Timezone.THE_0300,
  "-04:00": Timezone.THE_0400,
  "+05:30": Timezone.THE_0530
});

enum SeriesCategory { INTERNATIONAL, LEAGUE, DOMESTIC, WOMEN }

final seriesCategoryValues = EnumValues({
  "Domestic": SeriesCategory.DOMESTIC,
  "International": SeriesCategory.INTERNATIONAL,
  "League": SeriesCategory.LEAGUE,
  "Women": SeriesCategory.WOMEN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
