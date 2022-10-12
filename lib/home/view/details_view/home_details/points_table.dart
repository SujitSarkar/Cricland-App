import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/widgets/point_table_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../public/controller/public_controller.dart';
import '../../../../public/variables/config.dart';
import '../../../controller/home_controller.dart';

class PointTableView extends StatefulWidget {
  final String seriesId;
  final String matchId;
  const PointTableView(
      {Key? key, required this.seriesId, required this.matchId})
      : super(key: key);

  @override
  _PointTableViewState createState() => _PointTableViewState();
}

class _PointTableViewState extends State<PointTableView> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    HomeController homeController = Get.put(HomeController());
    await homeController.getPointTable('4527');
    if (mounted) {
      setState(() {});
    }
  }

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
                  style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  ),
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
            PointTableTile(
              onTap: () {},
              title: '',
            ),
          ],
        ),
      ),
    );
  }
}
