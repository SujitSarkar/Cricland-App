import 'package:flutter/material.dart';

class RapidRecentMatchModel{
  List<RapidTypeMatch>? typeMatches;
  RapidRecentMatchModel({
    this.typeMatches,
  });
}

class RapidTypeMatch {
  String? matchType;
  List<RapidSeriesMatch>? seriesMatches;


  RapidTypeMatch({
    this.matchType,
    this.seriesMatches,
  });


}

class RapidSeriesMatch {
  RapidSeriesAdWrapper? seriesAdWrapper;
  RapidSeriesMatch({
    this.seriesAdWrapper,
  });
}

class RapidSeriesAdWrapper {
  int? seriesId;
  String? seriesName;
  List<RapidMatch>? matches;

  RapidSeriesAdWrapper({
    this.seriesId,
    this.seriesName,
    this.matches,
  });



}

class  RapidMatch {
  RapidMatch({
    this.matchInfo,
    this.matchScore,
  });

  RapidMatchInfo? matchInfo;
  RapidMatchScore? matchScore;

}

class  RapidMatchInfo {
  int? matchId;
  int? seriesId;
  String? seriesName;
  String? matchDesc;
  String? startDate;
  String? endDate;
  String? state;
  String? status;
  RapidTeam? team1;
  RapidTeam? team2;
  RapidVenueInfo? venueInfo;
  int? currBatTeamId;
  String? seriesStartDt;
  String? seriesEndDt;
  bool? isTimeAnnounced;
  String? stateTitle;

  RapidMatchInfo({
    this.matchId,
    this.seriesId,
    this.seriesName,
    this.matchDesc,

    this.startDate,
    this.endDate,
    this.state,
    this.status,
    this.team1,
    this.team2,
    this.venueInfo,
    this.currBatTeamId,
    this.seriesStartDt,
    this.seriesEndDt,
    this.isTimeAnnounced,
    this.stateTitle,
  });
}
class RapidTeam {
  int? teamId;
  String? teamName;
  String? teamSName;
  int? imageId;
  RapidTeam({
    this.teamId,
    this.teamName,
    this.teamSName,
    this.imageId,
  });


}

class RapidVenueInfo {
  int? id;
  String? ground;
  String? city;
  RapidVenueInfo({
    this.id,
    this.ground,
    this.city,
  });
}





class RapidMatchScore {
  RapidTeamScore? team1Score;
  RapidTeamScore? team2Score;


  RapidMatchScore({
    this.team1Score,
    this.team2Score,
  });


}

class RapidTeamScore {
  RapidInngs? inngs1;
  RapidInngs? inngs2;

  RapidTeamScore({
    this.inngs1,
    this.inngs2,
  });



}

class RapidInngs {
  int? inningsId;
  int? runs;
  int? wickets;
  double? overs;
  bool? isDeclared;
  bool? isFollowOn;
  RapidInngs({
    this.inningsId,
    this.runs,
    this.wickets,
    this.overs,
    this.isDeclared,
    this.isFollowOn,
  });




}


