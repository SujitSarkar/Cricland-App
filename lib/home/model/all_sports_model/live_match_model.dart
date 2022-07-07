// // To parse this JSON data, do
// //
// //     final liveMatchModel = liveMatchModelFromJson(jsonString);
//
// import 'dart:convert';
//
// LiveMatchModel liveMatchModelFromJson(String str) =>
//     LiveMatchModel.fromJson(json.decode(str));
//
// String liveMatchModelToJson(LiveMatchModel data) => json.encode(data.toJson());
//
// class LiveMatchModel {
//   LiveMatchModel({
//     this.success,
//     this.result,
//   });
//
//   int? success;
//   List<Result>? result;
//
//   factory LiveMatchModel.fromJson(Map<String, dynamic> json) => LiveMatchModel(
//         success: json["success"],
//         result:
//             List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "result": List<dynamic>.from(result!.map((x) => x.toJson())),
//       };
// }
//
// class Result {
//   Result({
//     this.eventKey,
//     this.eventDateStart,
//     this.eventDateStop,
//     this.eventTime,
//     this.eventHomeTeam,
//     this.homeTeamKey,
//     this.eventAwayTeam,
//     this.awayTeamKey,
//     this.eventServiceHome,
//     this.eventServiceAway,
//     this.eventHomeFinalResult,
//     this.eventAwayFinalResult,
//     this.eventHomeRr,
//     this.eventAwayRr,
//     this.eventStatus,
//     this.eventStatusInfo,
//     this.leagueName,
//     this.leagueKey,
//     this.leagueRound,
//     this.leagueSeason,
//     this.eventLive,
//     this.eventType,
//     this.eventToss,
//     this.eventManOfMatch,
//     this.eventStadium,
//     this.eventHomeTeamLogo,
//     this.eventAwayTeamLogo,
//     this.scorecard,
//     this.comments,
//     this.wickets,
//     this.extra,
//     this.lineups,
//   });
//
//   String? eventKey;
//   DateTime? eventDateStart;
//   DateTime? eventDateStop;
//   String? eventTime;
//   String? eventHomeTeam;
//   String? homeTeamKey;
//   String? eventAwayTeam;
//   String? awayTeamKey;
//   String? eventServiceHome;
//   String? eventServiceAway;
//   String? eventHomeFinalResult;
//   String? eventAwayFinalResult;
//   dynamic eventHomeRr;
//   dynamic eventAwayRr;
//   String? eventStatus;
//   String? eventStatusInfo;
//   String? leagueName;
//   String? leagueKey;
//   String? leagueRound;
//   String? leagueSeason;
//   String? eventLive;
//   String? eventType;
//   String? eventToss;
//   String? eventManOfMatch;
//   String? eventStadium;
//   dynamic eventHomeTeamLogo;
//   dynamic eventAwayTeamLogo;
//   Scorecard? scorecard;
//   Comments? comments;
//   Wickets? wickets;
//   Extra? extra;
//   Lineups? lineups;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         eventKey: json["event_key"],
//         eventDateStart: DateTime.parse(json["event_date_start"]),
//         eventDateStop: DateTime.parse(json["event_date_stop"]),
//         eventTime: json["event_time"],
//         eventHomeTeam: json["event_home_team"],
//         homeTeamKey: json["home_team_key"],
//         eventAwayTeam: json["event_away_team"],
//         awayTeamKey: json["away_team_key"],
//         eventServiceHome: json["event_service_home"],
//         eventServiceAway: json["event_service_away"],
//         eventHomeFinalResult: json["event_home_final_result"],
//         eventAwayFinalResult: json["event_away_final_result"],
//         eventHomeRr: json["event_home_rr"],
//         eventAwayRr: json["event_away_rr"],
//         eventStatus: json["event_status"],
//         eventStatusInfo: json["event_status_info"],
//         leagueName: json["league_name"],
//         leagueKey: json["league_key"],
//         leagueRound: json["league_round"],
//         leagueSeason: json["league_season"],
//         eventLive: json["event_live"],
//         eventType: json["event_type"],
//         eventToss: json["event_toss"],
//         eventManOfMatch: json["event_man_of_match"],
//         eventStadium: json["event_stadium"],
//         eventHomeTeamLogo: json["event_home_team_logo"] == null
//             ? null
//             : json["event_home_team_logo"],
//         eventAwayTeamLogo: json["event_away_team_logo"],
//         scorecard: Scorecard.fromJson(json["scorecard"]),
//         comments: Comments.fromJson(json["comments"]),
//         wickets: Wickets.fromJson(json["wickets"]),
//         extra: Extra.fromJson(json["extra"]),
//         lineups: Lineups.fromJson(json["lineups"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "event_key": eventKey,
//         "event_date_start":
//             "${eventDateStart!.year.toString().padLeft(4, '0')}-${eventDateStart!.month.toString().padLeft(2, '0')}-${eventDateStart!.day.toString().padLeft(2, '0')}",
//         "event_date_stop":
//             "${eventDateStop!.year.toString().padLeft(4, '0')}-${eventDateStop!.month.toString().padLeft(2, '0')}-${eventDateStop!.day.toString().padLeft(2, '0')}",
//         "event_time": eventTime,
//         "event_home_team": eventHomeTeam,
//         "home_team_key": homeTeamKey,
//         "event_away_team": eventAwayTeam,
//         "away_team_key": awayTeamKey,
//         "event_service_home": eventServiceHome,
//         "event_service_away": eventServiceAway,
//         "event_home_final_result": eventHomeFinalResult,
//         "event_away_final_result": eventAwayFinalResult,
//         "event_home_rr": eventHomeRr,
//         "event_away_rr": eventAwayRr,
//         "event_status": eventStatus,
//         "event_status_info": eventStatusInfo,
//         "league_name": leagueName,
//         "league_key": leagueKey,
//         "league_round": leagueRound,
//         "league_season": leagueSeason,
//         "event_live": eventLive,
//         "event_type": eventType,
//         "event_toss": eventToss,
//         "event_man_of_match": eventManOfMatch,
//         "event_stadium": eventStadium,
//         "event_home_team_logo":
//             eventHomeTeamLogo == null ? null : eventHomeTeamLogo,
//         "event_away_team_logo": eventAwayTeamLogo,
//         "scorecard": scorecard!.toJson(),
//         "comments": comments!.toJson(),
//         "wickets": wickets!.toJson(),
//         "extra": extra!.toJson(),
//         "lineups": lineups!.toJson(),
//       };
// }
//
// class Comments {
//   Comments({
//     this.live,
//     this.munsterReds2Inn,
//     this.leinsterLightning1Inn,
//     this.glamorgan2Inn,
//     this.surrey1Inn,
//     this.lancashire1Inn,
//     this.india1Inn,
//   });
//
//   List<Live>? live;
//   List<Live>? munsterReds2Inn;
//   List<Live>? leinsterLightning1Inn;
//   List<Live>? glamorgan2Inn;
//   List<Live>? surrey1Inn;
//   List<Live>? lancashire1Inn;
//   List<Live>? india1Inn;
//
//   factory Comments.fromJson(Map<String, dynamic> json) => Comments(
//         live: List<Live>.from(json["Live"].map((x) => Live.fromJson(x))),
//         munsterReds2Inn: json["Munster Reds 2 INN"] == null
//             ? null
//             : List<Live>.from(
//                 json["Munster Reds 2 INN"].map((x) => Live.fromJson(x))),
//         leinsterLightning1Inn: json["Leinster Lightning 1 INN"] == null
//             ? null
//             : List<Live>.from(
//                 json["Leinster Lightning 1 INN"].map((x) => Live.fromJson(x))),
//         glamorgan2Inn: json["Glamorgan 2 INN"] == null
//             ? null
//             : List<Live>.from(
//                 json["Glamorgan 2 INN"].map((x) => Live.fromJson(x))),
//         surrey1Inn: json["Surrey 1 INN"] == null
//             ? null
//             : List<Live>.from(
//                 json["Surrey 1 INN"].map((x) => Live.fromJson(x))),
//         lancashire1Inn: json["Lancashire 1 INN"] == null
//             ? null
//             : List<Live>.from(
//                 json["Lancashire 1 INN"].map((x) => Live.fromJson(x))),
//         india1Inn: json["India 1 INN"] == null
//             ? null
//             : List<Live>.from(json["India 1 INN"].map((x) => Live.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Live": List<dynamic>.from(live!.map((x) => x.toJson())),
//         "Munster Reds 2 INN": munsterReds2Inn == null
//             ? null
//             : List<dynamic>.from(munsterReds2Inn!.map((x) => x.toJson())),
//         "Leinster Lightning 1 INN": leinsterLightning1Inn == null
//             ? null
//             : List<dynamic>.from(leinsterLightning1Inn!.map((x) => x.toJson())),
//         "Glamorgan 2 INN": glamorgan2Inn == null
//             ? null
//             : List<dynamic>.from(glamorgan2Inn!.map((x) => x.toJson())),
//         "Surrey 1 INN": surrey1Inn == null
//             ? null
//             : List<dynamic>.from(surrey1Inn!.map((x) => x.toJson())),
//         "Lancashire 1 INN": lancashire1Inn == null
//             ? null
//             : List<dynamic>.from(lancashire1Inn!.map((x) => x.toJson())),
//         "India 1 INN": india1Inn == null
//             ? null
//             : List<dynamic>.from(india1Inn!.map((x) => x.toJson())),
//       };
// }
//
// class Live {
//   Live({
//     this.innings,
//     this.balls,
//     this.overs,
//     this.ended,
//     this.runs,
//     this.post,
//   });
//
//   Innings? innings;
//   String? balls;
//   String? overs;
//   Ended? ended;
//   String? runs;
//   String? post;
//
//   factory Live.fromJson(Map<String, dynamic> json) => Live(
//         innings: inningsValues.map[json["innings"]],
//         balls: json["balls"],
//         overs: json["overs"],
//         ended: endedValues.map[json["ended"]],
//         runs: json["runs"],
//         post: json["post"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "innings": inningsValues.reverse[innings],
//         "balls": balls,
//         "overs": overs,
//         "ended": endedValues.reverse[ended],
//         "runs": runs,
//         "post": post,
//       };
// }
//
// enum Ended { NO, YES }
//
// final endedValues = EnumValues({"No": Ended.NO, "Yes": Ended.YES});
//
// enum Innings {
//   GLAMORGAN_2_INN,
//   INDIA_1_INN,
//   LANCASHIRE_1_INN,
//   LEINSTER_LIGHTNING_1_INN,
//   LIVE,
//   MUNSTER_REDS_2_INN,
//   SURREY_1_INN
// }
//
// final inningsValues = EnumValues({
//   "Glamorgan 2 INN": Innings.GLAMORGAN_2_INN,
//   "India 1 INN": Innings.INDIA_1_INN,
//   "Lancashire 1 INN": Innings.LANCASHIRE_1_INN,
//   "Leinster Lightning 1 INN": Innings.LEINSTER_LIGHTNING_1_INN,
//   "Live": Innings.LIVE,
//   "Munster Reds 2 INN": Innings.MUNSTER_REDS_2_INN,
//   "Surrey 1 INN": Innings.SURREY_1_INN
// });
//
// class Extra {
//   Extra({
//     this.leinsterLightning1Inn,
//     this.munsterReds2Inn,
//     this.surrey1Inn,
//     this.glamorgan2Inn,
//     this.lancashire1Inn,
//     this.india1Inn,
//   });
//
//   ExtraGlamorgan2Inn? leinsterLightning1Inn;
//   ExtraGlamorgan2Inn? munsterReds2Inn;
//   ExtraGlamorgan2Inn? surrey1Inn;
//   ExtraGlamorgan2Inn? glamorgan2Inn;
//   ExtraGlamorgan2Inn? lancashire1Inn;
//   ExtraGlamorgan2Inn? india1Inn;
//
//   factory Extra.fromJson(Map<String, dynamic> json) => Extra(
//         leinsterLightning1Inn: json["Leinster Lightning 1 INN"] == null
//             ? null
//             : ExtraGlamorgan2Inn.fromJson(json["Leinster Lightning 1 INN"]),
//         munsterReds2Inn: json["Munster Reds 2 INN"] == null
//             ? null
//             : ExtraGlamorgan2Inn.fromJson(json["Munster Reds 2 INN"]),
//         surrey1Inn: json["Surrey 1 INN"] == null
//             ? null
//             : ExtraGlamorgan2Inn.fromJson(json["Surrey 1 INN"]),
//         glamorgan2Inn: json["Glamorgan 2 INN"] == null
//             ? null
//             : ExtraGlamorgan2Inn.fromJson(json["Glamorgan 2 INN"]),
//         lancashire1Inn: json["Lancashire 1 INN"] == null
//             ? null
//             : ExtraGlamorgan2Inn.fromJson(json["Lancashire 1 INN"]),
//         india1Inn: json["India 1 INN"] == null
//             ? null
//             : ExtraGlamorgan2Inn.fromJson(json["India 1 INN"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Leinster Lightning 1 INN": leinsterLightning1Inn == null
//             ? null
//             : leinsterLightning1Inn!.toJson(),
//         "Munster Reds 2 INN":
//             munsterReds2Inn == null ? null : munsterReds2Inn!.toJson(),
//         "Surrey 1 INN": surrey1Inn == null ? null : surrey1Inn!.toJson(),
//         "Glamorgan 2 INN":
//             glamorgan2Inn == null ? null : glamorgan2Inn!.toJson(),
//         "Lancashire 1 INN":
//             lancashire1Inn == null ? null : lancashire1Inn!.toJson(),
//         "India 1 INN": india1Inn == null ? null : india1Inn!.toJson(),
//       };
// }
//
// class ExtraGlamorgan2Inn {
//   ExtraGlamorgan2Inn({
//     this.innings,
//     this.nr,
//     this.text,
//     this.totalOvers,
//     this.total,
//     this.percentOver,
//   });
//
//   Innings? innings;
//   String? nr;
//   String? text;
//   dynamic totalOvers;
//   String? total;
//   dynamic percentOver;
//
//   factory ExtraGlamorgan2Inn.fromJson(Map<String, dynamic> json) =>
//       ExtraGlamorgan2Inn(
//         innings: inningsValues.map[json["innings"]],
//         nr: json["nr"],
//         text: json["text"],
//         totalOvers: json["total_overs"],
//         total: json["total"],
//         percentOver: json["percent_over"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "innings": inningsValues.reverse[innings],
//         "nr": nr,
//         "text": text,
//         "total_overs": totalOvers,
//         "total": total,
//         "percent_over": percentOver,
//       };
// }
//
// class Lineups {
//   Lineups({
//     this.homeTeam,
//     this.awayTeam,
//   });
//
//   Team? homeTeam;
//   Team? awayTeam;
//
//   factory Lineups.fromJson(Map<String, dynamic> json) => Lineups(
//         homeTeam: Team.fromJson(json["home_team"]),
//         awayTeam: Team.fromJson(json["away_team"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "home_team": homeTeam!.toJson(),
//         "away_team": awayTeam!.toJson(),
//       };
// }
//
// class Team {
//   Team({
//     this.startingLineups,
//   });
//
//   List<StartingLineup>? startingLineups;
//
//   factory Team.fromJson(Map<String, dynamic> json) => Team(
//         startingLineups: List<StartingLineup>.from(
//             json["starting_lineups"].map((x) => StartingLineup.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "starting_lineups":
//             List<dynamic>.from(startingLineups!.map((x) => x.toJson())),
//       };
// }
//
// class StartingLineup {
//   StartingLineup({
//     this.player,
//     this.playerCountry,
//   });
//
//   String? player;
//   String? playerCountry;
//
//   factory StartingLineup.fromJson(Map<String, dynamic> json) => StartingLineup(
//         player: json["player"],
//         playerCountry: json["player_country"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "player": player,
//         "player_country": playerCountry,
//       };
// }
//
// class Scorecard {
//   Scorecard({
//     this.leinsterLightning1Inn,
//     this.munsterReds2Inn,
//     this.surrey1Inn,
//     this.glamorgan2Inn,
//     this.lancashire1Inn,
//     this.india1Inn,
//   });
//
//   List<Glamorgan2InnElement>? leinsterLightning1Inn;
//   List<Glamorgan2InnElement>? munsterReds2Inn;
//   List<Glamorgan2InnElement>? surrey1Inn;
//   List<Glamorgan2InnElement>? glamorgan2Inn;
//   List<Glamorgan2InnElement>? lancashire1Inn;
//   List<Glamorgan2InnElement>? india1Inn;
//
//   factory Scorecard.fromJson(Map<String, dynamic> json) => Scorecard(
//         leinsterLightning1Inn: json["Leinster Lightning 1 INN"] == null
//             ? null
//             : List<Glamorgan2InnElement>.from(json["Leinster Lightning 1 INN"]
//                 .map((x) => Glamorgan2InnElement.fromJson(x))),
//         munsterReds2Inn: json["Munster Reds 2 INN"] == null
//             ? null
//             : List<Glamorgan2InnElement>.from(json["Munster Reds 2 INN"]
//                 .map((x) => Glamorgan2InnElement.fromJson(x))),
//         surrey1Inn: json["Surrey 1 INN"] == null
//             ? null
//             : List<Glamorgan2InnElement>.from(json["Surrey 1 INN"]
//                 .map((x) => Glamorgan2InnElement.fromJson(x))),
//         glamorgan2Inn: json["Glamorgan 2 INN"] == null
//             ? null
//             : List<Glamorgan2InnElement>.from(json["Glamorgan 2 INN"]
//                 .map((x) => Glamorgan2InnElement.fromJson(x))),
//         lancashire1Inn: json["Lancashire 1 INN"] == null
//             ? null
//             : List<Glamorgan2InnElement>.from(json["Lancashire 1 INN"]
//                 .map((x) => Glamorgan2InnElement.fromJson(x))),
//         india1Inn: json["India 1 INN"] == null
//             ? null
//             : List<Glamorgan2InnElement>.from(json["India 1 INN"]
//                 .map((x) => Glamorgan2InnElement.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Leinster Lightning 1 INN": leinsterLightning1Inn == null
//             ? null
//             : List<dynamic>.from(leinsterLightning1Inn!.map((x) => x.toJson())),
//         "Munster Reds 2 INN": munsterReds2Inn == null
//             ? null
//             : List<dynamic>.from(munsterReds2Inn!.map((x) => x.toJson())),
//         "Surrey 1 INN": surrey1Inn == null
//             ? null
//             : List<dynamic>.from(surrey1Inn!.map((x) => x.toJson())),
//         "Glamorgan 2 INN": glamorgan2Inn == null
//             ? null
//             : List<dynamic>.from(glamorgan2Inn!.map((x) => x.toJson())),
//         "Lancashire 1 INN": lancashire1Inn == null
//             ? null
//             : List<dynamic>.from(lancashire1Inn!.map((x) => x.toJson())),
//         "India 1 INN": india1Inn == null
//             ? null
//             : List<dynamic>.from(india1Inn!.map((x) => x.toJson())),
//       };
// }
//
// class Glamorgan2InnElement {
//   Glamorgan2InnElement({
//     this.innings,
//     this.player,
//     this.type,
//     this.status,
//     this.r,
//     this.b,
//     this.min,
//     this.the4S,
//     this.the6S,
//     this.o,
//     this.m,
//     this.w,
//     this.sr,
//     this.er,
//   });
//
//   Innings? innings;
//   String? player;
//   Type? type;
//   String? status;
//   String? r;
//   String? b;
//   String? min;
//   String? the4S;
//   String? the6S;
//   String? o;
//   String? m;
//   String? w;
//   String? sr;
//   String? er;
//
//   factory Glamorgan2InnElement.fromJson(Map<String, dynamic> json) =>
//       Glamorgan2InnElement(
//         innings: inningsValues.map[json["innings"]],
//         player: json["player"],
//         type: typeValues.map[json["type"]],
//         status: json["status"],
//         r: json["R"],
//         b: json["B"] == null ? null : json["B"],
//         min: json["Min"] == null ? null : json["Min"],
//         the4S: json["4s"] == null ? null : json["4s"],
//         the6S: json["6s"] == null ? null : json["6s"],
//         o: json["O"] == null ? null : json["O"],
//         m: json["M"] == null ? null : json["M"],
//         w: json["W"] == null ? null : json["W"],
//         sr: json["SR"] == null ? null : json["SR"],
//         er: json["ER"] == null ? null : json["ER"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "innings": inningsValues.reverse[innings],
//         "player": player,
//         "type": typeValues.reverse[type],
//         "status": status,
//         "R": r,
//         "B": b,
//         "Min": min,
//         "4s": the4S,
//         "6s": the6S,
//         "O": o,
//         "M": m,
//         "W": w,
//         "SR": sr,
//         "ER": er,
//       };
// }
//
// enum Type { BATSMAN, BOWLER }
//
// final typeValues = EnumValues({"Batsman": Type.BATSMAN, "Bowler": Type.BOWLER});
//
// class Wickets {
//   Wickets({
//     this.munsterReds2Inn,
//     this.leinsterLightning1Inn,
//     this.surrey1Inn,
//     this.lancashire1Inn,
//     this.india1Inn,
//   });
//
//   List<WicketsIndia1Inn>? munsterReds2Inn;
//   List<WicketsIndia1Inn>? leinsterLightning1Inn;
//   List<WicketsIndia1Inn>? surrey1Inn;
//   List<WicketsIndia1Inn>? lancashire1Inn;
//   List<WicketsIndia1Inn>? india1Inn;
//
//   factory Wickets.fromJson(Map<String, dynamic> json) => Wickets(
//         munsterReds2Inn: json["Munster Reds 2 INN"] == null
//             ? null
//             : List<WicketsIndia1Inn>.from(json["Munster Reds 2 INN"]
//                 .map((x) => WicketsIndia1Inn.fromJson(x))),
//         leinsterLightning1Inn: json["Leinster Lightning 1 INN"] == null
//             ? null
//             : List<WicketsIndia1Inn>.from(json["Leinster Lightning 1 INN"]
//                 .map((x) => WicketsIndia1Inn.fromJson(x))),
//         surrey1Inn: json["Surrey 1 INN"] == null
//             ? null
//             : List<WicketsIndia1Inn>.from(
//                 json["Surrey 1 INN"].map((x) => WicketsIndia1Inn.fromJson(x))),
//         lancashire1Inn: json["Lancashire 1 INN"] == null
//             ? null
//             : List<WicketsIndia1Inn>.from(json["Lancashire 1 INN"]
//                 .map((x) => WicketsIndia1Inn.fromJson(x))),
//         india1Inn: json["India 1 INN"] == null
//             ? null
//             : List<WicketsIndia1Inn>.from(
//                 json["India 1 INN"].map((x) => WicketsIndia1Inn.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Munster Reds 2 INN": munsterReds2Inn == null
//             ? null
//             : List<dynamic>.from(munsterReds2Inn!.map((x) => x.toJson())),
//         "Leinster Lightning 1 INN": leinsterLightning1Inn == null
//             ? null
//             : List<dynamic>.from(leinsterLightning1Inn!.map((x) => x.toJson())),
//         "Surrey 1 INN": surrey1Inn == null
//             ? null
//             : List<dynamic>.from(surrey1Inn!.map((x) => x.toJson())),
//         "Lancashire 1 INN": lancashire1Inn == null
//             ? null
//             : List<dynamic>.from(lancashire1Inn!.map((x) => x.toJson())),
//         "India 1 INN": india1Inn == null
//             ? null
//             : List<dynamic>.from(india1Inn!.map((x) => x.toJson())),
//       };
// }
//
// class WicketsIndia1Inn {
//   WicketsIndia1Inn({
//     this.innings,
//     this.fall,
//     this.balwer,
//     this.batsman,
//     this.score,
//   });
//
//   Innings? innings;
//   String? fall;
//   String? balwer;
//   String? batsman;
//   String? score;
//
//   factory WicketsIndia1Inn.fromJson(Map<String, dynamic> json) =>
//       WicketsIndia1Inn(
//         innings: inningsValues.map[json["innings"]],
//         fall: json["fall"],
//         balwer: json["balwer"],
//         batsman: json["batsman"],
//         score: json["score"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "innings": inningsValues.reverse[innings],
//         "fall": fall,
//         "balwer": balwer,
//         "batsman": batsman,
//         "score": score,
//       };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap ??= map.map((k, v) => MapEntry(v, k));
//     return reverseMap!;
//   }
// }
