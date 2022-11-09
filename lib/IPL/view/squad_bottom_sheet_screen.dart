import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/player_squad_model.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_details.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BottomSheetScreen extends StatefulWidget {
  final String? seriesId;
  final String? squadId;
  const BottomSheetScreen({Key? key, this.seriesId, this.squadId})
      : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _iplTabType = Variables.teamSquadsTabsCategory.first;
  List<Player> allPlayerList = [];
  List<Player> batPlayerList = [];
  List<Player> bowlPlayerList = [];
  List<Player> arPlayerList = [];
  List<Player> tempPlayerList = [];
  List<String> tabData = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: Variables.teamSquadsTabsCategory.length, vsync: this);
    getAllPlayerList();

    tempPlayerList = allPlayerList;
  }

  getAllPlayerList() async {
    HomeController homeController = Get.put(HomeController());
    for (var player in homeController.playerSquadModel.player!) {
      if (player.id != null) {
        allPlayerList.add(player);
      }
      if (player.role == "Batsman") {
        batPlayerList.add(player);
      }
      if (player.role == "Bowler") {
        bowlPlayerList.add(player);
      }
      if (player.role == "WK-Batsman") {
        arPlayerList.add(player);
      }
    }
    tabData = [
      "All(${allPlayerList.length})",
      "Bat(${batPlayerList.length})",
      "bowl(${bowlPlayerList.length})",
      "AR(${arPlayerList.length})"
    ];
  }

  int _selectedtab = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: PublicController.pc.toggleCardBg(),
            automaticallyImplyLeading: false,
            title: Text(
              "Text Squads",
              style: TextStyle(
                  color: PublicController.pc.toggleTextColor(), fontSize: 15),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    for (var i = 0; i < tabData.length; i++)
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedtab = i;

                                if (_selectedtab == 0) {
                                  tempPlayerList = allPlayerList;
                                }
                                if (_selectedtab == 1) {
                                  tempPlayerList = batPlayerList;
                                }
                                if (_selectedtab == 2) {
                                  tempPlayerList = bowlPlayerList;
                                }
                                if (_selectedtab == 3) {
                                  tempPlayerList = arPlayerList;
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                    color: _selectedtab == i
                                        ? AllColor.primaryColor
                                        : Colors.transparent),
                                child: Center(
                                  child: Text(
                                    tabData[i],
                                    style: TextStyle(
                                      fontSize: dSize(.04),
                                      fontWeight: FontWeight.w500,
                                      color: _selectedtab == i
                                          ? PublicController.pc.toggleCardBg()
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tempPlayerList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return tempPlayerList[index].id != null
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const PlayerDetailsPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: PublicController.pc
                                                .toggleTextColor())),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 3),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    ApiEndpoints.imageMidPoint +
                                                        "${tempPlayerList[index].imageId!}" +
                                                        ApiEndpoints
                                                            .imageLastPoint,
                                                    headers:
                                                        ApiEndpoints.headers,
                                                  ),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${tempPlayerList[index].name!}",
                                                style: TextStyle(
                                                  fontSize: dSize(.04),
                                                  fontWeight: FontWeight.w500,
                                                  color: PublicController.pc
                                                      .toggleTextColor(),
                                                ),
                                              ),
                                              Text(
                                                tempPlayerList[index].role !=
                                                        null
                                                    ? "${tempPlayerList[index].role!}"
                                                    : "",
                                                style: TextStyle(
                                                  fontSize: dSize(.035),
                                                  fontWeight: FontWeight.w500,
                                                  color: PublicController.pc
                                                      .toggleTextColor(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                color: Colors.grey,
                              );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
