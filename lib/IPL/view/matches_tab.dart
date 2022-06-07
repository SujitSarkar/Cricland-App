import 'package:cricland/home/view/widgets/fixtures_card_tile.dart';
import 'package:flutter/material.dart';

import 'details_view/key_state_screen.dart';

class MatchesTab extends StatefulWidget {
  const MatchesTab({Key? key}) : super(key: key);

  @override
  _MatchesTabState createState() => _MatchesTabState();
}

class _MatchesTabState extends State<MatchesTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return FixturesCardTile(
                  title: 'Indian Premium League',
                  leadingUrlOne: 'assets/indian_flag.png',
                  leadingUrlTwo: 'assets/bd_flag.png',
                  teamOne: 'India',
                  teamTwo: 'Bangladesh',
                  reachTitleOne: '140-5',
                  reachTitleTwo: '188-6',
                  reachSubTitleOne: '16.3',
                  reachSubTitleTwo: '19.3',
                  wonTeam: 'BD Won',
                  byWon: "by 7 wickets",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => KeyStateScreen()));
                  },
                );
              }),
        ),
      ],
    );
  }
}
