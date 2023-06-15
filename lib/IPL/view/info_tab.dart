import 'package:cricland/IPL/view/widgets/info_card_tile.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../home/controller/home_controller.dart';

class SeriesInfoTab extends StatefulWidget {
  final ScrollController scrollController;
  const SeriesInfoTab({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _InfoTabState createState() => _InfoTabState();
}

class _InfoTabState extends State<SeriesInfoTab> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: MoreCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCardTile(
                  series: "seriesName",
                  duration: "status",
                  format: "matchDesc",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
