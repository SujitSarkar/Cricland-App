import 'package:cricland/IPL/view/widgets/info_card_tile.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';

import 'package:flutter/material.dart';

class SeriesInfoTab extends StatefulWidget {
  final String seriesName;
  final String duration;
  final String format;
  const SeriesInfoTab(
      {Key? key,
      required this.seriesName,
      required this.duration,
      required this.format})
      : super(key: key);

  @override
  _InfoTabState createState() => _InfoTabState();
}

class _InfoTabState extends State<SeriesInfoTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: MoreCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCardTile(
                series: widget.seriesName,
                duration: widget.duration,
                format: widget.format,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
