import 'package:flutter/material.dart';

class GraphView extends StatefulWidget {
  const GraphView({Key? key}) : super(key: key);

  @override
  _GraphViewState createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Graph View"),
    );
  }
}
