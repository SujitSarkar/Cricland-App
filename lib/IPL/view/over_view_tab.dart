import 'package:cricland/IPL/view/details_view/key_state_screen.dart';
import 'package:cricland/IPL/view/widgets/featured_match_tile.dart';
import 'package:cricland/IPL/view/widgets/info_card_tile.dart';
import 'package:cricland/home/view/home_details_screen.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class OverViewTab extends StatefulWidget {
  const OverViewTab({Key? key}) : super(key: key);

  @override
  _OverViewTabState createState() => _OverViewTabState();
}

class _OverViewTabState extends State<OverViewTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Matches",
                  style: TextStyle(
                    fontSize: dSize(.04),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "All Matches >",
                    style: TextStyle(
                      fontSize: dSize(.04),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                )
              ],
            ),
            ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return FeaturedMatchTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeDetailsScreen(
                              appBarTitle: 'GT vs RR, Final'),
                        ),
                      );
                    },
                    title: '',
                  );
                }),
            ListTile(
                leading: Text(
                  "Key Stats",
                  style: TextStyle(
                    fontSize: dSize(.04),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => KeyStateScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "See All >",
                    style: TextStyle(
                      fontSize: dSize(.04),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i <= 5; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .92,
                        decoration: BoxDecoration(
                          color: PublicController.pc.toggleCardBg(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Most Runs >",
                                    style: TextStyle(
                                      fontSize: dSize(.035),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/player.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "P Cummins",
                                            style: TextStyle(
                                              fontSize: dSize(.04),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                          ),
                                          Text(
                                            "kalkata Knight Riders",
                                            style: TextStyle(
                                              fontSize: dSize(.025),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "863",
                                    style: TextStyle(
                                      fontSize: dSize(.06),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Text(
                                    "Runs",
                                    style: TextStyle(
                                      fontSize: dSize(.03),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Most Wickets >",
                            style: TextStyle(
                              fontSize: dSize(.03),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/player.png',
                                height: 60,
                                width: 60,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "RR",
                                    style: TextStyle(
                                      fontSize: dSize(.03),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Text(
                                    "Y Chahal",
                                    style: TextStyle(
                                      fontSize: dSize(.04),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.green,
                            height: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "27 Wickets",
                            style: TextStyle(
                              fontSize: dSize(.05),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Most Wickets >",
                            style: TextStyle(
                              fontSize: dSize(.03),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/player.png',
                                height: 60,
                                width: 60,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "RR",
                                    style: TextStyle(
                                      fontSize: dSize(.03),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Text(
                                    "Y Chahal",
                                    style: TextStyle(
                                      fontSize: dSize(.04),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.green,
                            height: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "27 Wickets",
                            style: TextStyle(
                              fontSize: dSize(.05),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Highest Score >",
                                style: TextStyle(
                                  fontSize: dSize(.035),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Q de kock",
                                    style: TextStyle(
                                      fontSize: dSize(.04),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Text(
                                    "LSG",
                                    style: TextStyle(
                                      fontSize: dSize(.025),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "863",
                                style: TextStyle(
                                  fontSize: dSize(.06),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                "Runs",
                                style: TextStyle(
                                  fontSize: dSize(.03),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Most Sixes >",
                                style: TextStyle(
                                  fontSize: dSize(.035),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "J Buttler",
                                    style: TextStyle(
                                      fontSize: dSize(.04),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Text(
                                    "RR",
                                    style: TextStyle(
                                      fontSize: dSize(.025),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "45",
                                style: TextStyle(
                                  fontSize: dSize(.06),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                "Sixes",
                                style: TextStyle(
                                  fontSize: dSize(.03),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Text(
                "Team Squads",
                style: TextStyle(
                  fontSize: dSize(.035),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i <= 5; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: PublicController.pc.toggleCardBg(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/t20.png',
                                height: 80,
                                width: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "MI",
                                style: TextStyle(
                                  fontSize: dSize(.04),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ListTile(
              leading: Text(
                "Series Info",
                style: TextStyle(
                  fontSize: dSize(.035),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            InfoCardTile(
              title: '',
              onTap: () {},
            ),
            ListTile(
              leading: Text(
                "More Seasons",
                style: TextStyle(
                  fontSize: dSize(.035),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'IPL 2022',
                      style: TextStyle(
                        fontSize: dSize(.035),
                        fontWeight: FontWeight.w500,
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: PublicController.pc.toggleTextColor())),
                  );
                }),
          ],
        ),
      ),
    );
  }
}