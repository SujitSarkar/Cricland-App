import 'package:flutter/material.dart';

class CommentaryView extends StatefulWidget {
  const CommentaryView({Key? key}) : super(key: key);

  @override
  _CommentaryViewState createState() => _CommentaryViewState();
}

class _CommentaryViewState extends State<CommentaryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Commentary View"),
    );
  }
}
