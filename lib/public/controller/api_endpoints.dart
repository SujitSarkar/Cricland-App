class ApiEndpoints {
  static const String baseURL = 'https://cricbuzz-cricket.p.rapidapi.com/';
  static const String apiVersion = "v1";
  static String recentMatchData = baseURL + 'matches/$apiVersion/recent';
  static String scoreCardData = baseURL + 'mcenter/v1/';
  static String seriesMatchListData = baseURL + 'series/v1/';
  static String seriesPointTableData = baseURL + 'stats/v1/series/';
  static String commentariesData = baseURL + 'mcenter/v1/';
  static String squadsData = baseURL + 'series/v1/';
  static String playerSquadsData = baseURL + 'series/v1/';
  static String playerInfoData = baseURL + 'stats/v1/player/';
  static String upComingMatchData = baseURL + 'matches/$apiVersion/upcoming';
  static String fixturesMatchDayData = baseURL + 'schedule/$apiVersion/all';
  static String fixturesMatchSeriesData =
      baseURL + 'series/$apiVersion/international';
  static String fixturesMatchTeamData =
      baseURL + 'teams/$apiVersion/international';
  static String featureSeriesData =
      baseURL + 'series/$apiVersion/international';
  static String matchesInfo = baseURL + 'mcenter/$apiVersion/';
  static String liveMatches = baseURL + 'matches/$apiVersion/live';
  static String overSummery = baseURL + 'mcenter/$apiVersion/';
  static String teamForm = baseURL + 'teams/$apiVersion/';

  //For Image  https://cricbuzz-cricket.p.rapidapi.com/teams/v1/
  static const String imageMidPoint = baseURL + "img/$apiVersion/i1/c";
  static const String imageLastPoint = "/i.jpg";
  static const Map<String, String> headers = <String, String>{
    'X-RapidAPI-Key': '4950c64b5fmshaf05e7428ce6853p19fcb1jsn3b317fc1ddab',
    'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com',
  };

  //MonkAPI
  static const String monkAPIToken =
      'api_token=whV5CAja8D4mnJSmuXSb9QU0rfqTuDEQtopV1VXUNp58VQqGlxTNoaKyaLmI';

  static const String monkApiVersion = "api/v2.0/";
  static const String monkBaseURL =
      'https://cricket.sportmonks.com/' + monkApiVersion;
  static String monkLiveMatches = "${monkBaseURL}livescores";
  static String monkLeague = monkBaseURL + 'leagues/';
  static String monkVanue = monkBaseURL + 'venues/';
  static String monkTeams = '${monkBaseURL}teams/';
  static String monkScore = '${monkBaseURL}fixtures/';
}
// https://cricket.sportmonks.com/api/v2.0/fixtures/47507?include=runs
