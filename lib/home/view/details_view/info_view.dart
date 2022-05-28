import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';

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
      child: Column(
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
            leading: Icon(Icons.radio_button_checked),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
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
            height: 10,
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
            firstChild: Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * .9,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: PublicController.pc.toggleCardBg(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                fontWeight: FontWeight.normal,
                                                fontSize: dSize(.04),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 20.0',
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
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
                                                fontWeight: FontWeight.normal,
                                                fontSize: dSize(.04),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 20.0',
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
          ),
          Expandable(
            firstChild: Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * .9,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: PublicController.pc.toggleCardBg(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                fontWeight: FontWeight.normal,
                                                fontSize: dSize(.04),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 20.0',
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
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
                                                fontWeight: FontWeight.normal,
                                                fontSize: dSize(.04),
                                                color: PublicController.pc
                                                    .toggleTextColor(),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 20.0',
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
