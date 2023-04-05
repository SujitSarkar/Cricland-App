import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/details_view/finished_details/finished_tab_page.dart';
import 'package:cricland/home/view/details_view/fixture_details/fixtures_tab_page.dart';
import 'package:cricland/home/view/details_view/home_details/home_tab_page.dart';
import 'package:cricland/home/view/details_view/live_details/live_tab_page.dart';
import 'package:cricland/home/view/details_view/upcoming_details/upcomming_tab_page.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/public/widgets/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../public/controller/language_controller.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: Variables.homeTabsCategory.length,
      vsync: this,
      initialIndex: 1,
    );
  }

  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final LanguageController lc = Get.find();
    return GetBuilder<HomeController>(
        init: HomeController(),
        autoRemove: true,
        builder: (homeController) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                    decoration: StDecoration().sliverAppbarGradient,
                    child: Padding(
                      padding: EdgeInsets.only(top: dSize(.06)),
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: homeController.isScroll == true.obs
                                  ? 0.0
                                  : 50.0,
                              curve: Curves.fastOutSlowIn,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: dSize(.03),
                                          top: dSize(.05),
                                        ),
                                        child: Image.asset(
                                          'assets/main_logo.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: dSize(.04),
                                          left: dSize(.03),
                                        ),
                                        child: Text(
                                          "Cricland",
                                          style: TextStyle(
                                              fontSize: dSize(.05),
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // const Padding(
                                  //   padding: EdgeInsets.all(8.0),
                                  //   child: Icon(Icons.search_outlined,
                                  //       color: Colors.white),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: dSize(.03),
                            ),
                            _tabBar(homeController, lc),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      LiveTabScreen(
                        scrollController: controller,
                      ),
                      HomeTabScreen(
                        scrollController: controller,
                      ),
                      UpComingTabScreen(
                        scrollController: controller,
                      ),
                      FinishedTabScreen(
                        scrollController: controller,
                      ),
                      FixturesTabScreen(
                        scrollController: controller,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  PreferredSize _tabBar(HomeController homeController, LanguageController lc) =>
      PreferredSize(
        preferredSize: Size.fromHeight(dSize(2)),
        child: Column(
          children: [
            TabBar(
                onTap: (covariant) async {
                  setState(() => _tabController.index = covariant);

                  print(PublicController.pc.isLight);
                },
                isScrollable: true,
                controller: _tabController,
                labelColor: PublicController.pc.toggleLoadingColor(),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dSize(.02)),
                    topRight: Radius.circular(dSize(.02)),
                  ),
                  gradient: !PublicController.pc.isLight.value
                      ? StDecoration().tabBarGradient
                      : null,
                  color: PublicController.pc.toggleTabColor(),
                  // color: PublicController.pc.isLight.value
                  //     ? PublicController.pc.toggleTabColor()
                  //     : Colors.white,
                ),
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle: AppTextStyle().largeTitleStyle,
                labelStyle: AppTextStyle().largeTitleStyle,
                indicatorSize: TabBarIndicatorSize.label,
                physics: const BouncingScrollPhysics(),
                tabs: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: dSize(.01),
                        horizontal: dSize(.02),
                      ),
                      child: Text(
                        lc.languageModel.value.live!,
                        // 'Live (${homeController.liveMatchesModel.typeMatches != null ? homeController.liveMatchesModel.typeMatches!.length : "0"})',
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: dSize(.01),
                      horizontal: dSize(.02),
                    ),
                    child: Text(
                      lc.languageModel.value.home!,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: dSize(.01),
                      horizontal: dSize(.02),
                    ),
                    child: Text(
                      lc.languageModel.value.upcoming!,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: dSize(.01),
                      horizontal: dSize(.02),
                    ),
                    child: Text(
                      lc.languageModel.value.finished!,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: dSize(.01),
                      horizontal: dSize(.02),
                    ),
                    child: Text(
                      lc.languageModel.value.fixtures!,
                    ),
                  ),
                ]),
          ],
        ),
      );
}
