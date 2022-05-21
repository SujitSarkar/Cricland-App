import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

final themeMode = ValueNotifier(2);
final List<String> itemList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> itemSliders = itemList.map((item) {
  return Card(
    color: PublicController.pc.toggleCardBg(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Indian Premium league",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Text(
                    "Upcoming",
                    style: TextStyle(
                      fontSize: dSize(.03),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              height: 1,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/bd_flag.png',
                    scale: 10,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bangladesh',
                        style: TextStyle(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Text(
                        '216/9',
                        style: TextStyle(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Text(
                        '49.6 ov.',
                        style: TextStyle(
                          fontSize: dSize(.03),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'VS',
                    style: TextStyle(
                      fontSize: dSize(.05),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'India',
                        style: TextStyle(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Text(
                        '216/9',
                        style: TextStyle(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Text(
                        '49.6 ov.',
                        style: TextStyle(
                          fontSize: dSize(.03),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/indian_flag.png',
                    scale: 4,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            'Bangladesh Won by 5 wickets',
            style: TextStyle(
              fontSize: dSize(.03),
              fontWeight: FontWeight.w500,
              color: PublicController.pc.toggleTextColor(),
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Text(
                "Live Statistic",
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}).toList();

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.1,
          enlargeCenterPage: true,
        ),
        items: itemSliders,
      ),
    );
  }
}
