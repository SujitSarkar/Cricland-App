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
            // appBar: ScrollAppBar(
            //   flexibleSpace: Container(decoration: StDecoration().sliverAppbarGradient),
            //   controller: controller, // Note the controller here
            //   title:  Row(
            //     children: [
            //       Image.asset(
            //         'assets/main_logo.png',
            //
            //         width: 40,
            //         height: 40,
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 8.0, vertical: 2),
            //         child: Text("CrickLand",
            //             style: AppTextStyle().largeTitleStyle.copyWith(
            //               fontSize: dSize(.05),
            //               fontWeight: FontWeight.w500,
            //               color: Colors.white,
            //             )),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //
            //     ],
            //   ),
            //          actions: const [
            //        Icon(
            //             Icons.search_outlined,
            //           ), SizedBox(
            //             width: 15,
            //           ),
            //         ],
            //   bottom: _tabBar(homeController),
            //   // backgroundGradient: const LinearGradient(
            //   //   begin: Alignment.centerLeft,
            //   //   end: Alignment.centerRight,
            //   //   colors: [
            //   //     Colors.red,
            //   //     Colors.green,
            //   //     Colors.blue,
            //   //   ],
            //   // ),
            // ),
            //  body:
            //
            //
            //
            //  ListView(
            //    controller: controller,
            //   children: [
            //
            //     SizedBox(
            //       height: MediaQuery.of(context).size.height*2,
            //       child: TabBarView(
            //         controller: _tabController,
            //         children: const [
            //           LiveTabScreen(),
            //           HomeTabScreen(),
            //           UpComingTabScreen(),
            //           FinishedTabScreen(),
            //           FixturesTabScreen(),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                print(innerBoxIsScrolled);
                return <Widget>[
                  SliverAppBar(
                   // collapsedHeight: 60,
                    toolbarHeight: 50,
                    flexibleSpace: Container(
                        decoration: StDecoration().sliverAppbarGradient),

                    elevation: 0,
                    leading: innerBoxIsScrolled?SizedBox(): Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Image.asset(
                        'assets/main_logo.png',
                      ),
                    ),
                    leadingWidth: 35,
                    title:innerBoxIsScrolled?const SizedBox(): const Text("CrickLand",
                            style: TextStyle(
                              fontSize:20,
                               fontWeight: FontWeight.w500,
                             // color: Colors.white,
                            ),),
                    // Row(
                    //   children: [
                    //
                    //     Text("CrickLand",
                    //         style: TextStyle(
                    //           fontSize:20,
                    //            fontWeight: FontWeight.w500,
                    //          // color: Colors.white,
                    //         )
                    //       // AppTextStyle().largeTitleStyle.copyWith(
                    //       //
                    //       //     ),
                    //     ),
                    //   ],
                    // ),
                    // Text("CrickLand",
                    //     style: TextStyle(
                    //      // color: PublicController.pc.toggleTextColor(),
                    //       fontSize: dSize(.05),
                    //
                    //     )
                    //     // AppTextStyle().largeTitleStyle.copyWith(
                    //     //   fontSize: dSize(.02),
                    //     //   fontWeight: FontWeight.w500,
                    //     //   color: Colors.white,
                    //     // )
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10.0, vertical: 2),
                    //   child: Text("CrickLand",
                    //       style:
                    //       AppTextStyle().largeTitleStyle.copyWith(
                    //         fontSize: dSize(.05),
                    //         fontWeight: FontWeight.w500,
                    //         color: Colors.white,
                    //       )),
                    // ),
                   // Row(
                   //          children: [
                   //            Image.asset(
                   //              'assets/main_logo.png',
                   //              width: 30,
                   //              height: 20,
                   //            ),
                   //
                   //            Padding(
                   //              padding: const EdgeInsets.symmetric(
                   //                  horizontal: 10.0, vertical: 2),
                   //              child: Text("CrickLand",
                   //                  style: TextStyle(fontSize: dSize(.03),
                   //                    fontWeight: FontWeight.w500,
                   //                    color: Colors.white,)
                   //                      // AppTextStyle().largeTitleStyle.copyWith(
                   //                      //
                   //                      //     ),
                   //            ),
                   //            ),
                   //
                   //          ],
                   //        ),
                    pinned: true,
                    floating: true,
                    actions:  [
                      innerBoxIsScrolled?SizedBox(): Icon(
                        Icons.search_outlined,
                      ),
                      innerBoxIsScrolled?SizedBox():    SizedBox(
                        width: 15,
                      ),
                    ],
                    forceElevated: innerBoxIsScrolled,
                    bottom:
                    _tabBar(homeController),
                  ),
                ];
              },
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
