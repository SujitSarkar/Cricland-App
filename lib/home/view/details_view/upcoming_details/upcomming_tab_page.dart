import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/home/view/details_view/home_details/home_details_screen.dart';
import 'package:cricland/home/view/widgets/upcoming_card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'upcoming_details_screen.dart';

class UpComingTabScreen extends StatefulWidget {
  const UpComingTabScreen({Key? key}) : super(key: key);

  @override
  _UpComingTabScreenState createState() => _UpComingTabScreenState();
}

class _UpComingTabScreenState extends State<UpComingTabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

             Text("Today,24 February", style: AppTextStyle().titleTextStyle),

            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeController.rapidUpcomingList.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return UpcomingCardTile(
                  rapidMatch: homeController.rapidUpcomingList[index],

                );

                //LiveCart(context);
              },
            ),
            const SizedBox(height: 12)
          ]),
        ),
      );
    });
  }
}
