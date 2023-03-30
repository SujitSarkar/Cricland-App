import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/details_view/home_details/team_info/team_info_screen.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/home/model/rapid_model/recent_match_model.dart';
import 'package:cricland/home/view/details_view/home_details/commentary_view.dart';
import 'package:cricland/home/view/details_view/home_details/info_view.dart';
import 'package:cricland/home/view/details_view/home_details/live_view.dart';
import 'package:cricland/home/view/details_view/home_details/points_table.dart';
import 'package:cricland/home/view/details_view/home_details/score_card_view.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../public/controller/api_endpoints.dart';
import '../../../../public/widgets/decoration.dart';

class HomeDetailsScreen extends StatefulWidget {
  final RapidMatch rapidMatch;
  const HomeDetailsScreen({
    Key? key,
    required this.rapidMatch,
  }) : super(key: key);

  @override
  _HomeDetailsScreenState createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // late SharedPreferences pref;

  bool _isMute = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: Variables.iplDetailsTabsCategory.length,
        vsync: this);
    fetchTabData();

    print("Match ID : ${widget.rapidMatch.matchInfo!.matchId}");

    // fetchData();
  }

  fetchTabData() async {
    final prefs = await SharedPreferences.getInstance();
    _tabController = TabController(
        initialIndex:
            prefs.getInt('tabIndex') == null ? 0 : prefs.getInt('tabIndex')!,
        length: Variables.iplDetailsTabsCategory.length,
        vsync: this);
    setState(() {});
  }

  fetchData() async {
    HomeController homeController = Get.put(HomeController());
    await homeController.getMatchInfo("41881");
    //await homeController.getCommentaries(widget.matchID);
    //  await homeController.getScoreCard("40381/scard");
    await homeController.getSeriesMatches("3641");

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Match ID From Home: ${widget.rapidMatch.matchInfo!.matchId}");

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              flexibleSpace: Container(decoration: StDecoration().sliverAppbarGradient),
              elevation: 0,
              title: Text("${widget.rapidMatch.matchInfo!.team1!.teamSName} VS ${widget.rapidMatch.matchInfo!.team2!.teamSName} "),



              // innerBoxIsScrolled? const SizedBox(): RichText(
              //   text: TextSpan(
              //     text: "${widget.rapidMatch.matchInfo!.team1!.teamSName}",
              //     style: AppTextStyle().largeTitleStyle.copyWith(color: Colors.white),
              //     children: <TextSpan>[
              //       const TextSpan(
              //           text: '  VS  ',
              //           style: TextStyle(fontWeight: FontWeight.normal)),
              //       TextSpan(
              //         text: "${widget.rapidMatch.matchInfo!.team2!.teamSName}",
              //         style: const TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       TextSpan(
              //         text: ", ${"${widget.rapidMatch.matchInfo!.matchDesc}"}",
              //         style: const TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
              actions: [
                innerBoxIsScrolled? const SizedBox(): const Icon(
                  Icons.push_pin_outlined,
                  color: Colors.white,
                ),
                innerBoxIsScrolled? const SizedBox():   const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ],
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(dSize(.50 )),
                child: Column(
                  children: [
                    TabBar(
                      onTap: (covariant) async {
                        final prefs = await SharedPreferences.getInstance();
                        setState(() => _tabController.index = covariant);
                        await prefs.setInt("tabIndex", _tabController.index);
                      },
                      isScrollable: true,
                      controller: _tabController,
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(dSize(.02)),
                              topRight: Radius.circular(dSize(.02))),
                          color: PublicController.pc.toggleTabColor()),
                      unselectedLabelColor: Colors.white70,
                      indicatorSize: TabBarIndicatorSize.label,
                      physics: const BouncingScrollPhysics(),
                      tabs: Variables.iplDetailsTabsCategory.map<Widget>((String item) {
                        print(item);

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: dSize(.01), horizontal: dSize(.02)),
                          child: Text(
                            item,
                          ),
                        );
                      }).toList(),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),

                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>TeamInfoScreen(team: widget.rapidMatch.matchInfo!.team1!),),);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              ApiEndpoints.imageMidPoint +
                                                  "${widget.rapidMatch.matchInfo!.team1!.imageId}" +
                                                  ApiEndpoints.imageLastPoint,
                                              headers: ApiEndpoints.headers,
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${widget.rapidMatch.matchInfo!.team1!.teamSName}",
                                          style: AppTextStyle().largeTitleStyle.copyWith(
                                            color: Colors.white,
                                            fontSize: dSize(.05),
                                          )),
                                      widget.rapidMatch.matchScore != null?     RichText(
                                        text: TextSpan(
                                          text: "${widget.rapidMatch.matchScore!.team1Score!.inngs1!.runs}-${widget.rapidMatch.matchScore!.team1Score!.inngs1!.wickets}",
                                          style: AppTextStyle().paragraphTextStyle.copyWith(
                                              fontSize: dSize(.03), color: Colors.white),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: " (${widget.rapidMatch.matchScore!.team1Score!.inngs1!.overs})",
                                              style: AppTextStyle().paragraphTextStyle
                                                  .copyWith(
                                                  fontSize: dSize(.025),
                                                  color: Colors.white),
                                            ),
                                            // TextSpan(text: ' world!'),
                                          ],
                                        ),
                                      ):SizedBox(),
                                    ],
                                  )
                                ],
                              ),
                              Icon(
                                Icons.bolt,
                                color: Colors.white,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${widget.rapidMatch.matchInfo!.team2!.teamSName}",
                                        style: AppTextStyle().largeTitleStyle.copyWith(
                                          color: Colors.white,
                                          fontSize: dSize(.05),
                                        ),
                                      ),
                                      widget.rapidMatch.matchScore != null?     RichText(
                                        text: TextSpan(
                                          text: "(${widget.rapidMatch.matchScore!.team2Score!.inngs1!.overs}) ",
                                          style: AppTextStyle().paragraphTextStyle.copyWith(
                                            color: Colors.white,
                                            fontSize: dSize(.025),
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "${widget.rapidMatch.matchScore!.team2Score!.inngs1!.runs}-${widget.rapidMatch.matchScore!.team2Score!.inngs1!.wickets}",
                                              style:
                                              AppTextStyle().paragraphTextStyle.copyWith(
                                                color: Colors.white,
                                                fontSize: dSize(.04),
                                              ),
                                            ),
                                            // TextSpan(text: ' world!'),
                                          ],
                                        ),
                                      ):SizedBox(),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>TeamInfoScreen(team: widget.rapidMatch.matchInfo!.team2!),),);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              ApiEndpoints.imageMidPoint +
                                                  "${widget.rapidMatch.matchInfo!.team2!.imageId}" +
                                                  ApiEndpoints.imageLastPoint,
                                              headers: ApiEndpoints.headers,
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          widget.rapidMatch.matchInfo!.status != null?  Column(
                            children: [
                              Divider(color: Colors.grey,),
                              GestureDetector(
                                onTap: (){
                                  fetchData();
                                  print("GGG");
                                },
                                child: Text(
                                  "${widget.rapidMatch.matchInfo!.status}",
                                  style: AppTextStyle().largeTitleStyle
                                      .copyWith(color: Colors.orange, fontSize: 15),
                                ),
                              )
                            ],
                          ):const SizedBox(),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ];

        },
        body:
        Column(
          children: [

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  InfoView(

                    rapidMatch: widget.rapidMatch,
                  ),
                  CommentaryView(
                    matchId:"${widget.rapidMatch.matchInfo!.matchId}",
                  ),
                  LiveView(
                    team1ImageID: "${widget.rapidMatch.matchInfo!.team1!.imageId}",
                    team2ImageID: "${widget.rapidMatch.matchInfo!.team2!.imageId}",
                    matchId: "${widget.rapidMatch.matchInfo!.matchId}",
                    state: '',
                  ),
                  ScoreCardView(
                    matchId: "${widget.rapidMatch.matchInfo!.matchId}",
                  ),
                  PointTableView(
                    matchId: "${widget.rapidMatch.matchInfo!.matchId}",
                    seriesId: "${widget.rapidMatch.matchInfo!.seriesId}",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),





    );
  }

  // PreferredSize _tabBar() => PreferredSize(
  //       preferredSize: Size.fromHeight(dSize(.04)),
  //       child: TabBar(
  //         onTap: (covariant) {
  //           setState(() => _tabController.index = covariant);
  //           print("KKKKKK");
  //         },
  //         isScrollable: true,
  //         controller: _tabController,
  //         labelColor: PublicController.pc.toggleLoadingColor(),
  //         indicator: BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(dSize(.02)),
  //                 topRight: Radius.circular(dSize(.02))),
  //             color: PublicController.pc.toggleTabColor()),
  //         unselectedLabelColor: Colors.grey,
  //         indicatorSize: TabBarIndicatorSize.label,
  //         physics: const BouncingScrollPhysics(),
  //         tabs: Variables.iplDetailsTabsCategory.map<Widget>((String item) {
  //           return Padding(
  //             padding: EdgeInsets.symmetric(
  //                 vertical: dSize(.01), horizontal: dSize(.02)),
  //             child: Text(
  //               item,
  //               style: CLTextStyle().optionTextStyle,
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     );
}
