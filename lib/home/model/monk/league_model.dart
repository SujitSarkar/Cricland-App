
class MonkLeagueModel{

  String? resource;
  String? name;
  String? code;
  String? image_path;
  String? type;
  String? updated_at;
  int? id;
  int? season_id;
  int? country_id;

  MonkLeagueModel({
    this .resource,
    this .name,
    this .code,
    this .image_path,
    this .type,
    this .updated_at,
    this .id,
    this .season_id,
    this .country_id,
});

  factory MonkLeagueModel.fromJson(Map<String,dynamic> json){
    return MonkLeagueModel(
        resource:json['resource'],
      name:json['name'],
      code:json['code'],
      image_path:json['image_path'],
      type:json['type'],
      updated_at:json['updated_at'],
      id:json['id'],
      season_id:json['season_id'],
      country_id:json['country_id'],

    );
  }
}