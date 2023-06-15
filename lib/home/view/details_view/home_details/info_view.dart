import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/series_screen.dart';
import 'package:cricland/IPL/view/squad_bottom_sheet_screen.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/match_info_model.dart';
import '../../../model/rapid_model/recent_match_model.dart';
import '../../widgets/head_to_head_tile.dart';
import '../../widgets/match_card_tile.dart';

class InfoView extends StatefulWidget {
  final RapidMatch rapidMatch;

  const InfoView({Key? key, required this.rapidMatch}) : super(key: key);

  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  List<String> teamSymbol = ['*', 'L', 'W', 'W', 'L', 'W'];
  List<Color> teamColors = [
    Colors.grey,
    Colors.redAccent,
    Colors.green,
    Colors.green,
    Colors.redAccent,
    Colors.green
  ];

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    HomeController homeController = Get.put(HomeController());
    // await homeController.getSeriesMatches(widget.rapidMatch.matchInfo!.seriesId.toString());
    await homeController
        .getMatchInfo(widget.rapidMatch.matchInfo!.matchId.toString());
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: PublicController.pc.toggleCardBg(),
                leading: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          ApiEndpoints.imageMidPoint +
                              "${widget.rapidMatch.matchInfo!.seriesId}" +
                              ApiEndpoints.imageLastPoint,
                          headers: ApiEndpoints.headers,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                title: Text(
                  widget.rapidMatch.matchInfo!.status != null
                      ? "${widget.rapidMatch.matchInfo!.status}"
                      : "${widget.rapidMatch.matchInfo!.seriesName}",
                  style: AppTextStyle().titleTextBoldStyle.copyWith(
                        color: Colors.orange,
                      ),
                ),
                // RichText(
                //   text: TextSpan(
                //     text: widget.rapidMatch.matchInfo!.status,
                //     style: AppTextStyle().titleTextBoldStyle.copyWith(color: Colors.orange,),
                //     children: <TextSpan>[
                //       // TextSpan(
                //       //   text: ' won the toss and chose to bowl',
                //       //   style: TextStyle(
                //       //     fontWeight: FontWeight.normal,
                //       //     fontSize: dSize(.03),
                //       //     color: PublicController.pc.toggleTextColor(),
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
                // leading: Container(
                //   height: 60,
                //   width: 60,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //         image: CachedNetworkImageProvider(
                //           ApiEndpoints.imageMidPoint +
                //               widget.team1ImageID +
                //               ApiEndpoints.imageLastPoint,
                //           headers: ApiEndpoints.headers,
                //         ),
                //         fit: BoxFit.fill),
                //   ),
                // ),
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {
                  Get.to(const IPLPage());
                },
                tileColor: PublicController.pc.toggleCardBg(),
                title: Text(
                  widget.rapidMatch.matchInfo!.matchDesc.toString(),
                  style: AppTextStyle().paragraphTextStyle,
                ),
                subtitle: Row(
                  children: [
                    FittedBox(
                      child: Text(
                        widget.rapidMatch.matchInfo!.seriesName.toString(),
                        style: AppTextStyle().titleTextBoldStyle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: PublicController.pc.toggleTextColor(),
                      size: dSize(.03),
                    )
                  ],
                ),
                trailing: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          ApiEndpoints.imageMidPoint +
                              "${widget.rapidMatch.matchInfo!.seriesId}" +
                              ApiEndpoints.imageLastPoint,
                          headers: ApiEndpoints.headers,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                tileColor: PublicController.pc.toggleCardBg(),
                title: Text(
                    DateFormat('MMM d,' 'hh:mm a')
                        .format(DateTime.fromMillisecondsSinceEpoch(
                            int.parse(widget.rapidMatch.matchInfo!.startDate!) *
                                1000))
                        .toString(),
                    style: AppTextStyle().titleTextBoldStyle),
                leading: Icon(
                  Icons.calendar_today_outlined,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              const SizedBox(height: 3),
              ListTile(
                tileColor: PublicController.pc.toggleCardBg(),
                title: Text(
                    "${widget.rapidMatch.matchInfo!.venueInfo!.ground}, ${widget.rapidMatch.matchInfo!.venueInfo!.city}",
                    style: AppTextStyle().titleTextBoldStyle),
                leading: Icon(
                  Icons.location_on,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Playing XI',
                    style: AppTextStyle().titleTextBoldStyle),
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {
                  fetchData();
                  _showSquadsSheet(
                      context,
                      homeController.recentMatchInfoModel.matchInfo!.team2!
                          .playerDetails!);
                },
                tileColor: PublicController.pc.toggleCardBg(),
                title: Text(
                    widget.rapidMatch.matchInfo!.team1!.teamName.toString(),
                    style: AppTextStyle().paragraphTextStyle),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: PublicController.pc.toggleTextColor(),
                ),
                leading: Container(
                  height: 20,
                  width: 20,
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
              const SizedBox(height: 2),
              ListTile(
                onTap: () {
                  _showSquadsSheet(
                      context,
                      homeController.recentMatchInfoModel.matchInfo!.team2!
                          .playerDetails!);
                },
                tileColor: PublicController.pc.toggleCardBg(),
                title: Text(
                    widget.rapidMatch.matchInfo!.team2!.teamName.toString(),
                    style: AppTextStyle().bodyTextStyle),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: PublicController.pc.toggleTextColor(),
                ),
                leading: Container(
                  height: 20,
                  width: 20,
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
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'Team Form',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.04),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' (Last 5 matches)',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ExpandableNotifier(
                child: Column(
                  children: [
                    Expandable(
                      collapsed: ExpandableButton(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/bd_flag.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Bangladesh',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.04),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  for (var i = 0; i < teamSymbol.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                          color: teamColors[i],
                                        ),
                                        child: Center(
                                          child: Text(
                                            teamSymbol[i],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      expanded: Column(
                        children: [
                          for (var i = 0; i < teamSymbol.length; i++)
                            GestureDetector(
                              onTap: () {
                                // Get.to(HomeDetailsScreen(
                                //   teamS2Name: '',
                                //   teamS1Name: '',
                                //   matchIndex: i,
                                //   matchDesc: '',
                                // ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: PublicController.pc.toggleCardBg(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/t20.png',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'RR',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: dSize(.04),
                                                        color: PublicController
                                                            .pc
                                                            .toggleTextColor(),
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: ' 188-6',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize:
                                                                dSize(.04),
                                                            color: PublicController
                                                                .pc
                                                                .toggleTextColor(),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: ' 20.0',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize:
                                                                dSize(.03),
                                                            color: PublicController
                                                                .pc
                                                                .toggleTextColor(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/t20.png',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'RR',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: dSize(.04),
                                                        color: PublicController
                                                            .pc
                                                            .toggleTextColor(),
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: ' 188-6',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize:
                                                                dSize(.04),
                                                            color: PublicController
                                                                .pc
                                                                .toggleTextColor(),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: ' 20.0',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize:
                                                                dSize(.03),
                                                            color: PublicController
                                                                .pc
                                                                .toggleTextColor(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const VerticalDivider(
                                                width: 1,
                                                thickness: 2,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 3.0,
                                                        horizontal: 7),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  color: teamColors[i],
                                                ),
                                                child: Text(
                                                  teamSymbol[i],
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text("Qualifire 1 "),
                                                  const Text("IPL 2022"),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          // ListTile(
                          //   leading: Image.asset(
                          //     'assets/t20.png',
                          //     height: 20,
                          //     width: 20,
                          //   ),
                          //   trailing: Row(
                          //     children: const [
                          //       Text("Fixtures"),
                          //       Icon(Icons.arrow_forward_ios_sharp)
                          //     ],
                          //   ),
                          //   title: Text("See more matches"),
                          // ),
                        ],
                      ),
                    ),
                    Expandable(
                      collapsed: ExpandableButton(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/indian_flag.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'India',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.04),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  for (var i = 0; i < teamSymbol.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                          color: teamColors[i],
                                        ),
                                        child: Center(
                                          child: Text(
                                            teamSymbol[i],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      expanded: Column(
                        children: [
                          for (var i = 0; i < teamSymbol.length; i++)
                            GestureDetector(
                              onTap: () {
                                // Get.to(HomeDetailsScreen(
                                //   teamS2Name: '',
                                //   teamS1Name: '',
                                //   matchIndex: i,
                                //   matchDesc: '',
                                // ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: PublicController.pc.toggleCardBg(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/t20.png',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'RR',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: dSize(.04),
                                                        color: PublicController
                                                            .pc
                                                            .toggleTextColor(),
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: ' 188-6',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize:
                                                                dSize(.04),
                                                            color: PublicController
                                                                .pc
                                                                .toggleTextColor(),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: ' 20.0',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize:
                                                                dSize(.03),
                                                            color: PublicController
                                                                .pc
                                                                .toggleTextColor(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/t20.png',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'RR',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: dSize(.04),
                                                        color: PublicController
                                                            .pc
                                                            .toggleTextColor(),
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: ' 188-6',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize:
                                                                dSize(.04),
                                                            color: PublicController
                                                                .pc
                                                                .toggleTextColor(),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: ' 20.0',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize:
                                                                dSize(.03),
                                                            color: PublicController
                                                                .pc
                                                                .toggleTextColor(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const VerticalDivider(
                                                width: 1,
                                                thickness: 2,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 3.0,
                                                        horizontal: 7),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  color: teamColors[i],
                                                ),
                                                child: Text(
                                                  teamSymbol[i],
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text("Qualifire 1 "),
                                                  const Text("IPL 2022"),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          // ListTile(
                          //   leading: Image.asset(
                          //     'assets/t20.png',
                          //     height: 20,
                          //     width: 20,
                          //   ),
                          //   trailing: Row(
                          //     children: const [
                          //       Text("Fixtures"),
                          //       Icon(Icons.arrow_forward_ios_sharp)
                          //     ],
                          //   ),
                          //   title: Text("See more matches"),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    size: 10,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Upcoming Matches",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.025),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Head to Head',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' (Last 10 matches)',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: dSize(.03),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MoreCard(
                child: HeadToHeadCardTile(
                  leadingWidget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/bd_flag.png',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "BD",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        )
                      ],
                    ),
                  ),
                  title: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '2',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: dSize(.06),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' - 0',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailingWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/indian_flag.png',
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "India",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                  itemCount: homeController.rapidSeriesMatchList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print(homeController.rapidSeriesMatchList[index]
                            .matchInfo!.team1!.imageId!);
                      },
                      child: MatchCardTile(),
                    );
                  }),
              const SizedBox(height: 10),
              MoreCard(
                child: ListTile(
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                  leading: Text(
                    "GT va RR",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.04),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                  title: Text(
                    "More Matches",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.04),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Team Comparison',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.04),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' (Last 10 matches)',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MoreCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/bd_flag.png',
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'BD',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.04),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                                Text(
                                  'vs all teams',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/indian_flag.png',
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'India',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.04),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                                Text(
                                  'vs all teams',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      leading: Text(
                        "10",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      title: Text(
                        "Matches Played",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      trailing: Text(
                        '10',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      leading: Text(
                        "70%",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      title: Text(
                        "Win",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      trailing: Text(
                        '60%',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      leading: Text(
                        "165",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      title: Text(
                        "Average Score",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      trailing: Text(
                        '170',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      leading: Text(
                        "199",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      title: Text(
                        "Highest Score",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      trailing: Text(
                        '222',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      leading: Text(
                        "137",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      title: Text(
                        "Lowest Score",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      trailing: Text(
                        '144',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: PublicController.pc.toggleTextColor(),
                ),
                title: Text(
                  "${widget.rapidMatch.matchInfo!.venueInfo!.ground.toString()}, ${widget.rapidMatch.matchInfo!.venueInfo!.city.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
              ),
              homeController.recentMatchInfoModel.venueInfo != null
                  ? Column(
                      children: [
                        Image.network(
                            "${homeController.recentMatchInfoModel.venueInfo!.imageUrl}"),
                        MoreCard(
                          child: Column(
                            children: [
                              homeController.recentMatchInfoModel.matchInfo!
                                          .umpire1 !=
                                      null
                                  ? ListTile(
                                      title: Text(
                                        "Umpire",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${homeController.recentMatchInfoModel.matchInfo!.umpire1!.name}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              const Divider(thickness: 1),
                              homeController.recentMatchInfoModel.matchInfo!
                                          .umpire2 !=
                                      null
                                  ? ListTile(
                                      title: Text(
                                        "2nd Umpire",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${homeController.recentMatchInfoModel.matchInfo!.umpire2!.name}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              const Divider(thickness: 1),
                              homeController.recentMatchInfoModel.matchInfo!
                                          .umpire3 !=
                                      null
                                  ? ListTile(
                                      title: Text(
                                        "Third Umpire",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${homeController.recentMatchInfoModel.matchInfo!.umpire3!.name}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              const Divider(thickness: 1),
                              homeController.recentMatchInfoModel.matchInfo!
                                          .referee !=
                                      null
                                  ? ListTile(
                                      title: Text(
                                        "Referee",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${homeController.recentMatchInfoModel.matchInfo!.referee!.name}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: dSize(.04),
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(height: 10)
            ],
          ),
        ),
      );
    });
  }

  void _showSquadsSheet(BuildContext context, List<PlayerRapid> players) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return FractionallySizedBox(
              heightFactor: 2.3,
              child: BottomSheetScreen(
                playerRapidTeam: players,
              ),
            );
          });
        });
  }
}
