import 'package:cricland/home/controller/data_fetcher.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/finished_tab_page.dart';
import 'package:cricland/home/view/fixtures_tab_page.dart';
import 'package:cricland/home/view/home_tab_page.dart';
import 'package:cricland/home/view/live_tab_page.dart';
import 'package:cricland/home/view/upcomming_tab_page.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _iplTabType = Variables.homeTabsCategory.first;

  DataFetcher _dataFetcher = DataFetcher();

  @override
  void initState() {
    _dataFetcher.fetchMatches(productType: 0, countryID: 'countryID');
    super.initState();
    _tabController =
        TabController(length: Variables.homeTabsCategory.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Text(
                "CrickLand",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(width: 1, color: AllColor.hintColor)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Text(
                  "Premium",
                  style: TextStyle(
                    fontSize: dSize(.04),
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
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
        bottom: _tabBar(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          LiveTabScreen(),
          HomeTabScreen(),
          UpComingTabScreen(),
          FinishedTabScreen(),
          FixturesTabScreen(),
        ],
      ),
    );
  }

  PreferredSize _tabBar() => PreferredSize(
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
                  topLeft: Radius.circular(dSize(.02)),
                  topRight: Radius.circular(dSize(.02))),
              color: PublicController.pc.toggleTabColor()),
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          physics: const BouncingScrollPhysics(),
          tabs: Variables.homeTabsCategory
              .map<Widget>((String item) => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.01), horizontal: dSize(.02)),
                    child: Text(item),
                  ))
              .toList(),
        ),
      );
}
