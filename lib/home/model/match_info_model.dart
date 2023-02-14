

class RecentMatchInfoModel {
  RecentMatchInfoModel({
    this.matchInfo,
    this.venueInfo,
  });

  MatchInfoRapid? matchInfo;
  VenueInfoRapid? venueInfo;
}

class MatchInfoRapid {
  MatchInfoRapid({
    this.matchId,
    this.matchDescription,
    this.matchFormat,
    this.matchType,
    this.complete,
    this.domestic,
    this.state,
    this.team1,
    this.team2,
    this.umpire1,
    this.umpire2,
    this.umpire3,
    this.referee,
    this.status,
    this.playersOfTheMatch,
    // this.playersOfTheSeries,

  });

  int? matchId;
  String? matchDescription;
  String? matchFormat;
  String? matchType;
  bool? complete;
  bool? domestic;
  String? state;
  TeamRapid? team1;
  TeamRapid? team2;
  Referee? umpire1;
  Referee? umpire2;
  Referee? umpire3;
  Referee? referee;
  String? status;
  PlayerRapid? playersOfTheMatch;
  // List<PlayerRapid>? playersOfTheSeries;

}



class PlayerRapid {
  int? id;
  String? name;
  String? fullName;
  String? nickName;
  String? role;
  bool? captain;
  bool? keeper;
  bool? substitute;
  int? teamId;
  String? bowlingStyle;
  int? faceImageId;

  PlayerRapid({
    this.id,
    this.name,
    this.fullName,
    this.nickName,
    this.role,
    this.captain,
    this.keeper,
    this.substitute,
    this.teamId,
    this.bowlingStyle,
    this.faceImageId,
  });




}



class Referee {
  Referee({
    this.id,
    this.name,
    this.country,
  });
  int? id;
  String? name;
  String? country;
}



class TeamRapid {
  TeamRapid({
    this.id,
    this.name,
    this.playerDetails,
    this.shortName,
  });

  int? id;
  String? name;
  List<PlayerRapid>? playerDetails;
  String? shortName;
}



class VenueInfoRapid {
  String? knownAs;
  String? ends;
  String? city;
  String? country;
  String? homeTeam;
  String? curator;
  String? imageUrl;
  String? ground;


  VenueInfoRapid({
    this.knownAs,
    this.ends,
    this.city,
    this.country,
    this.homeTeam,
    this.curator,
    this.imageUrl,
    this.ground,
  });



}

