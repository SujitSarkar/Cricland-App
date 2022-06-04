import 'package:cricland/home/view/widgets/score_card_batter_tile.dart';
import 'package:flutter/material.dart';

class ScoreCardView extends StatefulWidget {
  const ScoreCardView({Key? key}) : super(key: key);

  @override
  _ScoreCardViewState createState() => _ScoreCardViewState();
}

class _ScoreCardViewState extends State<ScoreCardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {},
                    child: Text(
                      "NK 78-3(10.2)",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                        ),
                        onPressed: () {},
                        child: Text(
                          "NWW",
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
            ScorecardBatterTile(
              title: '',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
