import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

final themeMode = ValueNotifier(2);
final List<String> itemList = [
  'https://www.kidlink.org/icons/f0-at.gif',
  'https://www.kidlink.org/icons/f0-ag.gif',
  'https://www.kidlink.org/icons/f0-ar.gif',
  'https://www.kidlink.org/icons/f0-ao.gif',
  'https://www.kidlink.org/icons/f0-am.gif',
  'https://www.kidlink.org/icons/f0-aw.gif',
  'https://www.kidlink.org/icons/f0-bd.gif',
  'https://www.kidlink.org/icons/f0-au.gif',
  'https://www.kidlink.org/icons/f0-al.gif',
  'https://www.kidlink.org/icons/f0-bs.gif',
];
final List<String> countryNameList = [
  'Austria',
  'Barbuda',
  'Argentina',
  'Angola',
  'Armenia',
  'Aruba',
  'Bangladesh',
  'Australia',
  'Albania',
  'Bahamas',
];

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: CarouselSlider(
                options: CarouselOptions(height: 220.0, autoPlay: true),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: PublicController.pc.toggleCardBg(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Indian Premium league",
                                    style: TextStyle(
                                      fontSize: dSize(.04),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 5),
                                      child: Text(
                                        "Upcoming",
                                        style: TextStyle(
                                          fontSize: dSize(.03),
                                          fontWeight: FontWeight.w500,
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Divider(
                                  height: 1,
                                ),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/bd_flag.png',
                                        scale: 10,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Bangladesh',
                                            style: TextStyle(
                                              fontSize: dSize(.04),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                          ),
                                          Text(
                                            '216/9',
                                            style: TextStyle(
                                              fontSize: dSize(.04),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                          ),
                                          Text(
                                            '49.6 ov.',
                                            style: TextStyle(
                                              fontSize: dSize(.03),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'VS',
                                        style: TextStyle(
                                          fontSize: dSize(.05),
                                          fontWeight: FontWeight.w500,
                                          color: PublicController.pc
                                              .toggleTextColor(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'India',
                                            style: TextStyle(
                                              fontSize: dSize(.04),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                          ),
                                          Text(
                                            '216/9',
                                            style: TextStyle(
                                              fontSize: dSize(.04),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                          ),
                                          Text(
                                            '49.6 ov.',
                                            style: TextStyle(
                                              fontSize: dSize(.03),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset(
                                        'assets/indian_flag.png',
                                        scale: 4,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                'Bangladesh Won by 5 wickets',
                                style: TextStyle(
                                  fontSize: dSize(.03),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: Text(
                                    "Live Statistic",
                                    style: TextStyle(
                                      fontSize: dSize(.04),
                                      fontWeight: FontWeight.w500,
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Featured Series',
              style: TextStyle(
                fontSize: dSize(.04),
                fontWeight: FontWeight.w500,
                color: PublicController.pc.toggleTextColor(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          itemList[index],
                          fit: BoxFit.fill,
                          scale: .15,
                        ),
                        Text(
                          countryNameList[index],
                          style: TextStyle(
                            fontSize: dSize(.04),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                }),
            Text(
              'Play Games',
              style: TextStyle(
                fontSize: dSize(.045),
                fontWeight: FontWeight.w500,
                color: PublicController.pc.toggleTextColor(),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                            leading: Image.network(
                              itemList[index],
                              fit: BoxFit.fill,
                              height: 50,
                              width: 50,
                            ),
                            trailing: TextButton(
                              onPressed: () {},
                              child: Text(
                                "PLAY",
                                style: TextStyle(
                                  fontSize: dSize(.04),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ),
                            title: Text(
                              "Online Game",
                              style: TextStyle(
                                fontSize: dSize(.04),
                                fontWeight: FontWeight.w500,
                                color: PublicController.pc.toggleTextColor(),
                              ),
                            )),
                        Divider(
                          height: 5,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
