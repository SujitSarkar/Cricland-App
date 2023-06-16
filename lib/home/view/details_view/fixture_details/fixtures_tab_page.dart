import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../monk_view/monk_live_tile.dart';

class FixturesTabScreen extends StatefulWidget {
  final ScrollController scrollController;
  const FixturesTabScreen({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _FixturesTabScreenState createState() => _FixturesTabScreenState();
}

class _FixturesTabScreenState extends State<FixturesTabScreen> {
  String? selectedValue = 'Day';

  // List of items in our dropdown menu
  var items = [
    'Day',
    'Series',
    'Teams',
  ];

  List<String> typeList = [
    'All',
    'International',
    'T20',
    'ODI',
    'Test',
    'League',
    'Women',
  ];
  RxList filteredMatchListForFixture = [].obs;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      filteredMatch(String search) {
        filteredMatchListForFixture = [].obs;
        if (search == "All") {
          filteredMatchListForFixture = homeController.matchListForFixtureAll;
        }
        if (search == "Test") {
          filteredMatchListForFixture = homeController.matchListForFixtureTest;
        }

        if (search == "T20") {
          filteredMatchListForFixture = homeController.matchListForFixtureT20;
        }
        if (search == "ODI") {
          filteredMatchListForFixture = homeController.matchListForFixtureODI;
          homeController.matchListForFixtureODI;
        }

        print(search);
        print(filteredMatchListForFixture.length.obs);
      }

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
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: PublicController.pc.toggleCardBg(),
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(10))),
                    //   child: DropdownButtonHideUnderline(
                    //     child: DropdownButton2(
                    //       style: AppTextStyle().largeTitleStyle,
                    //       alignment: Alignment.center,
                    //       iconEnabledColor: PublicController.pc.toggleTextColor(),
                    //       dropdownDecoration: BoxDecoration(
                    //           color: PublicController.pc.toggleCardBg()),
                    //       items: items
                    //           .map((item) => DropdownMenuItem<String>(
                    //                 value: item,
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   item,
                    //                   style: TextStyle(
                    //                     fontSize: dSize(.04),
                    //                     fontWeight: FontWeight.w500,
                    //                     color:
                    //                         PublicController.pc.toggleTextColor(),
                    //                   ),
                    //                 ),
                    //               ))
                    //           .toList(),
                    //       value: selectedValue,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           selectedValue = value as String;
                    //         });
                    //         if (selectedValue == "Day") {
                    //           homeController.getFixturesMatches();
                    //         } else if (selectedValue == "Series") {
                    //           homeController.getFixturesMatches();
                    //         } else if (selectedValue == "Teams") {
                    //           homeController.getFixturesMatches();
                    //         }
                    //         print(selectedValue);
                    //       },
                    //       buttonHeight: 40,
                    //       buttonWidth: 140,
                    //       itemHeight: 40,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(width: 10),

                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: typeList.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  filteredMatch(typeList[index]);
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 4),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.white,
                                        width: 2.0,
                                      ),
                                      color:
                                          PublicController.pc.toggleCardBg()),
                                  child: Text(
                                    typeList[index],
                                    textAlign: TextAlign.center,
                                    style:
                                        AppTextStyle().largeTitleStyle.copyWith(
                                              fontSize: dSize(.04),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor(),
                                            ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today,24 February",
                      style: AppTextStyle().titleTextStyle),
                  TextButton.icon(
                    // <-- TextButton
                    onPressed: () {
                      homeController.fetchFixtureTest();
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.orange,
                      size: 24.0,
                    ),
                    label: Text(
                      'Calendar',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
              ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredMatchListForFixture.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return MonkLiveTile(
                      liveObjectData: filteredMatchListForFixture[index],
                      liveIndex: index,
                      scrollController: widget.scrollController,
                    );
                  })
            ],
          ),
        ),
      );
    });
  }
}
