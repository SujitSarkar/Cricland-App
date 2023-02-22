import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/finished_card_tile.dart';

class FixturesTabScreen extends StatefulWidget {
  const FixturesTabScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      style: AppTextStyle().largeTitleStyle,
                      alignment: Alignment.center,
                      iconEnabledColor: PublicController.pc.toggleTextColor(),
                      dropdownDecoration: BoxDecoration(
                          color: PublicController.pc.toggleCardBg()),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                alignment: Alignment.center,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: dSize(.04),
                                    fontWeight: FontWeight.w500,
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                        if (selectedValue == "Day") {
                          homeController.getFixturesMatches();
                        } else if (selectedValue == "Series") {
                          homeController.getFixturesMatches();
                        } else if (selectedValue == "Teams") {
                          homeController.getFixturesMatches();
                        }
                        print(selectedValue);
                      },
                      buttonHeight: 40,
                      buttonWidth: 140,
                      itemHeight: 40,
                    ),
                  ),
                ),
                const SizedBox(width: 10),

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
                          return Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: PublicController.pc.toggleCardBg()),
                            child: Text(
                              typeList[index],
                              textAlign: TextAlign.center,
                              style: AppTextStyle().largeTitleStyle.copyWith(
                                    fontSize: dSize(.04),
                                    fontWeight: FontWeight.w500,
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.rapidFixturesList.length,
                  separatorBuilder: (context, index)=> const SizedBox(height: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return FinishedCardTile(
                      rapidMatch: homeController.rapidFixturesList[index],
                    );
                  }),
            )
          ],
        ),
      );
    });
  }
}
