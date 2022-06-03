import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../public/controller/public_controller.dart';
import '../../../../public/variables/config.dart';
import '../../../../public/variables/variable.dart';

class PlayerInfo extends StatelessWidget {
  PlayerInfo({Key? key}) : super(key: key);

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.03),
      fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
      children: [
        SizedBox(height: dSize(.45)),

        Container(
          padding: EdgeInsets.all(dSize(.04)),
          decoration: BoxDecoration(
              color: PublicController.pc.toggleCardBg(),
              borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
          ),
          child: Column(
            children: [
              _aboutBuilder('Role:', 'All Rounder'),
              Divider(height: dSize(.1),thickness: 0.2,color: Colors.grey),
              _aboutBuilder('Bats:', 'Left Handed * Middle order'),
              Divider(height: dSize(.1),thickness: 0.2,color: Colors.grey),
              _aboutBuilder('Bowl:', 'Left-arm orthodox spin * Spinner'),
            ],
          ),
        ),
        SizedBox(height: dSize(.1)),

        Text('About Sakib-Al-Hasan',style: _textStyle.copyWith(fontSize: dSize(.04),fontWeight: FontWeight.bold)),
        SizedBox(height: dSize(.02)),

        Container(
          padding: EdgeInsets.all(dSize(.04)),
          decoration: BoxDecoration(
              color: PublicController.pc.toggleCardBg(),
              borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
          ),
          child: Column(
            children: [
              _aboutBuilder('Name', 'Sakib-Al-Hasan'),
              Divider(height: dSize(.1),thickness: 0.2,color: Colors.grey),
              _aboutBuilder('Birth', '15 Oct 1998'),
              Divider(height: dSize(.1),thickness: 0.2,color: Colors.grey),
              _aboutBuilder('Birth Place', 'Dhaka, Bangladesh'),
              Divider(height: dSize(.1),thickness: 0.2,color: Colors.grey),
              _aboutBuilder('Height', '5 ft 9 in'),
              Divider(height: dSize(.1),thickness: 0.2,color: Colors.grey),
              _aboutBuilder('Nationality', 'Bangladeshi'),
            ],
          ),
        ),
        SizedBox(height: dSize(.1)),

        Container(
          padding: EdgeInsets.all(dSize(.02)),
          decoration: BoxDecoration(
              color: PublicController.pc.toggleCardBg(),
              borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
          ),
          child: Text(Variables.aboutSakib,textAlign: TextAlign.justify,style: _textStyle.copyWith(fontSize: dSize(.035))),
        ),
        SizedBox(height: dSize(.1)),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _socialRowBuilder(FontAwesomeIcons.instagram, 'sakibalhasan'),
            _socialRowBuilder(FontAwesomeIcons.twitter, 'sakibsakib'),
          ],
        ),
        SizedBox(height: dSize(.1)),
      ],
    );
  }

  Widget _aboutBuilder(String key, String value)=>Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
          flex: 1,
          child: Text(key,style: _textStyle.copyWith(fontSize: dSize(.035)))),
      Expanded(
          flex: 2,
          child: Text(value,style: _textStyle.copyWith(fontSize: dSize(.035)))),
    ],
  );

  Widget _socialRowBuilder(IconData icon, String title)=>Expanded(
    child: Row(
      children: [
        Icon(icon,size: dSize(.05),color: PublicController.pc.toggleTextColor()),
        Text(' $title',style: _textStyle)
      ],
    ),
  );
}