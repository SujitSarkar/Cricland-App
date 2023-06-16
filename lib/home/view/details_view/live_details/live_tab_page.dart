import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../public/widgets/app_text_style.dart';
import '../../monk_view/monk_live_tile.dart';

class LiveTabScreen extends StatefulWidget {
  final ScrollController scrollController;
  const LiveTabScreen({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _LiveTabScreenState createState() => _LiveTabScreenState();
}

class _LiveTabScreenState extends State<LiveTabScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TextButton(
                //   onPressed: () {
                //     fetchData();
                //   },
                //   child: const Text("Live Data"),
                // ),
                homeController.loading()
                    ? Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: dSize(.7)),
                        child: const CircularProgressIndicator(),
                      ))
                    : homeController.matchListForLive.isEmpty
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
                            itemCount: homeController.matchListForLive.length,
                            shrinkWrap: true,
                            itemBuilder: (context, liveIndex) {
                              return MonkLiveTile(
                                liveObjectData:
                                    homeController.matchListForLive[liveIndex],
                                liveIndex: liveIndex,
                                scrollController: widget.scrollController,
                              );
                            }),
              ],
            ),
          ),
        );
      },
    );
  }
}
