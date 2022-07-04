import 'package:flutter/material.dart';

class AVLColors {
  static const Color primaryColor = Color(0xFF001B42);
  static const Color secondaryColor = Color(0xFF949292);
  //static const Color dropDownColor = Color(0xFFD4D6DC);
  static Color dropDownColor = Colors.grey.shade100;
  static const Color facebookButtonColor = Color(0xFF3B5998);
  static const Color googleButtonColor = Color(0xFF4285F4);
  static const Color white = Colors.white;
}

class AVLTextStyle {
  static const TextStyle avlHeader = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: "Roboto",
    fontSize: 13,
    color: AVLColors.primaryColor,
  );

  static const TextStyle avlSubHeader = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    fontFamily: "Roboto",
    color: AVLColors.secondaryColor,
  );

  static const TextStyle avlBodytext = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    fontFamily: "Roboto",
    color: AVLColors.secondaryColor,
  );

  static const TextStyle testFormLettering = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    fontFamily: "Roboto",
    color: AVLColors.secondaryColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    fontFamily: "Roboto",
    color: Colors.white,
  );
}

const Icon backButton = Icon(
  Icons.arrow_back_ios,
  color: Colors.black,
  size: 20,
);
const Icon menuButton = Icon(
  Icons.menu_outlined,
  color: Colors.black,
  size: 20,
);

class API {
  static const String baseUrl = "https://cricbuzz-cricket.p.rapidapi.com/";
  static const String baseUrlAllSports = "https://apiv2.allsportsapi.com/";
  static const String allSportsLiveMatch = "cricket/?met=Livescore&APIkey=";
  static const String apiKey =
      "4ce57c1616dc9228ccc6324cb7ea958dc04e8cdf8fa0728a47b5f134b00aa067";
  static const String apiVersion = "v1/";
  static const String getMatches = baseUrl + "matches/" + apiVersion + "recent";
  // static const String postRegister = baseUrl + "/auth/api/v1/user/create";
  // static const String postEmailValidator =
  //     baseUrl + "/api/v1/user/verification-code/validate";
  // static const String getAllLocations =
  //     "${API.baseUrl}/booking-service/api/$apiVersion/location/get-all-locations/";
  //
  // static const String postAvailableLaunch =
  //     "${API.baseUrl}/booking-service/api/$apiVersion/trip/get-trip-by-location/";
}
