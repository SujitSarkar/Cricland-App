import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentaryProfileCardTile extends StatelessWidget {
  const CommentaryProfileCardTile(
      {Key? key,
      required this.title,
      required this.onTap,
      this.leadingIcon,
      this.trailingWidget})
      : super(key: key);
  final IconData? leadingIcon;
  final String title;
  final Widget? trailingWidget;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/player.png',
            height: 80,
            width: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'R Pretorius',
            style: TextStyle(
                fontSize: dSize(.03),
                fontWeight: FontWeight.w500,
                color: PublicController.pc.toggleTextColor()),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '20',
                style: TextStyle(
                    fontSize: dSize(.04),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor()),
              ),
              Text(
                '(17)',
                style: TextStyle(
                    fontSize: dSize(.04),
                    fontWeight: FontWeight.bold,
                    color: PublicController.pc.toggleTextColor()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
