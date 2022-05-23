import 'dart:convert';

LanguageModel languageModelFromJson(String str) => LanguageModel.fromJson(json.decode(str));

class LanguageModel {
  LanguageModel({
    this.home,
    this.news,
    this.ipl,
    this.more,
  });

  final String? home;
  final String? news;
  final String? ipl;
  final String? more;

  factory LanguageModel.fromJson(Map<String?, dynamic> json) => LanguageModel(
    home: json["home"],
    news: json["news"],
    ipl: json["ipl"],
    more: json["more"],
  );
}
