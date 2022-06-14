import 'package:cricland/IPL/view/ipl_page.dart';
import 'package:cricland/IPL/view/over_view_tab.dart';
import 'package:cricland/home/view/home_details_screen.dart';
import 'package:cricland/home/view/widgets/fixtures_card_tile.dart';
import 'package:cricland/home/view/widgets/head_to_head_tile.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InfoView extends StatefulWidget {
  const InfoView({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: PublicController.pc.toggleCardBg(),
              title: RichText(
                text: TextSpan(
                  text: 'NWW',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' won the toss and chose to bowl',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: dSize(.03),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ],
                ),
              ),
              leading: Image.asset(
                'assets/t20.png',
                height: 20,
                width: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Get.to(
                  IPLPage(),
                );
              },
              tileColor: PublicController.pc.toggleCardBg(),
              title: Text(
                "1st T20",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.03),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              subtitle: Row(
                children: [
                  Text(
                    'IRE Provincial T20 2022',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: dSize(.05),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: PublicController.pc.toggleTextColor(),
                    size: dSize(.03),
                  )
                ],
              ),
              trailing: Image.asset('assets/t20.png'),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: PublicController.pc.toggleCardBg(),
              title: Text(
                "27 May, 04:00PM",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              leading: Icon(
                Icons.calendar_today_outlined,
                color: PublicController.pc.toggleTextColor(),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            ListTile(
              tileColor: PublicController.pc.toggleCardBg(),
              title: Text(
                "The Green Comber,Ireland",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              leading: Icon(
                Icons.location_on,
                color: PublicController.pc.toggleTextColor(),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: PublicController.pc.toggleTextColor(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Playing XI',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                _showSquadsSheet(context);
              },
              tileColor: PublicController.pc.toggleCardBg(),
              title: Text(
                "Northern Knights",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.03),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: PublicController.pc.toggleTextColor(),
              ),
              leading: Image.asset(
                'assets/t20.png',
                height: 20,
                width: 20,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            ListTile(
              onTap: () {
                _showSquadsSheet(context);
              },
              tileColor: PublicController.pc.toggleCardBg(),
              title: Text(
                "Northern Knights",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.03),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: PublicController.pc.toggleTextColor(),
              ),
              leading: Image.asset(
                'assets/t20.png',
                height: 20,
                width: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
            SizedBox(
              height: 10,
            ),
            Expandable(
              backgroundColor: PublicController.pc.toggleCardBg(),
              arrowWidget: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: PublicController.pc.toggleTextColor(),
              ),
              firstChild: Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * .85,
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
                          'BD',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
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
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              secondChild: Column(
                children: [
                  for (var i = 0; i < teamSymbol.length; i++)
                    GestureDetector(
                      onTap: () {
                        Get.to(HomeDetailsScreen(appBarTitle: 'T20 2022'));
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
                                                fontWeight: FontWeight.normal,
                                                fontSize: dSize(.04),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' 188-6',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: dSize(.04),
                                                    color: PublicController.pc
                                                        .toggleTextColor(),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 20.0',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: dSize(.03),
                                                    color: PublicController.pc
                                                        .toggleTextColor(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
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
                                                fontWeight: FontWeight.normal,
                                                fontSize: dSize(.04),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' 188-6',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: dSize(.04),
                                                    color: PublicController.pc
                                                        .toggleTextColor(),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 20.0',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: dSize(.03),
                                                    color: PublicController.pc
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
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0, horizontal: 7),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                          color: teamColors[i],
                                        ),
                                        child: Text(
                                          teamSymbol[i],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Qualifire 1 "),
                                          Text("IPL 2022"),
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
            SizedBox(
              height: 10,
            ),
            Expandable(
              backgroundColor: PublicController.pc.toggleCardBg(),
              arrowWidget: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: PublicController.pc.toggleTextColor(),
              ),
              firstChild: Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * .85,
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
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
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
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              secondChild: Column(
                children: [
                  for (var i = 0; i < teamSymbol.length; i++)
                    GestureDetector(
                      onTap: () {
                        Get.to(HomeDetailsScreen(appBarTitle: 'T20 2022'));
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
                                                fontWeight: FontWeight.normal,
                                                fontSize: dSize(.04),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' 188-6',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: dSize(.04),
                                                    color: PublicController.pc
                                                        .toggleTextColor(),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 20.0',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: dSize(.03),
                                                    color: PublicController.pc
                                                        .toggleTextColor(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
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
                                                fontWeight: FontWeight.normal,
                                                fontSize: dSize(.04),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' 188-6',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: dSize(.04),
                                                    color: PublicController.pc
                                                        .toggleTextColor(),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 20.0',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: dSize(.03),
                                                    color: PublicController.pc
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
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0, horizontal: 7),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                          color: teamColors[i],
                                        ),
                                        child: Text(
                                          teamSymbol[i],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Qualifire 1 "),
                                          Text("IPL 2022"),
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
            ListTile(
              leading: Icon(
                Icons.star_border,
                size: 10,
                color: PublicController.pc.toggleTextColor(),
              ),
              title: Text(
                "Upcoming Matches",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
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
            SizedBox(
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
                      SizedBox(
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
                    SizedBox(
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
            SizedBox(
              height: 10,
            ),
            MoreCard(
                child: Column(
              children: [
                FixturesCardTile(
                  title: 'Indian Premium League',
                  leadingUrlOne: 'assets/indian_flag.png',
                  leadingUrlTwo: 'assets/bd_flag.png',
                  teamOne: 'India',
                  teamTwo: 'Bangladesh',
                  reachTitleOne: '140-5',
                  reachTitleTwo: '188-6',
                  reachSubTitleOne: '16.3',
                  reachSubTitleTwo: '19.3',
                  wonTeam: 'BD Won',
                  byWon: "by 7 wickets",
                  onTap: () {},
                ),
                FixturesCardTile(
                  title: 'Indian Premium League',
                  leadingUrlOne: 'assets/indian_flag.png',
                  leadingUrlTwo: 'assets/bd_flag.png',
                  teamOne: 'India',
                  teamTwo: 'Bangladesh',
                  reachTitleOne: '140-5',
                  reachTitleTwo: '188-6',
                  reachSubTitleOne: '16.3',
                  reachSubTitleTwo: '19.3',
                  wonTeam: 'BD Won',
                  byWon: "by 7 wickets",
                  onTap: () {},
                ),
              ],
            )),
            SizedBox(
              height: 10,
            ),
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
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                'vs all teams',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.03),
                                  color: PublicController.pc.toggleTextColor(),
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
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                'vs all teams',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.03),
                                  color: PublicController.pc.toggleTextColor(),
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
                "Narendra Modi Stadium, Ahmedabad, India",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSquadsSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return const FractionallySizedBox(
                heightFactor: 2.3,
                child: BottomSheetScreen(),
              );
            }));
  }
}
