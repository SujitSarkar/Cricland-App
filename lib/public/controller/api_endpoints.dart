class ApiEndpoints {
  static String baseURL = 'https://cricbuzz-cricket.p.rapidapi.com/';
  static const String apiVersion = "v1";
  static String recentMatchData = 'matches/$apiVersion/recent';
  static String upComingMatchData = 'matches/$apiVersion/upcoming';
  static String fixturesMatchDayData = 'schedule/$apiVersion/all';
  static String fixturesMatchSeriesData = 'series/$apiVersion/international';
  static String fixturesMatchTeamData = 'teams/$apiVersion/international';
  static String featureSeriesData = 'series/$apiVersion/international';
  static String matchesInfo = 'mcenter/$apiVersion/';
  static String liveMatches = 'matches/$apiVersion/live';

  static const String imageMidPoint = "img/$apiVersion/i1/c";
  static const String imageLastPoint = "/i.jpg";
}
