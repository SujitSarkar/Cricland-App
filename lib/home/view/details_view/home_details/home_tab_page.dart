import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/details_view/home_details/home_details_screen.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../public/controller/language_controller.dart';
import '../../monk_view/monk_live_tile.dart';

class HomeTabScreen extends StatefulWidget {
  final ScrollController scrollController;
  const HomeTabScreen({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

final themeMode = ValueNotifier(2);

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    final LanguageController lc = Get.find();
    return GetBuilder<HomeController>(builder: (homeController) {
      return NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          print(notification.metrics.pixels);

          if (notification.metrics.pixels > 50) {
            homeController.setScroll(true.obs);
          } else {
            homeController.setScroll(false.obs);
          }
          return true;
        },
        child: SingleChildScrollView(
          controller: widget.scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                homeController.loading()
                    ? Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: dSize(.7)),
                        child: const CircularProgressIndicator(),
                      ))
                    : homeController.matchListForHome.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                                child: Text(
                              "There are currently no live matches",
                              style: AppTextStyle().bodyTextStyle,
                            )),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: homeController.matchListForHome.length,
                            shrinkWrap: true,
                            itemBuilder: (context, liveIndex) {
                              return MonkLiveTile(
                                onTap: () {
                                  //print("object");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => HomeDetailsScreen(
                                        liveObjectData: homeController
                                            .matchListForHome[liveIndex],
                                        scrollController:
                                            widget.scrollController,
                                      ),
                                    ),
                                  );
                                },
                                liveObjectData:
                                    homeController.matchListForHome[liveIndex],
                                liveIndex: liveIndex,
                                scrollController: widget.scrollController,
                              );
                            }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
