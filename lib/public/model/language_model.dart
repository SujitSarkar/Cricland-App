// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'dart:convert';

LanguageModel languageModelFromJson(String str) => LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel? data) => json.encode(data!.toJson());

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
    };
}
