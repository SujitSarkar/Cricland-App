import 'package:flutter/material.dart';

class HeadToHeadCardTile extends StatelessWidget {
  const HeadToHeadCardTile(
      {Key? key,
      required this.title,
      required this.onTap,
      this.leadingWidget,
      this.trailingWidget})
      : super(key: key);
  final Widget? leadingWidget;
  final Widget? title;
  final Widget? trailingWidget;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [leadingWidget!, title!, trailingWidget!],
    );
  }
}
