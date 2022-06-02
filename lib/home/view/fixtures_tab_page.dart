import 'package:cricland/home/model/custom_widget/fixtures_card_tile.dart';
import 'package:cricland/home/model/custom_widget/live_cart_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

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
    return Container(
      padding: EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 1,
                  color: PublicController.pc.toggleTextColor(),
                )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
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
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: typeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(
                                  width: 2,
                                  color: PublicController.pc.toggleTextColor(),
                                )),
                            child: Center(
                              child: Text(
                                typeList[index],
                                style: TextStyle(
                                  fontSize: dSize(.04),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) {
                  return LiveCard(
                      child: FixturesCardTile(
                    title: '',
                    onTap: () {},
                  ));
                }),
          ),
        ],
      ),
    );
  }
}
