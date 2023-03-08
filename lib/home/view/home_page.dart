import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/home/view/details_view/finished_details/finished_tab_page.dart';
import 'package:cricland/home/view/details_view/fixture_details/fixtures_tab_page.dart';
import 'package:cricland/home/view/details_view/home_details/home_tab_page.dart';
import 'package:cricland/home/view/details_view/live_details/live_tab_page.dart';
import 'package:cricland/home/view/details_view/upcoming_details/upcomming_tab_page.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:cricland/public/widgets/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
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
    return GetBuilder<HomeController>(
        init: HomeController(),
        autoRemove: true,
        builder: (homeController) {
          return Scaffold(
            appBar: ScrollAppBar(
              flexibleSpace: Container(decoration: StDecoration().sliverAppbarGradient),
              excludeHeaderSemantics: true,
              controller: controller,
              leading: Padding(
                padding:  EdgeInsets.only(left: dSize(.03),top: dSize(.03),bottom: dSize(.03)),
                child: Image.asset(
                  'assets/main_logo.png',

                ),
              ),
              title:  Text("Cricland",
                style: TextStyle(
                  fontSize:dSize(.05),
                  fontWeight: FontWeight.w500,
                  // color: Colors.white,
                ),),
              actions:  [
                Icon(
                  Icons.search_outlined,
                ),
             SizedBox(
                  width: dSize(.05),
                ),
              ],
              // bottom:
              // _tabBar(homeController),
            ),

            body:


            Column(
              children: [
                Container(
                    decoration: StDecoration().sliverAppbarGradient,

                    child: Padding(
                      padding:  EdgeInsets.only(top: dSize(.06)),
                      child: _tabBar(homeController),
                    )),
                Expanded(
                  child: TabBarView(
                  controller: _tabController,
                  children:  [
                    LiveTabScreen(),
                    HomeTabScreen(scrollController: controller,),
                    UpComingTabScreen(),
                    FinishedTabScreen(),
                    FixturesTabScreen(),
                  ],
          ),
                ),
              ],
            ),
          );
        });
  }

  PreferredSize _tabBar(HomeController homeController) => PreferredSize(
        preferredSize: Size.fromHeight(dSize(.09)),
        child: Column(
          children: [
            TabBar(
                onTap: (covariant) async {
                  setState(() => _tabController.index = covariant);


                },
                isScrollable: true,
                controller: _tabController,
                labelColor: PublicController.pc.toggleLoadingColor(),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dSize(.02)),
                    topRight: Radius.circular(dSize(.02)),
                  ),
                  color: PublicController.pc.toggleTabColor(),
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
                      child: const Text(
                        'Live ( 0 )',
                        // 'Live (${homeController.liveMatchesModel.typeMatches != null ? homeController.liveMatchesModel.typeMatches!.length : "0"})',
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
          ],
        ),
      );
}
