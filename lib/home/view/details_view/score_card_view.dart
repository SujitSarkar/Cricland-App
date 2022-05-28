import 'package:flutter/material.dart';

class ScoreCardView extends StatefulWidget {
  const ScoreCardView({Key? key}) : super(key: key);

  @override
  _ScoreCardViewState createState() => _ScoreCardViewState();
}

class _ScoreCardViewState extends State<ScoreCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Score Card"),
    );
  }
}
