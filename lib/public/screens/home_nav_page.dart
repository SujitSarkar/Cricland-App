import 'package:cricland/IPL/view/series_screen.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/home/view/home_page.dart';
import 'package:cricland/more/view/more_page.dart';
import 'package:cricland/news/view/news_page.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../variables/colors.dart';
import '../widgets/decoration.dart';

class HomeNavPage extends StatefulWidget {
  const HomeNavPage({Key? key}) : super(key: key);
  @override
  State<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage> {
  static const List<Widget> _homeWidgets = [
    AuthScreen(),
    IPLPage(),
    MatchPage(),
    TrendingPage(),
    MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(builder: (pc) {
      final LanguageController lc = Get.find();
      return Obx(() => Scaffold(
            body: _homeWidgets.elementAt(pc.selectedIndex.value),
            bottomNavigationBar: Obx(() => Material(
                  color: PublicController.pc.toggleCardBg(),
                  child: BottomNavigationBar(
                      selectedLabelStyle: AppTextStyle().paragraphTextStyle,
                      unselectedLabelStyle: AppTextStyle().paragraphTextStyle,
                      items: [
                        BottomNavigationBarItem(
                          icon: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) => pc.tabIconList
                                        .elementAt(pc.selectedIndex.value) ==
                                    Icons.person
                                ? StDecoration()
                                    .tabBarGradient
                                    .createShader(bounds)
                                : LinearGradient(
                                        colors: StDecoration()
                                            .navBarUnselectedIconColor)
                                    .createShader(bounds),
                            child: const Icon(Icons.person, size: 30),
                          ),
                          label: lc.languageModel.value.profile,
                        ),
                        BottomNavigationBarItem(
                          icon: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) => pc.tabIconList
                                        .elementAt(pc.selectedIndex.value) ==
                                    FontAwesomeIcons.trophy
                                ? StDecoration()
                                    .tabBarGradient
                                    .createShader(bounds)
                                : LinearGradient(
                                        colors: StDecoration()
                                            .navBarUnselectedIconColor)
                                    .createShader(bounds),
                            child:
                                const Icon(FontAwesomeIcons.trophy, size: 24),
                          ),
                          label: lc.languageModel.value.ipl,
                        ),
                        BottomNavigationBarItem(
                          icon: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) => pc.tabIconList
                                        .elementAt(pc.selectedIndex.value) ==
                                    Icons.sports_cricket
                                ? StDecoration()
                                    .tabBarGradient
                                    .createShader(bounds)
                                : LinearGradient(
                                        colors: StDecoration()
                                            .navBarUnselectedIconColor)
                                    .createShader(bounds),
                            child: const Icon(Icons.sports_cricket, size: 30),
                          ),
                          label: lc.languageModel.value.match,
                        ),
                        BottomNavigationBarItem(
                          icon: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) => pc.tabIconList
                                        .elementAt(pc.selectedIndex.value) ==
                                    FontAwesomeIcons.newspaper
                                ? StDecoration()
                                    .tabBarGradient
                                    .createShader(bounds)
                                : LinearGradient(
                                        colors: StDecoration()
                                            .navBarUnselectedIconColor)
                                    .createShader(bounds),
                            child: const Icon(FontAwesomeIcons.newspaper,
                                size: 24),
                          ),
                          label: lc.languageModel.value.trending,
                        ),
                        BottomNavigationBarItem(
                          icon: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) => pc.tabIconList
                                        .elementAt(pc.selectedIndex.value) ==
                                    FontAwesomeIcons.ellipsisVertical
                                ? StDecoration()
                                    .tabBarGradient
                                    .createShader(bounds)
                                : LinearGradient(
                                        colors: StDecoration()
                                            .navBarUnselectedIconColor)
                                    .createShader(bounds),
                            child: const Icon(FontAwesomeIcons.ellipsisVertical,
                                size: 24),
                          ),
                          label: lc.languageModel.value.more,
                        ),
                      ],
                      currentIndex: pc.selectedIndex.value,
                      onTap: pc.onItemTapped),
                )),
          ));
    });
  }
}
