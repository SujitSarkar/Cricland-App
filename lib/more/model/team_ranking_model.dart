import 'dart:convert';

List<TeamRankingModel> teamRankingModelFromJson(String str) => List<TeamRankingModel>.from(json.decode(str).map((x) => TeamRankingModel.fromJson(x)));

String teamRankingModelToJson(List<TeamRankingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamRankingModel {
    TeamRankingModel({
        this.id,
        this.rank,
        this.name,
        this.rating,
        this.matches,
        this.points,
        this.lastUpdatedOn,
        this.imageId,
    });

    final String? id;
    final String? rank;
    final String? name;
    final String? rating;
    final String? matches;
    final String? points;
    final DateTime? lastUpdatedOn;
    final String? imageId;

    factory TeamRankingModel.fromJson(Map<String, dynamic> json) => TeamRankingModel(
        id: json["id"],
        rank: json["rank"],
        name: json["name"],
        rating: json["rating"],
        matches: json["matches"],
        points: json["points"],
        lastUpdatedOn: DateTime.parse(json["lastUpdatedOn"]),
        imageId: json["imageId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "name": name,
        "rating": rating,
        "matches": matches,
        "points": points,
        "lastUpdatedOn": "${lastUpdatedOn!.year.toString().padLeft(4, '0')}-${lastUpdatedOn!.month.toString().padLeft(2, '0')}-${lastUpdatedOn!.day.toString().padLeft(2, '0')}",
        "imageId": imageId,
    };
}
