class MonkLive {
  int? id;
  int? league_id;
  String? round;
  int? localteam_id;
  int? visitorteam_id;
  String? starting_at;
  String? type;
  bool? live;
  String? status;
  String? note;
  int? venue_id;
  int? toss_won_team_id;
  int? winner_team_id;
  String? draw_noresult;
  int? total_overs_played;
  Score? localteam_dl_data;
  Score? visitorteam_dl_data;

  MonkLive({
    this.id,
    this.league_id,
    this.round,
    this.localteam_id,
    this.visitorteam_id,
    this.starting_at,
    this.type,
    this.live,
    this.status,
    this.note,
    this.venue_id,
    this.toss_won_team_id,
    this.winner_team_id,
    this.draw_noresult,
    this.total_overs_played,
    this.localteam_dl_data,
    this.visitorteam_dl_data,
  });
}

class Score {
  String? score;
  String? overs;
  String? wickets_out;

  Score({
    this.score,
    this.overs,
    this.wickets_out,
  });
}
