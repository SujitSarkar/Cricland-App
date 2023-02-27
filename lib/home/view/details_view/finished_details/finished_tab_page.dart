import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/home/view/widgets/finished_card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/upcoming_card_tile.dart';
import '../home_details/home_details_screen.dart';

class FinishedTabScreen extends StatefulWidget {
  const FinishedTabScreen({Key? key}) : super(key: key);

  @override
  _FinishedTabScreenState createState() => _FinishedTabScreenState();
}

class _FinishedTabScreenState extends State<FinishedTabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today,24 February", style: AppTextStyle().titleTextStyle),

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeController.rapidRecentList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FinishedCardTile(
                    rapidMatch: homeController.rapidRecentList[index],
                  );
                },
              ),

              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      );
    });
  }
}
