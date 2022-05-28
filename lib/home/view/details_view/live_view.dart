import 'package:flutter/material.dart';

class LiveView extends StatefulWidget {
  const LiveView({Key? key}) : super(key: key);

  @override
  _LiveViewState createState() => _LiveViewState();
}

class _LiveViewState extends State<LiveView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Live View"),
    );
  }
}
