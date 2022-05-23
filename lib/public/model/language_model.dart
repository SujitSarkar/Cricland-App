import 'dart:convert';

LangModel langModelFromJson(String str) => LangModel.fromJson(json.decode(str));

class LangModel {
  LangModel({
    this.home,
    this.news,
    this.ipl,
    this.more,
  });

  final String? home;
  final String? news;
  final String? ipl;
  final String? more;

  factory LangModel.fromJson(Map<String?, dynamic> json) => LangModel(
    home: json["home"],
    news: json["news"],
    ipl: json["ipl"],
    more: json["more"],
  );
}
