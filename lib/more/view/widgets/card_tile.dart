import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardTile extends StatelessWidget {
  const CardTile(
      {Key? key,
      required this.title,
      required this.onTap,
      this.leadingIcon,
      this.trailingWidget,
      this.showDivider})
      : super(key: key);
  final IconData? leadingIcon;
  final String title;
  final Widget? trailingWidget;
  final Function() onTap;
  final bool? showDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(leadingIcon, color: Colors.grey, size: dSize(.05)),
              SizedBox(width: dSize(.03)),
              Text(title,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: dSize(.04),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor())),
              const Spacer(),
              trailingWidget ??
                  Icon(FontAwesomeIcons.angleRight,
                      size: dSize(.045), color: Colors.grey),
            ],
          ),
          if (showDivider != null && showDivider!)
            Divider(height: dSize(.15), thickness: 0.2, color: Colors.grey),
        ],
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  const MoreCard({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
          color: PublicController.pc.toggleCardBg(),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: child,
    );
  }
}
