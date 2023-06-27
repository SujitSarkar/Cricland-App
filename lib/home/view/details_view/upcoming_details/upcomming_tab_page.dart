import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/view/details_view/home_details/home_details_screen.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../public/variables/config.dart';
import '../../monk_view/monk_live_tile.dart';

class UpComingTabScreen extends StatefulWidget {
  final ScrollController scrollController;
  const UpComingTabScreen({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _UpComingTabScreenState createState() => _UpComingTabScreenState();
}

class _UpComingTabScreenState extends State<UpComingTabScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              homeController.matchListForUpcoming.isEmpty
                  ? SizedBox()
                  : Text(DateFormat('dd MMM yyyy').format(DateTime.now()),
                      style: AppTextStyle().titleTextStyle),
              homeController.loading()
                  ? Center(
                      child: Padding(
                      padding: EdgeInsets.only(top: dSize(.7)),
                      child: const CircularProgressIndicator(),
                    ))
                  : homeController.matchListForUpcoming.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(top: dSize(.7)),
                          child: Center(
                              child: Text(
                            "There are currently no live matches",
                            style: AppTextStyle().bodyTextStyle,
                          )),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: homeController.matchListForUpcoming.length,
                          shrinkWrap: true,
                          itemBuilder: (context, liveIndex) {
                            return MonkLiveTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => HomeDetailsScreen(
                                      liveObjectData: homeController
                                          .matchListForUpcoming[liveIndex],
                                      scrollController: widget.scrollController,
                                    ),
                                  ),
                                );
                              },
                              liveObjectData: homeController
                                  .matchListForUpcoming[liveIndex],
                              liveIndex: liveIndex,
                              scrollController: widget.scrollController,
                            );
                          }),
              const SizedBox(height: 12)
            ]),
          ),
        ),
      );
    });
  }
}
