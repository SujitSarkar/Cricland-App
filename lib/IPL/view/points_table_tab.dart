import 'package:cricland/home/view/widgets/point_table_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/controller/home_controller.dart';
import '../../home/model/custom_widget/constants.dart';

class SeriesPointsTableTab extends StatefulWidget {
  const SeriesPointsTableTab({Key? key}) : super(key: key);

  @override
  _PointsTableTabState createState() => _PointsTableTabState();
}

class _PointsTableTabState extends State<SeriesPointsTableTab> {
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    HomeController homeController = Get.put(HomeController());
    await homeController.getPointTable('3718');
    if (mounted) {
      setState(() {});
    }
  }
  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032), color: PublicController.pc.toggleTextColor());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Points Table",
                    style:_textStyle.copyWith(
                      fontSize: dSize(.035),
                      fontWeight: FontWeight.bold,
                      color: PublicController.pc
                          .toggleLoadingColor(),),
                ),
                // Row(
                //   children: [
                //     Text(
                //       'Team Form',
                //       style: TextStyle(
                //         fontWeight: FontWeight.normal,
                //         fontSize: dSize(.04),
                //         color: PublicController.pc.toggleTextColor(),
                //       ),
                //     ),
                //     Transform.scale(
                //       scale: 1,
                //       child: Switch(
                //         onChanged: toggleSwitch,
                //         value: isSwitched,
                //         activeColor: Colors.blue,
                //         activeTrackColor: Colors.yellow,
                //         inactiveThumbColor: Colors.white70,
                //         inactiveTrackColor: Colors.grey,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            PointTableTile(),
          ],
        ),
      ),
    );
  }
}
