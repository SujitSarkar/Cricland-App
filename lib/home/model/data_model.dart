// enum PinStatus {
//   newPin,
//   confirmPin,
//   unlockPin,
// }
//
// // Confirmation Screen Function Needs to Be Initialized on that Screen
// enum ConfirmationButtonFunc {
//   setNewPin,
//   continueToDashboard,
//   backToLogin,
// }
//
// enum FeatureStatus {
//   mobileTopUp,
//   dataTopUp,
//   billPayment,
//   giftCard,
//   evsVoucher,
// }
//
// enum MessageModelStatus {
//   successful,
//   warning,
//   error,
// }

class MatchDataModel {
  int id;
  String name;

  MatchDataModel({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return name;
  }
}

class ReceiptModel {
  String transactionId;
  String dateTime;
  String beneficiary;
  String category;
  String operatorName;
  String amount;
  String cost;
  String storeName;
  String storeAddress;
  String storeCountry;

  ReceiptModel({
    required this.transactionId,
    required this.dateTime,
    required this.beneficiary,
    required this.category,
    required this.operatorName,
    required this.amount,
    required this.cost,
    required this.storeName,
    required this.storeAddress,
    required this.storeCountry,
  });
}

class TeamModel {
  int teamId;
  String teamName;
  String teamSName;
  int imageId;
  TeamModel({
    required this.teamId,
    required this.teamName,
    required this.teamSName,
    required this.imageId,
  });
}

class VenueInfoModel {
  int id;
  String ground;
  String city;
  String timezone;
  VenueInfoModel({
    required this.id,
    required this.ground,
    required this.city,
    required this.timezone,
  });
}

class MatchInfoModel {
  int matchId;
  int seriesId;
  String seriesName;
  String matchDesc;
  String matchFormat;
  String startDate;
  String endDate;
  String state;
  String status;
  TeamModel teamOneModel;
  TeamModel teamTwoModel;
  VenueInfoModel venueInfoModel;
  int currBatTeamId;
  String seriesStartDt;
  String seriesEndDt;
  bool isTimeAnnounced;
  String stateTitle;

  MatchInfoModel({
    required this.matchId,
    required this.seriesId,
    required this.seriesName,
    required this.matchDesc,
    required this.matchFormat,
    required this.startDate,
    required this.endDate,
    required this.state,
    required this.status,
    required this.teamOneModel,
    required this.teamTwoModel,
    required this.venueInfoModel,
    required this.currBatTeamId,
    required this.seriesStartDt,
    required this.seriesEndDt,
    required this.isTimeAnnounced,
    required this.stateTitle,
  });
}

class InningsModel {
  int inningsId;
  int runs;
  int wickets;
  double overs;
  InningsModel({
    required this.inningsId,
    required this.runs,
    required this.wickets,
    required this.overs,
  });
}

class TeamScoreModel {
  InningsModel inningsModel;
  TeamScoreModel({
    required this.inningsModel,
  });
}

class MatchScoreModel {
  TeamScoreModel teamOneScoreModel;
  TeamScoreModel teamTwoScoreModel;
  MatchScoreModel({
    required this.teamOneScoreModel,
    required this.teamTwoScoreModel,
  });
}

class MatchModel {
  MatchInfoModel matchInfoModel;
  // MatchDataModel matchDataModel;
  MatchScoreModel matchScoreModel;
  MatchModel({
    required this.matchInfoModel,
    required this.matchScoreModel,
  });
}

class SeriesAdWrapperModel {
  int seriesId;
  String seriesName;
  List<MatchModel> matchModel;

  SeriesAdWrapperModel({
    required this.seriesId,
    required this.seriesName,
    required this.matchModel,
  });
}

class SeriesMatchesModel {
  List<SeriesAdWrapperModel> seriesAdWrapperModel;
  SeriesMatchesModel({
    required this.seriesAdWrapperModel,
  });
}

class TypeMatchesModel {
  String matchType;
  List<SeriesMatchesModel> seriesMatchesModel;
  TypeMatchesModel({
    required this.matchType,
    required this.seriesMatchesModel,
  });
}

class FiltersModel {
  List<String> matchType;
  FiltersModel({
    required this.matchType,
  });
}

class AppIndexModel {
  String seoTitle;
  String webURL;
  AppIndexModel({
    required this.seoTitle,
    required this.webURL,
  });
}

class MatchesModel {
  List<TypeMatchesModel> typeMatchesModel;
  FiltersModel filtersModel;
  AppIndexModel appIndexModel;
  String responseLastUpdated;
  MatchesModel({
    required this.typeMatchesModel,
    required this.filtersModel,
    required this.appIndexModel,
    required this.responseLastUpdated,
  });
}
