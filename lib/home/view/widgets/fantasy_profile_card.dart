import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FantasyProfileCardTile extends StatelessWidget {
  const FantasyProfileCardTile(
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
    return Card(
      color: PublicController.pc.toggleCardBg(),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/player.png',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NK',
                      style: TextStyle(
                          fontSize: dSize(.03),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor()),
                    ),
                    Text(
                      'M Burton',
                      style: TextStyle(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.bold,
                          color: PublicController.pc.toggleTextColor()),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "30.0",
                  style: TextStyle(
                      fontSize: dSize(.06),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor()),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Pts",
                  style: TextStyle(
                      fontSize: dSize(.03),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor()),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
