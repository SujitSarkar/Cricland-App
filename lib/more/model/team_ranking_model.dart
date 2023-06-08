import 'dart:convert';

List<TeamRankingModel> teamRankingModelFromJson(String str) => List<TeamRankingModel>.from(json.decode(str).map((x) => TeamRankingModel.fromJson(x)));

class TeamRankingModel {
    final String? resource;
    final int? id;
    final String? name;
    final String? code;
    final String? imagePath;
    final int? countryId;
    final bool? nationalTeam;
    final int? position;
    final DateTime? updatedAt;
    final Ranking? ranking;

    TeamRankingModel({
        this.resource,
        this.id,
        this.name,
        this.code,
        this.imagePath,
        this.countryId,
        this.nationalTeam,
        this.position,
        this.updatedAt,
        this.ranking,
    });

    factory TeamRankingModel.fromJson(Map<String, dynamic> json) => TeamRankingModel(
        resource: json["resource"],
        id: json["id"],
        name: json["name"],
        code: json["code"],
        imagePath: json["image_path"],
        countryId: json["country_id"],
        nationalTeam: json["national_team"],
        position: json["position"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        ranking: json["ranking"] == null ? null : Ranking.fromJson(json["ranking"]),
    );
}

class Ranking {
    final int? position;
    final int? matches;
    final int? points;
    final int? rating;

    Ranking({
        this.position,
        this.matches,
        this.points,
        this.rating,
    });

    factory Ranking.fromJson(Map<String, dynamic> json) => Ranking(
        position: json["position"],
        matches: json["matches"],
        points: json["points"],
        rating: json["rating"],
    );
}
