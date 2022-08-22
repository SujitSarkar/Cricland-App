class ApiEndpoints {
  static const String baseURL = 'https://cricbuzz-cricket.p.rapidapi.com/';
  static const String apiVersion = "v1";
  static String recentMatchData = 'matches/$apiVersion/recent';
  static String scoreCardData = 'mcenter/v1/';
  static String seriesMatchListData = 'series/v1/';
  static String seriesPointTableData = 'stats/v1/series/';
  static String commentariesData = 'mcenter/v1/';
  static String squadsData = 'series/v1/';
  static String playerSquadsData = 'series/v1/';
  static String playerInfoData = 'stats/v1/player/';
  static String upComingMatchData = 'matches/$apiVersion/upcoming';
  static String fixturesMatchDayData = 'schedule/$apiVersion/all';
  static String fixturesMatchSeriesData = 'series/$apiVersion/international';
  static String fixturesMatchTeamData = 'teams/$apiVersion/international';
  static String featureSeriesData = 'series/$apiVersion/international';
  static String matchesInfo = 'mcenter/$apiVersion/';
  static String liveMatches = 'matches/$apiVersion/live';

  //For Image
  static const String imageMidPoint = baseURL + "img/$apiVersion/i1/c";
  static const String imageLastPoint = "/i.jpg";
  static const Map<String, String> headers = <String, String>{
    'X-RapidAPI-Key': '2589067106msh2631899972a518bp121677jsn8394db5148ef',
    'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com',
  };
}
