import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_info.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_matches.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_overview.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PlayerDetailsPage extends StatefulWidget {
  final String playerId;
  const PlayerDetailsPage({Key? key, required this.playerId}) : super(key: key);

  @override
  State<PlayerDetailsPage> createState() => _PlayerDetailsPageState();
}

class _PlayerDetailsPageState extends State<PlayerDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Variables.playerDetails.length, vsync: this);
    fetchData();
  }

  fetchData() async {
    //getPlayer Data
    HomeController homeController = Get.put(HomeController());
    await homeController.getPlayerInfo(widget.playerId);

    setState(() {});
  }

  final TextStyle _titleStyle = TextStyle(
      fontSize: dSize(.055),
      fontWeight: FontWeight.w500,
      color: AllColor.darkTextColor);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  // title: const Text('Books'),
                  floating: true,
                  pinned: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                  expandedHeight: dSize(.52),
                  flexibleSpace: Stack(
                    children: [
                      Positioned.fill(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: dSize(.055)),
                              child: RichText(
                                text: TextSpan(
                                  style: CLTextStyle.nameTextStyle,
                                  children: [
                                    TextSpan(
                                        text:
                                            '${homeController.playerInfoModel.name} \n\n'),
                                    TextSpan(
                                        text:
                                            '${homeController.playerInfoModel.intlTeam} \n${homeController.playerInfoModel.doB}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: dSize(.035))),
                                  ],
                                ),
                              )),
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    ApiEndpoints.imageMidPoint +
                                        "${homeController.playerInfoModel.faceImageId}" +
                                        ApiEndpoints.imageLastPoint,
                                    headers: ApiEndpoints.headers,
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                  bottom: _tabBar(),
                ),
              ),
            ];
          },
          body: _bodyUI(),
        ),
      );
    });
  }

  Widget _bodyUI() => TabBarView(
        controller: _tabController,
        children: [
          PlayerOverview(),
          PlayerMatches(),
          // NewsPage(),
          PlayerInfo(),
        ],
      );

  PreferredSize _tabBar() => PreferredSize(
        preferredSize: Size.fromHeight(dSize(.3)),
        child: Container(
          color: AllColor.appDarkBg,
          child: TabBar(
            onTap: (covariant) async {
              setState(() => _tabController.index = covariant);
            },
            isScrollable: true,
            controller: _tabController,
            labelColor: PublicController.pc.toggleLoadingColor(),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dSize(.02)),
                    topRight: Radius.circular(dSize(.02))),
                color: PublicController.pc.toggleTabColor()),
            unselectedLabelColor: Colors.grey.shade400,
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: dSize(.045)),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: dSize(.045)),
            indicatorSize: TabBarIndicatorSize.label,
            physics: const BouncingScrollPhysics(),
            tabs: Variables.playerDetails
                .map<Widget>((String item) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: dSize(.01), horizontal: dSize(.02)),
                      child: Text(
                        item,
                        style: CLTextStyle.optionTextStyle
                            .copyWith(fontSize: dSize(.04)),
                      ),
                    ))
                .toList(),
          ),
        ),
      );
}
