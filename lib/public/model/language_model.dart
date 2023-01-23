// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'dart:convert';

LanguageModel languageModelFromJson(String str) =>
    LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  LanguageModel({
    this.profile,
    this.ipl,
    this.match,
    this.trending,
    this.more,
    this.iccMenRanking,
    this.iccWomenRanking,
    this.cricland,
    this.facebook,
    this.youtube,
    this.instagram,
    this.appLanguage,
    this.changeTheme,
    this.notifications,
    this.rateUs,
    this.followUs,
    this.feedback,
    this.shareApp,
    this.termsOfUse,
    this.privacyPolicy,
    this.logout,
    this.login,
    this.english,
    this.bangla,
    this.hindi,
    this.close,
    this.settings,
    this.settingAppearence,
    this.languageModelContinue,
    this.premium,
    this.version,
    this.about,
    this.language,
    this.light,
    this.dark,
    this.changeThemeTitle,
    this.manCategoryList,
    this.manGameType,
    this.playerRankingTableHeader,
    this.teamRankingTableHeader,
    this.playerDetails,
    this.submit,
    this.provideAllData,
    this.success,
    this.failed,
    this.emailOrPhone,
    this.email,
    this.name,
  });

  final String? profile;
  final String? ipl;
  final String? match;
  final String? trending;
  final String? more;
  final String? iccMenRanking;
  final String? iccWomenRanking;
  final String? cricland;
  final String? facebook;
  final String? youtube;
  final String? instagram;
  final String? appLanguage;
  final String? changeTheme;
  final String? notifications;
  final String? rateUs;
  final String? followUs;
  final String? feedback;
  final String? shareApp;
  final String? termsOfUse;
  final String? privacyPolicy;
  final String? logout;
  final String? login;
  final String? english;
  final String? bangla;
  final String? hindi;
  final String? close;
  final String? settings;
  final String? settingAppearence;
  final String? languageModelContinue;
  final String? premium;
  final String? version;
  final String? about;
  final String? language;
  final String? light;
  final String? dark;
  final String? changeThemeTitle;
  final List<String>? manCategoryList;
  final List<String>? manGameType;
  final List<String>? playerRankingTableHeader;
  final List<String>? teamRankingTableHeader;
  final List<String>? playerDetails;
  final String? submit;
  final String? provideAllData;
  final String? success;
  final String? failed;
  final String? emailOrPhone;
  final String? email;
  final String? name;

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        profile: json["profile"],
        ipl: json["ipl"],
        match: json["match"],
        trending: json["trending"],
        more: json["more"],
        iccMenRanking: json["icc_men_ranking"],
        iccWomenRanking: json["icc_women_ranking"],
        cricland: json["cricland"],
        facebook: json["facebook"],
        youtube: json["youtube"],
        instagram: json["instagram"],
        appLanguage: json["app_language"],
        changeTheme: json["change_theme"],
        notifications: json["notifications"],
        rateUs: json["rate_us"],
        followUs: json["follow_us"],
        feedback: json["feedback"],
        shareApp: json["share_app"],
        termsOfUse: json["terms_of_use"],
        privacyPolicy: json["privacy_policy"],
        logout: json["logout"],
        login: json["login"],
        english: json["english"],
        bangla: json["bangla"],
        hindi: json["hindi"],
        close: json["close"],
        settings: json["settings"],
        settingAppearence: json["setting_appearence"],
        languageModelContinue: json["continue"],
        premium: json["premium"],
        version: json["version"],
        about: json["about"],
        language: json["language"],
        light: json["light"],
        dark: json["dark"],
        changeThemeTitle: json["change_theme_title"],
        manCategoryList: json["manCategoryList"] == null
            ? []
            : List<String>.from(json["manCategoryList"]!.map((x) => x)),
        manGameType: json["manGameType"] == null
            ? []
            : List<String>.from(json["manGameType"]!.map((x) => x)),
        playerRankingTableHeader: json["player_ranking_table_header"] == null
            ? []
            : List<String>.from(
                json["player_ranking_table_header"]!.map((x) => x)),
        teamRankingTableHeader: json["team_ranking_table_header"] == null
            ? []
            : List<String>.from(
                json["team_ranking_table_header"]!.map((x) => x)),
        playerDetails: json["playerDetails"] == null
            ? []
            : List<String>.from(json["playerDetails"]!.map((x) => x)),
        submit: json["submit"],
        provideAllData: json["provide_all_data"],
        success: json["success"],
        failed: json["failed"],
        emailOrPhone: json["email_or_phone"],
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile,
        "ipl": ipl,
        "match": match,
        "trending": trending,
        "more": more,
        "icc_men_ranking": iccMenRanking,
        "icc_women_ranking": iccWomenRanking,
        "cricland": cricland,
        "facebook": facebook,
        "youtube": youtube,
        "instagram": instagram,
        "app_language": appLanguage,
        "change_theme": changeTheme,
        "notifications": notifications,
        "rate_us": rateUs,
        "follow_us": followUs,
        "feedback": feedback,
        "share_app": shareApp,
        "terms_of_use": termsOfUse,
        "privacy_policy": privacyPolicy,
        "logout": logout,
        "login": login,
        "english": english,
        "bangla": bangla,
        "hindi": hindi,
        "close": close,
        "settings": settings,
        "setting_appearence": settingAppearence,
        "continue": languageModelContinue,
        "premium": premium,
        "version": version,
        "about": about,
        "language": language,
        "light": light,
        "dark": dark,
        "change_theme_title": changeThemeTitle,
        "manCategoryList": manCategoryList == null
            ? []
            : List<dynamic>.from(manCategoryList!.map((x) => x)),
        "manGameType": manGameType == null
            ? []
            : List<dynamic>.from(manGameType!.map((x) => x)),
        "player_ranking_table_header": playerRankingTableHeader == null
            ? []
            : List<dynamic>.from(playerRankingTableHeader!.map((x) => x)),
        "team_ranking_table_header": teamRankingTableHeader == null
            ? []
            : List<dynamic>.from(teamRankingTableHeader!.map((x) => x)),
        "playerDetails": playerDetails == null
            ? []
            : List<dynamic>.from(playerDetails!.map((x) => x)),
        "submit": submit,
        "provide_all_data": provideAllData,
        "success": success,
        "failed": failed,
        "email_or_phone": emailOrPhone,
        "email": email,
        "name": name,
      };
}
