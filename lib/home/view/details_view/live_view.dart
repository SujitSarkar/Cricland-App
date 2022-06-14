import 'package:cricland/IPL/view/details_view/live_progeress_bottom_sheet.dart';
import 'package:cricland/home/view/widgets/batter_card.dart';
import 'package:cricland/home/view/widgets/bowler_card_tile.dart';
import 'package:cricland/home/view/widgets/real_time_win_card.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class LiveView extends StatefulWidget {
  const LiveView({Key? key}) : super(key: key);

  @override
  _LiveViewState createState() => _LiveViewState();
}

class _LiveViewState extends State<LiveView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "NZ lead by 119 runs",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
            MoreCard(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Day 4:Session2",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
                Text(
                  "Over Left Today: 36.0",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
              ],
            )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < 10; i++)
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Text(
                            "Over 1",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: dSize(.04),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Text(
                                '0',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Text(
                                'wd',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent),
                              child: Text(
                                'W',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Text(
                                '4',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Text(
                                '0',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Text(
                                '6',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '=',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: dSize(.04),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Text(
                                '10',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: dSize(.04),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            width: 2,
                            thickness: 2,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            LiveWinCardTile(
              onTap: () {
                _showSquadsSheet(context);
              },
              title: '',
            ),
            BatterCardTile(
              title: '',
              onTap: () {},
            ),
            BowlerCardTile(
              title: '',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _showSquadsSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return const FractionallySizedBox(
                heightFactor: 2.4,
                child: ProgressBottomSheet(),
              );
            }));
  }
}
