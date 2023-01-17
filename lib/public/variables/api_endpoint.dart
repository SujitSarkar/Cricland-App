class ApiEndpoint {
  static const Map<String, String> header = {
    'X-RapidAPI-Key': 'e0f55ded3cmsha1be58abe55a686p1a02f2jsn56d8f078493f',
    'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
  };

  static const String baseUrl = 'https://cricbuzz-cricket.p.rapidapi.com/';
  static const String version = 'v1';

  static const String rankings = 'stats/$version/rankings/';
  static const String playerInfo = 'stats/$version/player/';

  static String imageUrl(String imageId, {String? p = 'gthumb'}) =>
      '${ApiEndpoint.baseUrl}img/v1/i1/c$imageId/i.jpg?p=$p&d=low';
}
