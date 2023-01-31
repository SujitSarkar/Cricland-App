import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricland/home/model/commentaries_model.dart';
import 'package:cricland/home/model/feature_series_model.dart';
import 'package:cricland/home/model/fixtures_match_model.dart';
import 'package:cricland/home/model/match_info_model.dart';
import 'package:cricland/home/model/monk/monk_live_model.dart';
import 'package:cricland/home/model/over_summery_model.dart';
import 'package:cricland/home/model/point_table_model.dart';
import 'package:cricland/home/model/recent_match_model.dart';

import 'package:cricland/home/model/series_match_list_model.dart';
import 'package:cricland/home/model/squads_model.dart';
import 'package:cricland/home/model/upcoming_match_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/api_service.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../public/model/usermodel.dart';
import '../../public/variables/variable.dart';

import '../model/monk/monk_league_model.dart';
import '../model/monk/monk_team_model.dart';

import '../model/monk/monk_vanue_model.dart';
import '../model/player_info_model.dart';
import '../model/player_squad_model.dart';
import '../model/score_card_model.dart';

class HomeController extends GetxController {
  // late MatchesModel matchesModel;
//  late LiveMatchesModel liveMatchesModel;

 // late MonkLeagueModel monkLeague;
  late RecentMatchModel recentMatchModel;
  late UpcomingMatchModel upcomingMatchModel;
  late FixturesMatchModel fixturesMatchModel;
  late FeatureSeriesModel featureSeriesModel;
  late ScoreCardModel scoreCardModel;
  late PointTableModel pointTableModel;
  late CommentariesModel commentariesModel;
  late SeriesMatchListModel seriesMatchListModel;
  late RecentMatchInfoModel matcheInfoModel;
  late MatchSquadModel matchSquadModel;
  late PlayerInfoModel playerInfoModel;
  late PlayerSquadModel playerSquadModel;
  late OverSummeryModel overSummeryModel;
  late UserModel userModel;

  RxList fixtureMatchList = [].obs;
  RxList playerSquadModelList = [].obs;
  RxBool loading = false.obs;
  @override
  void onInit() async {
    //Home Data Model
   // liveMatchesModel = LiveMatchesModel();

    recentMatchModel = RecentMatchModel();
    matcheInfoModel = RecentMatchInfoModel(); //Todo Data Fetching Problem
    commentariesModel =
        CommentariesModel(); //Todo Some Match Comment are Fetch problem
    upcomingMatchModel = UpcomingMatchModel();
    fixturesMatchModel = FixturesMatchModel();
    featureSeriesModel = FeatureSeriesModel();
    scoreCardModel = ScoreCardModel();
    pointTableModel = PointTableModel();
    seriesMatchListModel = SeriesMatchListModel();

    matchSquadModel = MatchSquadModel();
    playerInfoModel = PlayerInfoModel();
    playerSquadModel = PlayerSquadModel();
    overSummeryModel = OverSummeryModel();

  //  monkLeague = MonkLeagueModel();

    userModel = UserModel();
  // fetchInitData();
    //get Matches
    // await getLiveMatches();
    getSetUser();
    super.onInit();
  }
  getSetUser()async{
    //Get User
    final prefs = await SharedPreferences.getInstance();
    String? uId= prefs.getString('userId');
    if(uId != null){
      getUser(uId);
    }

  }
  fetchInitData()async{

    Future.delayed(const Duration(seconds: 3), () async{
      await getRecentMatches();
      await getUpComingMatches();


      //get Fixture
      await getFixturesMatches();
      //get Series
      await getFeatureSeries();
      // await getPointTable("3718");
      // await getCommentaries("38356");
      //  await getMatchSquad("3718");
      await getPlayerSquad("3718", "15826");
      await getPlayerInfo("6635");
      await getMatchInfo("38356");


      // await getLeague("5");

      // //Get User
      // final prefs = await SharedPreferences.getInstance();
      // String? uId= prefs.getString('userId');
      // if(uId != null){
      //   getUser(uId);
      // }


    });

    getLive();
  }

  Future<void> getRecentMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.recentMatchData),
        onSuccess: (response) {
          print("Recent Response: ${response}");

          recentMatchModel = recentMatchModelFromJson(jsonEncode(response));
          print("\n\nDDDDDDDD");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getMatchInfo(String matchId) async {
    loading(true);

    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.matchesInfo + matchId),
        onSuccess: (response) {
          //TODO
          matcheInfoModel = matchInfoModelFromJson(response);
          //
          print("\n\n${matcheInfoModel.matchInfo!.status}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getCommentaries(String matchID) async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.commentariesData + matchID + "/comm?=&="),
        onSuccess: (response) {
          print("Commentaries Response: ${response}");

          commentariesModel = commentariesModelFromJson(jsonEncode(response));

          print(
              "Commentaries Data: ${commentariesModel.commentaryList!.length}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getPlayerInfo(String playerId) async {
    print("Player Info URL ${ApiEndpoints.playerInfoData + playerId}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.playerInfoData + playerId),
        onSuccess: (response) {
          print("Player Info Response: ${response}");

          playerInfoModel = playerInfoModelFromJson(jsonEncode(response));

          print("Player Info model Data: ${playerInfoModel.name}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getPlayerSquad(String seriesID, String squadID) async {
    print(
        "Squad URL ${ApiEndpoints.playerSquadsData + "$seriesID/squads/$squadID"}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.playerSquadsData + "$seriesID/squads/$squadID"),
        onSuccess: (response) {
          print("Player Squad Response: ${response}");

          playerSquadModel = playerSquadModelFromJson(jsonEncode(response));

          print(
              "Player Squad model Data: ${playerSquadModel.player!.first.name}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getMatchSquad(String seriesID) async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.squadsData + "$seriesID/squads"),
        onSuccess: (response) {
          print("Squad Response: ${response}");

          matchSquadModel = matchSquadModelFromJson(jsonEncode(response));
          print("Squad model Data: ${matchSquadModel.seriesName}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getSeriesMatches(String seriesID) async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.seriesMatchListData + seriesID),
        onSuccess: (response) {
          seriesMatchListModel =
              seriesMatchListModelFromJson(jsonEncode(response));
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getPointTable(String seriesID) async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance.get(
            ApiEndpoints.seriesPointTableData + seriesID + "/points-table"),
        onSuccess: (response) {
          print("Point Response: ${response}");

          pointTableModel = pointTableModelFromJson(jsonEncode(response));

          print("Point Table Data: ${pointTableModel.pointsTable!.length}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getScoreCard(String matchID) async {
    //  print("Score Card URL ${ApiEndpoints.scoreCardData + matchID}");
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.scoreCardData + matchID),
        onSuccess: (response) {
          print("Score Response: ${response}");

          scoreCardModel = scoreCardModelFromJson(jsonEncode(response));

          print(
              "Player Of the Match: ${scoreCardModel.matchHeader!.playersOfTheMatch!.first.name!}");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getUpComingMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.upComingMatchData),
        onSuccess: (response) {
          print("Upcoming Response: ${response}");
          upcomingMatchModel = upcomingMatchModelFromJson(jsonEncode(response));
          print("\n\nDDDDDDDD");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<void> getFixturesMatches() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.fixturesMatchDayData),
        onSuccess: (response) {
          print("Fixtures Response: ${response}");
          fixturesMatchModel = fixturesMatchModelFromJson(jsonEncode(response));
          print("\n\nDDDDDDDD");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });

    update();
  }

  Future<void> getFeatureSeries() async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async =>
            await ApiService.instance.get(ApiEndpoints.featureSeriesData),
        onSuccess: (response) {
          print("Feature Response: ${response}");
          featureSeriesModel = featureSeriesModelFromJson(jsonEncode(response));
          print("\n\nDDDDDDDD");
          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  //Monk API Service
  Future<List<MonkLive>> getLive() async {
    List<MonkLive>   monk_live=[];
    await ApiService.instance.apiCall(
        execute: () async =>

        await ApiService.instance.get(ApiEndpoints.monkLiveMatches),
        onSuccess: (response) {
          print("Live Response: $response");
          var lives = response["data"];
          for(var live in lives){
            monk_live.add(MonkLive(
              id:live["id"],
              league_id: live["league_id"],
              round: live["round"],
              localteam_id: live["localteam_id"],
              visitorteam_id: live["visitorteam_id"],

              starting_at: live["starting_at"],
              type: live["type"],
              live: live["live"],
              status: live["status"],
              note: live["note"],
              venue_id: live["venue_id"],
              toss_won_team_id: live["toss_won_team_id"],
              winner_team_id: live["winner_team_id"],
              draw_noresult: live["draw_noresult"],
              total_overs_played: live["total_overs_played"],
              localteam_dl_data: Score(score:live["localteam_dl_data"]["score"],overs:live["localteam_dl_data"]["overs"],wickets_out: live["localteam_dl_data"]["wickets_out"]  ) ,
              visitorteam_dl_data:Score(score:live["visitorteam_dl_data"]["score"],overs:live["visitorteam_dl_data"]["overs"],wickets_out: live["visitorteam_dl_data"]["wickets_out"]),
            ));
          }
        },
        onError: (error) {
          print(error.toString());

        });

    print(monk_live[0].round);
    return monk_live;
  }
  Future<MonkLeague> getLeague(String leagueId) async {
    MonkLeague  monk_league=MonkLeague();
    await ApiService.instance.apiCall(
        execute: () async =>
        await ApiService.instance.get(ApiEndpoints.monkLeague+leagueId+ApiEndpoints.monkAPIToken),
        onSuccess: (response) {
          print("Leauge Response: ${response}");
          var data = response["data"];
          monk_league = MonkLeague(
              id:data["id"],
              name: data["name"],
              code: data["code"],
              image_path: data["image_path"]
          );

        },
        onError: (error) {
          print(error.toString());

        });

    print(monk_league.name);
    update();
    return monk_league;
  }

  Future<MonkVanue> getVenue(String venueId) async {
    MonkVanue  monk_venue=MonkVanue();
    await ApiService.instance.apiCall(
        execute: () async =>
        await ApiService.instance.get(ApiEndpoints.monkVanue+venueId+ApiEndpoints.monkAPIToken),
        onSuccess: (response) {
          print("venue Response: ${response}");
          var data = response["data"];
          monk_venue = MonkVanue(
              id:data["id"],
              name: data["name"],
              city: data["code"],
              image_path: data["image_path"]
          );

        },
        onError: (error) {
          print(error.toString());

        });

    print(monk_venue.name);
    update();
    return monk_venue;
  }
  Future<MonkTeam> getTeam(String teamId) async {
    MonkTeam  monkTeam=MonkTeam();
    await ApiService.instance.apiCall(
        execute: () async =>
        await ApiService.instance.get(ApiEndpoints.monkTeams+teamId+ApiEndpoints.monkAPIToken),
        onSuccess: (response) {
          print("Team Response: ${response}");
          var data = response["data"];
          monkTeam = MonkTeam(
              id:data["id"],
              name: data["name"],
              code: data["code"],
              image_path: data["image_path"]
          );

        },
        onError: (error) {
          print(error.toString());

        });

    print(monkTeam.name);
    update();
    return monkTeam;
  }

  // Future<List<LeagueUpdateModel>> getLeague(String leagueId) async {
  //   loading(true);
  //
  //
  //
  //   await ApiService.instance.apiCall(
  //       execute: () async => await ApiService.instance
  //           .getWithoutHeader(ApiEndpoints.monkLeague+leagueId+ApiEndpoints.monkAPIToken),
  //       onSuccess: (response) {
  //         print(response);
  //         // MonkLeagueModel(resource: )
  //
  //         var  responseData = jsonDecode(response.body);
  //
  //         monkListLeagueModel = leagueUpdateModelFromJson(jsonEncode(responseData["data"]));
  //         // monkLeague = monkLeague.fromJason(e);
  //         // monkLeague = leagueFromJson(jsonEncode(response));
  //         //
  //         //  print("Monk League :${monkLeagueModel.data!.length}");
  //         loading(false);
  //       },
  //       onError: (error) {
  //         print(error.toString());
  //         loading(false);
  //       });
  //   update();
  //   return monkListLeagueModel;
  //
  // }

  // Future<void> getLiveMatches() async {
  //   loading(true);
  //   await ApiService.instance.apiCall(
  //       execute: () async =>
  //           await ApiService.instance.get(ApiEndpoints.liveMatches),
  //       onSuccess: (response) {
  //         print(response);
  //
  //         liveMatchesModel = liveMatchesModelFromJson(jsonEncode(response));
  //         //
  //         print(
  //             "Live Matches:${liveMatchesModel.filters!.matchType!.first.capitalizeFirst}");
  //         loading(false);
  //       },
  //       onError: (error) {
  //         print(error.toString());
  //         loading(false);
  //       });
  //   update();
  // }

  Future<void> getOverSummery(String matchID) async {
    loading(true);
    await ApiService.instance.apiCall(
        execute: () async => await ApiService.instance
            .get(ApiEndpoints.overSummery + matchID + "/overs"),
        onSuccess: (response) {
          print("Over Summery Model: ${response}");
          overSummeryModel = overSummeryModelFromJson(jsonEncode(response));

          loading(false);
        },
        onError: (error) {
          print(error.toString());
          loading(false);
        });
    update();
  }

  Future<bool> registerUser(String firstName, String lastName, String phone,
      String password,String imageUrl) async {
    final snapshot1 =
    await FirebaseFirestore.instance.collection('Users').doc(phone).get();
    if (snapshot1.exists) {
      showToast('This User is Already Exist');
      return false;
    } else {
      DateTime date = DateTime.now();
      String dateData = '${date.day}-${date.month}-${date.year}';
      Map<String, dynamic> map = {
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'password': password,
        'date': dateData,
        'id': phone,
        'profileImage': imageUrl,
        'totalPoint': '00',
      };



      try {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(map['id'])
            .set(map);
       await getUser(phone);
        return true;
      } catch (err) {
        showToast('$err');
        print(err);

        return false;
      }

    }

  }

  Future<bool> registerUserWithGoogle(String firstName, String lastName, String phone,String email,
      String password,String imageUrl) async {
    // final snapshot1 =
    // await FirebaseFirestore.instance.collection('Users').doc(phone).get();

      DateTime date = DateTime.now();
      String dateData = '${date.day}-${date.month}-${date.year}';
      Map<String, dynamic> map = {
        'firstName': firstName,
        'lastName': lastName,
        'phone': "",
        'email':email,
        'password': password,
        'date': dateData,
        'id': phone,
        'profileImage': imageUrl,
        'totalPoint': '00',
      };



      try {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(map['id'])
            .set(map);
        await getUser(phone);
        return true;
      } catch (err) {
        showToast('$err');
        print(err);

        return false;
      }



  }
  // RxBool isLogIn = false.obs;
  Future<void> getUser(String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get()
          .then((snapShot) {
        UserModel user = UserModel(
          firstName: snapShot['firstName'],
          lastName: snapShot['lastName'],
          phone: snapShot['phone'],
          password: snapShot['password'],
          date: snapShot['date'],
          id: snapShot['id'],
          profileImage: snapShot['profileImage'],
          totalPoint: snapShot['totalPoint'],
        );
        userModel = user;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', userModel.id!);

    } catch (error) {
      showToast('$error');
    }
    update();
  }
  Future<bool> loginData(
      String inputPhone, String inputPassword ) async {
    final snapshot1 = await FirebaseFirestore.instance
        .collection('Users')
        .doc(inputPhone)
        .get();
    if (snapshot1.exists) {
     await getUser(inputPhone);
      update();
      return false;
    } else {
      showToast('This User is Not Exist');
    }
    update();
    return false;
  }

  Future<bool> sellPoint(String sellPoints, String transectionNumber, String password,
      String transectionMethod) async {

      DateTime date = DateTime.now();
      String dateData = '${date.day}-${date.month}-${date.year}';
      Map<String, dynamic> map = {
        'sellPoints': sellPoints,
        'transectionNumber': transectionNumber,
        'transectionMethod': transectionMethod,
        'password': password,
        'date': dateData,
        'id': "${date.microsecondsSinceEpoch}",
      };
      try {
        await FirebaseFirestore.instance
            .collection("SellPoint")
            .doc(map['id'])
            .set(map);

       await  updatePoints(sellPoints,false);

        return true;
      } catch (err) {
        showToast('$err');
        print(err);

        return false;
      }



  }
  
  Future<bool>updatePoints(String sellPoint, bool isAdd)async{
    final prefs = await SharedPreferences.getInstance();

     await FirebaseFirestore.instance
        .collection('Users')
        .doc(prefs.getString('userId'))
        .update({
      "totalPoint":isAdd? "${int.parse(userModel.totalPoint!) + int.parse(sellPoint)}":"${int.parse(userModel.totalPoint!) - int.parse(sellPoint)}",
    });
    await getUser(prefs.getString('userId')!);
    return true;
  }

}
