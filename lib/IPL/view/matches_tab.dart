import 'package:cricland/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../home/view/widgets/fixtures_card_tile.dart';
import '../../home/view/widgets/match_card_tile.dart';

class MatchesTab extends StatefulWidget {
  final ScrollController scrollController;
  const MatchesTab({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _MatchesTabState createState() => _MatchesTabState();
}

class _MatchesTabState extends State<MatchesTab> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Column(
        children: [
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: MatchCardTile(),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return FixturesCardTile(
                    title: "Name",
                    leadingUrlOne: "assets/t20.png",
                    leadingUrlTwo: "assets/t20.png",
                    teamOne: "SName",
                    teamTwo: "SName",
                    reachTitleOne: "52-5",
                    reachTitleTwo: "100-10",
                    reachSubTitleOne: "50",
                    reachSubTitleTwo: "30",
                    desc: "FINISHED",
                    date: "",
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => HomeDetailsScreen(
                      //               matchIndex: index,
                      //               teamS1Name: '',
                      //               teamS2Name: '',
                      //               matchDesc: '',
                      //             )));
                    },
                  );
                }),
          ),
        ],
      );
    });
  }
}
