import 'package:cricland/IPL/view/ipl_page.dart';
import 'package:cricland/home/view/home_page.dart';
import 'package:cricland/more/view/more_page.dart';
import 'package:cricland/news/view/news_page.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeNavPage extends StatefulWidget {
  const HomeNavPage({Key? key}) : super(key: key);
  @override
  State<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage> {
  static const List<Widget> _homeWidgets = [
    HomePage(),
    NewsPage(),
    IPLPage(),
    MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(builder: (pc) {
      pc.toggleStatusBar();
      return Scaffold(
        body: _homeWidgets.elementAt(pc.selectedIndex.value),
        bottomNavigationBar: GetBuilder<LanguageController>(builder: (lc) {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.newspaper),
                label: lc.bottomNews.value,
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.trophy),
                label: lc.bottomIPL.value,
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidChessKnight),
                label: lc.bottomHome.value,
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.ellipsisVertical),
                label: lc.bottomMore.value,
              ),
            ],
            currentIndex: pc.selectedIndex.value,
            onTap: pc.onItemTapped,
          );
        }),
      );
    });
    return Obx(()=>Scaffold(
      body: _homeWidgets.elementAt(PublicController.pc.selectedIndex.value),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidChessKnight),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.trophy),
            label: 'IPL',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ellipsisVertical),
            label: 'More',
          ),
        ],
        currentIndex: PublicController.pc.selectedIndex.value,
        onTap: PublicController.pc.onItemTapped,
      ),
    ));
  }
}
