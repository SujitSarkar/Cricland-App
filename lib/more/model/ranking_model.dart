import 'dart:convert';

List<RankingModel> rankingModelFromJson(String str) => List<RankingModel>.from(json.decode(str).map((x) => RankingModel.fromJson(x)));

String rankingModelToJson(List<RankingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RankingModel {
    RankingModel({
        this.id,
        this.rank,
        this.name,
        this.country,
        this.rating,
        this.points,
        this.lastUpdatedOn,
        this.trend,
        this.faceImageId,
    });

    final String? id;
    final String? rank;
    final String? name;
    final String? country;
    final String? rating;
    final String? points;
    final DateTime? lastUpdatedOn;
    final String? trend;
    final String? faceImageId;

    factory RankingModel.fromJson(Map<String, dynamic> json) => RankingModel(
        id: json["id"],
        rank: json["rank"],
        name: json["name"],
        country: json["country"],
        rating: json["rating"],
        points: json["points"],
        lastUpdatedOn: DateTime.parse(json["lastUpdatedOn"]),
        trend: json["trend"],
        faceImageId: json["faceImageId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "name": name,
        "country": country,
        "rating": rating,
        "points": points,
        "lastUpdatedOn": "${lastUpdatedOn!.year.toString().padLeft(4, '0')}-${lastUpdatedOn!.month.toString().padLeft(2, '0')}-${lastUpdatedOn!.day.toString().padLeft(2, '0')}",
        "trend": trend,
        "faceImageId": faceImageId,
    };
}
