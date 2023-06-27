class LiveResponseData {
  String leagueName;
  String leagueImage;
  String venueName;
  String venueImage;
  String round;
  String city;
  String startingAt;
  int localTeamId;
  int fixturesId;
  String localTeamName;
  String localTeamImage;
  int localTeamRun;
  dynamic localTeamOver;
  int localTeamWicket;
  String visitorTeamName;
  int visitorTeamId;
  String visitorTeamImage;
  int visitorTeamRun;
  dynamic visitorTeamOver;
  int visitorTeamWicket;
  String status;
  String live;
  String note;
  int battingTeamId;
  LiveResponseData({
    required this.leagueName,
    required this.leagueImage,
    required this.venueName,
    required this.venueImage,
    required this.round,
    required this.city,
    required this.startingAt,
    required this.localTeamId,
    required this.fixturesId,
    required this.localTeamName,
    required this.localTeamImage,
    required this.localTeamRun,
    required this.localTeamOver,
    required this.localTeamWicket,
    required this.visitorTeamId,
    required this.visitorTeamName,
    required this.visitorTeamImage,
    required this.visitorTeamOver,
    required this.visitorTeamRun,
    required this.visitorTeamWicket,
    required this.status,
    required this.live,
    required this.note,
    required this.battingTeamId,
  });
}

class FixturesResponseData {
  String leagueName;
  String leagueImage;

  String round;

  String startingAt;
  int localTeamId;
  int fixturesId;
  String localTeamName;
  String localTeamImage;
  int localTeamRun;
  dynamic localTeamOver;
  int localTeamWicket;
  String visitorTeamName;
  int visitorTeamId;
  String visitorTeamImage;
  int visitorTeamRun;
  dynamic visitorTeamOver;
  int visitorTeamWicket;
  String status;
  String live;
  String note;
  int battingTeamId;
  FixturesResponseData({
    required this.leagueName,
    required this.leagueImage,
    required this.round,
    required this.startingAt,
    required this.localTeamId,
    required this.fixturesId,
    required this.localTeamName,
    required this.localTeamImage,
    required this.localTeamRun,
    required this.localTeamOver,
    required this.localTeamWicket,
    required this.visitorTeamId,
    required this.visitorTeamName,
    required this.visitorTeamImage,
    required this.visitorTeamOver,
    required this.visitorTeamRun,
    required this.visitorTeamWicket,
    required this.status,
    required this.live,
    required this.note,
    required this.battingTeamId,
  });
}
