// To parse this JSON data, do
//
//     final langModel = langModelFromJson(jsonString);

import 'dart:convert';

LangModel langModelFromJson(String str) => LangModel.fromJson(json.decode(str));

String langModelToJson(LangModel data) => json.encode(data.toJson());

class LangModel {
  LangModel({
    this.home,
    this.news,
    this.ipl,
    this.more,
    this.settingsTitle,
    this.appLanguage,
    this.language,
    this.continueButton,
    this.close,
    this.notificationsSettings,
    this.matchSettings,
    this.themeChange,
    this.premium,
    this.visit,
    this.facebook,
    this.instagram,
    this.support,
    this.rateUs,
    this.checkForUpdate,
    this.problem,
    this.invite,
    this.about,
    this.aboutUs,
    this.terms,
    this.privacy,
  });

  String? home;
  String? news;
  String? ipl;
  String? more;
  String? settingsTitle;
  String? appLanguage;
  String? language;
  String? continueButton;
  String? close;
  String? notificationsSettings;
  String? matchSettings;
  String? themeChange;
  String? premium;
  String? visit;
  String? facebook;
  String? instagram;
  String? support;
  String? rateUs;
  String? checkForUpdate;
  String? problem;
  String? invite;
  String? about;
  String? aboutUs;
  String? terms;
  String? privacy;

  factory LangModel.fromJson(Map<String, dynamic> json) => LangModel(
        home: json["home"],
        news: json["news"],
        ipl: json["ipl"],
        more: json["more"],
        settingsTitle: json["settingsTitle"],
        appLanguage: json["appLanguage"],
        language: json["language"],
        continueButton: json["continueButton"],
        close: json["close"],
        notificationsSettings: json["notificationsSettings"],
        matchSettings: json["matchSettings"],
        themeChange: json["themeChange"],
        premium: json["premium"],
        visit: json["visit"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        support: json["support"],
        rateUs: json["rateUs"],
        checkForUpdate: json["checkForUpdate"],
        problem: json["problem"],
        invite: json["invite"],
        about: json["about"],
        aboutUs: json["aboutUs"],
        terms: json["terms"],
        privacy: json["privacy"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "news": news,
        "ipl": ipl,
        "more": more,
        "settingsTitle": settingsTitle,
        "appLanguage": appLanguage,
        "language": language,
        "continueButton": continueButton,
        "close": close,
        "notificationsSettings": notificationsSettings,
        "matchSettings": matchSettings,
        "themeChange": themeChange,
        "premium": premium,
        "visit": visit,
        "facebook": facebook,
        "instagram": instagram,
        "support": support,
        "rateUs": rateUs,
        "checkForUpdate": checkForUpdate,
        "problem": problem,
        "invite": invite,
        "about": about,
        "aboutUs": aboutUs,
        "terms": terms,
        "privacy": privacy,
      };
}
