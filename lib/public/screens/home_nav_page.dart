import 'package:cricland/IPL/view/series_screen.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/home_page.dart';
import 'package:cricland/more/view/more_page.dart';
import 'package:cricland/news/view/news_page.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/screens/auth_screen.dart';
import 'package:cricland/public/screens/profile_screen.dart';
import 'package:cricland/public/screens/signup_screen.dart';
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
    AuthScreen(),
    SeriesScreen(),
    HomePage(),
    NewsPage(),
    MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(builder: (pc) {
      return Scaffold(
        body: _homeWidgets.elementAt(pc.selectedIndex.value),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              selectedLabelStyle: CLTextStyle.menuBarTextStyle,
              unselectedLabelStyle: CLTextStyle.menuBarTextStyle,
              items:  [
                const BottomNavigationBarItem(
                  icon:         Icon(
                    Icons.person,
                    size: 30,
                  ),
                  label: 'Profile',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.trophy),
                  label: 'IPL',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/match_logo.png',height: 30,width: 30,color: pc.selectedIndex.value==2? AllColor.blueColor:Colors.grey,),

                  label: 'Match',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.newspaper),
                  label: 'Trending',
                ),
                const BottomNavigationBarItem(
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
