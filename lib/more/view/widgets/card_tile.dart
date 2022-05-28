import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardTile extends StatelessWidget {
  const CardTile({Key? key,required this.title,required this.onTap, this.leadingIcon, this.trailingWidget, this.showDivider}) : super(key: key);
  final IconData? leadingIcon;
  final String title;
  final Widget? trailingWidget;
  final Function() onTap;
  final bool? showDivider;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(leadingIcon,color: PublicController.pc.togglePrimaryGrey(),size: dSize(.05)),
        SizedBox(width: dSize(.03)),

        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,maxLines: 1,style: TextStyle(fontSize: dSize(.04),fontWeight: FontWeight.w500,color: PublicController.pc.toggleTextColor())),
                  trailingWidget??Icon(FontAwesomeIcons.caretRight,size: dSize(.045),color: PublicController.pc.togglePrimaryGrey()),
                ],
              ),
              if(showDivider!= null && showDivider!)Divider(height: dSize(.06), color: Colors.grey),
            ],
          ),
        ),
      ],
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

