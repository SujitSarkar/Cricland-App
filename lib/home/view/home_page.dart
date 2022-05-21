import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/finished_tab_page.dart';
import 'package:cricland/home/view/fixtures_tab_page.dart';
import 'package:cricland/home/view/home_tab_page.dart';
import 'package:cricland/home/view/live_tab_page.dart';
import 'package:cricland/home/view/upcomming_tab_page.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      animationDuration: Duration(milliseconds: 300),
      child: Scaffold(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Text(
                  "CrickLand",
                  style: TextStyle(
                    fontSize: dSize(.04),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor(),
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
                      color: PublicController.pc.toggleTextColor(),
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
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Live (1)",
              ),
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Upcoming",
              ),
              Tab(
                text: "Finished",
              ),
              Tab(
                text: "Fixtures",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LiveTabScreen(),
            HomeTabScreen(),
            UpComingTabScreen(),
            FinishedTabScreen(),
            FixturesTabScreen(),
          ],
        ),
      ),
    );
  }
}
