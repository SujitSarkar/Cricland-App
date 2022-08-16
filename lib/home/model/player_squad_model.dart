// To parse this JSON data, do
//
//     final playerSquadModel = playerSquadModelFromJson(jsonString);

import 'dart:convert';

PlayerSquadModel playerSquadModelFromJson(String str) =>
    PlayerSquadModel.fromJson(json.decode(str));

String playerSquadModelToJson(PlayerSquadModel data) =>
    json.encode(data.toJson());

class PlayerSquadModel {
  PlayerSquadModel({
    this.player,
  });

  List<Player>? player;

  factory PlayerSquadModel.fromJson(Map<String, dynamic> json) =>
      PlayerSquadModel(
        player:
            List<Player>.from(json["player"].map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "player": List<dynamic>.from(player!.map((x) => x.toJson())),
      };
}

class Player {
  Player({
    this.name,
    this.isHeader,
    this.id,
    this.role,
    this.imageId,
    this.battingStyle,
    this.bowlingStyle,
    this.captain,
  });

  String? name;
  bool? isHeader;
  String? id;
  String? role;
  int? imageId;
  BattingStyle? battingStyle;
  String? bowlingStyle;
  bool? captain;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        name: json["name"],
        isHeader: json["isHeader"],
        id: json["id"],
        role: json["role"],
        imageId: json["imageId"],
        battingStyle: json["battingStyle"] == null
            ? null
            : battingStyleValues.map![json["battingStyle"]],
        bowlingStyle: json["bowlingStyle"],
        captain: json["captain"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isHeader": isHeader,
        "id": id,
        "role": role,
        "imageId": imageId,
        "battingStyle": battingStyle == null
            ? null
            : battingStyleValues.reverse[battingStyle],
        "bowlingStyle": bowlingStyle,
        "captain": captain,
      };
}

enum BattingStyle { RIGHT_HAND_BAT, LEFT_HAND_BAT }

final battingStyleValues = EnumValues({
  "Left-hand bat": BattingStyle.LEFT_HAND_BAT,
  "Right-hand bat": BattingStyle.RIGHT_HAND_BAT
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
