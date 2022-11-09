class ApiEndpoint {
  static const Map<String, String> header = {
    'X-RapidAPI-Key': '32611f2cdamsh520fe0c09fc6a72p1167d1jsn17370117b6c5',
    'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
  };

  static const String baseUrl = 'https://cricbuzz-cricket.p.rapidapi.com/';
  static const String version = 'v1';

  static const String rankings = 'stats/$version/rankings/';
  static const String playerInfo = 'stats/$version/player/';

  static String imageUrl(String imageId, {String? p = 'gthumb'}) =>
      '${ApiEndpoint.baseUrl}img/v1/i1/c$imageId/i.jpg?p=$p&d=low';
}