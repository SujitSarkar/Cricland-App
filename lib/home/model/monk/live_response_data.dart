class LiveResponseData {
  String leagueName;
  String leagueImage;
  String venueName;
  String venueImage;
  String round;
  String city;

  String localTeamName;
  String localTeamImage;
  int localTeamRun;
  dynamic localTeamOver;
  int localTeamWicket;
  String visitorTeamName;
  String visitorTeamImage;
  int visitorTeamRun;
  dynamic visitorTeamOver;
  int visitorTeamWicket;
  String status;
  String live;
  String note;
  LiveResponseData({
    required this.leagueName,
    required this.leagueImage,
    required this.venueName,
    required this.venueImage,
    required this.round,
    required this.city,
    required this.localTeamName,
    required this.localTeamImage,
    required this.localTeamRun,
    required this.localTeamOver,
    required this.localTeamWicket,
    required this.visitorTeamName,
    required this.visitorTeamImage,
    required this.visitorTeamOver,
    required this.visitorTeamRun,
    required this.visitorTeamWicket,
    required this.status,
    required this.live,
    required this.note,
  });
}
