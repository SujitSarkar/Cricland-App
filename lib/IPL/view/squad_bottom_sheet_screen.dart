import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_details_man.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../home/model/monk/playing_model_xi.dart';
import '../../public/variables/colors.dart';

class BottomSheetScreen extends StatefulWidget {
  final String fixturesId;

  const BottomSheetScreen({Key? key, required this.fixturesId})
      : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _iplTabType = Variables.teamSquadsTabsCategory.first;

  List<String> tabData = ["LTN", "VTN"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: Variables.teamSquadsTabsCategory.length, vsync: this);
    getAllPlayerList();
  }

  List<PlayerPlayingXI2> bowlingPlayerList = [];
  List<PlayerPlayingXI2> battingPlayerList = [];
  List<PlayerPlayingXI2> filteredPlayerList = [];
  getAllPlayerList() async {
    HomeController homeController = HomeController();
    battingPlayerList = await homeController
        .getBattingPlayerWithDetailsData(widget.fixturesId.toString());

    bowlingPlayerList = await homeController
        .getBowlingPlayerWithDetailsData(widget.fixturesId.toString());

    filteredPlayerList = battingPlayerList;
    setState(() {});
    print(battingPlayerList.length);
    print(bowlingPlayerList.length);
    print("objdfdect");
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
                child: const Text(
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
                              });
                              if (i == 0) {
                                filteredPlayerList = battingPlayerList;
                              } else {
                                filteredPlayerList = bowlingPlayerList;
                              }
                              setState(() {});
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
                  child: filteredPlayerList.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: filteredPlayerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const PlayerDetailsPageMan(),
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
                                                        filteredPlayerList[
                                                                index]
                                                            .imagePath!),
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
                                              filteredPlayerList[index]
                                                  .fullName!,
                                              style: TextStyle(
                                                fontSize: dSize(.04),
                                                fontWeight: FontWeight.w500,
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                            ),
                                            _selectedtab == 0
                                                ? Text(
                                                    filteredPlayerList[index]
                                                                .battingStyle !=
                                                            null
                                                        ? battingPlayerList[
                                                                index]
                                                            .battingStyle!
                                                        : "",
                                                    style: TextStyle(
                                                      fontSize: dSize(.035),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: PublicController.pc
                                                          .toggleTextColor(),
                                                    ),
                                                  )
                                                : Text(
                                                    filteredPlayerList[index]
                                                                .bowlingStyle !=
                                                            null
                                                        ? filteredPlayerList[
                                                                index]
                                                            .bowlingStyle!
                                                        : "",
                                                    style: TextStyle(
                                                      fontSize: dSize(.035),
                                                      fontWeight:
                                                          FontWeight.w500,
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
