import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/details_view/finished_details/finished_tab_page.dart';
import 'package:cricland/home/view/details_view/fixture_details/fixtures_tab_page.dart';
import 'package:cricland/home/view/details_view/home_details/home_tab_page.dart';
import 'package:cricland/home/view/details_view/live_details/live_tab_page.dart';
import 'package:cricland/home/view/details_view/upcoming_details/upcomming_tab_page.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        autoRemove: true,
        builder: (homeController) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    scale: 14,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2),
                    child: Text("CrickLand",
                        style: CLTextStyle.nameTextStyle.copyWith(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border:
                            Border.all(width: 1, color: AllColor.hintColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: Text(
                        "Premium",
                        style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        // style: TextStyle(

                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: const [
                Icon(
                  Icons.search_outlined,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.person,
                  size: 30,
                ),
                SizedBox(
                  width: 8,
                ),
              ],
              bottom: _tabBar(homeController),
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                LiveTabScreen(),
                HomeTabScreen(),
                UpComingTabScreen(),
                FinishedTabScreen(),
                FixturesTabScreen(),
              ],
            ),
          );
        });
  }

  PreferredSize _tabBar(HomeController homeController) => PreferredSize(
        preferredSize: Size.fromHeight(dSize(.04)),
        child: TabBar(
            onTap: (covariant) async {
              setState(() => _tabController.index = covariant);
            },
            isScrollable: true,
            controller: _tabController,
            labelColor: PublicController.pc.toggleLoadingColor(),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  dSize(.02),
                ),
                topRight: Radius.circular(
                  dSize(.02),
                ),
              ),
              color: PublicController.pc.toggleTabColor(),
            ),
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: CLTextStyle.optionTextStyle,
            labelStyle: CLTextStyle.optionTextStyle,
            indicatorSize: TabBarIndicatorSize.label,
            physics: const BouncingScrollPhysics(),
            tabs: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: dSize(.01),
                    horizontal: dSize(.02),
                  ),
                  child: Text(
                    'Live (${homeController.liveMatchesModel.typeMatches != null ? homeController.liveMatchesModel.typeMatches!.length : "0"})',
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: dSize(.01),
                  horizontal: dSize(.02),
                ),
                child: const Text('Home'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: dSize(.01),
                  horizontal: dSize(.02),
                ),
                child: const Text('Upcoming'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: dSize(.01),
                  horizontal: dSize(.02),
                ),
                child: const Text('Finished'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: dSize(.01),
                  horizontal: dSize(.02),
                ),
                child: const Text('Fixtures'),
              ),
            ]),
      );
}
