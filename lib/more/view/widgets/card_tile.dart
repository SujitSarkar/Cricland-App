import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardTile extends StatelessWidget {
  const CardTile({Key? key,required this.title,required this.onTap, this.leadingIcon, this.trailingWidget}) : super(key: key);
  final IconData? leadingIcon;
  final String title;
  final Widget? trailingWidget;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leadingIcon!=null?Icon(leadingIcon,color: Colors.grey,size: dSize(.045)):null,
      title: Text(title,style: TextStyle(fontSize: dSize(.04),fontWeight: FontWeight.w500,color: PublicController.pc.toggleTextColor())),
      trailing: trailingWidget??Icon(FontAwesomeIcons.angleRight,size: dSize(.045),color: Colors.grey),
      contentPadding: const EdgeInsets.all(0.0),
      dense: true,
      horizontalTitleGap: -5.0,
    );
  }
}


class MoreCard extends StatelessWidget {
  const MoreCard({Key? key,required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PublicController.pc.toggleCardBg(),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: child,
    );
  }
}

