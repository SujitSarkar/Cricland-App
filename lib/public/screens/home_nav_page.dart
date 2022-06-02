import 'package:cricland/IPL/view/ipl_page.dart';
import 'package:cricland/home/view/home_page.dart';
import 'package:cricland/more/view/more_page.dart';
import 'package:cricland/news/view/news_page.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../variables/colors.dart';

class HomeNavPage extends StatefulWidget {
  const HomeNavPage({Key? key}) : super(key: key);
  @override
  State<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage> {
  static const List<Widget> _homeWidgets = [
    NewsPage(),
    IPLPage(),
    HomePage(),
    MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(builder: (pc) {
      return Scaffold(
        body: _homeWidgets.elementAt(pc.selectedIndex.value),
        bottomNavigationBar: Obx(() =>  BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.trophy),
              label: 'IPL',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidChessKnight),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.ellipsisVertical),
              label: 'More',
            ),
          ],
          currentIndex: pc.selectedIndex.value,
          onTap: pc.onItemTapped,
          backgroundColor: AllColor.primaryColor,
        )),
      );
    });
  }
}
