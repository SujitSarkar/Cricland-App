import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/home_details_screen.dart';
import 'package:cricland/home/view/widgets/live_cart_tile.dart';
import 'package:cricland/home/view/widgets/upcoming_card_tile.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UpComingTabScreen extends StatefulWidget {
  const UpComingTabScreen({Key? key}) : super(key: key);

  @override
  _UpComingTabScreenState createState() => _UpComingTabScreenState();
}

class _UpComingTabScreenState extends State<UpComingTabScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Container(
        padding: EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              "Today",
              style: TextStyle(
                  fontSize: dSize(.045),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor()),
            ),
            SizedBox(
              height: 12,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: homeController.upcomingMatchModel.typeMatches!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return UpcomingCardTile(
                  onTap: () {
                    Get.to(
                      HomeDetailsScreen(
                        appBarTitle: 'IPL 2022',
                        matchIndex: index,
                        teamS2Name: '',
                        teamS1Name: '',
                        team2Name: '',
                        team1Name: '',
                        stateTitle: '',
                      ),
                    );
                  },
                  title:
                      "${homeController.upcomingMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.seriesName}",
                  rightCountryURL:
                      '${homeController.upcomingMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team2!.imageId}',
                  leftCountryURL:
                      '${homeController.upcomingMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team1!.imageId}',
                  leftCountryName:
                      '${homeController.upcomingMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team1!.teamSName}',
                  rightCountryName:
                      '${homeController.upcomingMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.team2!.teamSName}',
                  startTime:
                      '${homeController.upcomingMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.startDate}',
                  status:
                      '${homeController.upcomingMatchModel.typeMatches![index].seriesMatches!.first.seriesAdWrapper!.matches!.first.matchInfo!.state}',
                );
                //LiveCart(context);
              },
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      );
    });
  }
}
