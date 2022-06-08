import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/widgets/slider_card_tile.dart';
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
                      return SliderCardTile(
                        title: 'Indian Premium League',
                        onTap: () {},
                        onStaticTap: () {},
                        leftCountryName: 'Bangladesh',
                        leftCountryOvers: '19.6',
                        leftCountryRuns: '104/6',
                        leftCountryURL: 'assets/bd_flag.png',
                        trailingWidget: 'Upcoming',
                        rightCountryName: 'India',
                        rightCountryOvers: '10.2',
                        rightCountryRuns: '100/10',
                        rightCountryURL: 'assets/indian_flag.png',
                        wonStatus: 'Bangladesh Won by 7 Wickets',
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
                    childAspectRatio: 1.3,
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
                      color: Colors.grey,
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
