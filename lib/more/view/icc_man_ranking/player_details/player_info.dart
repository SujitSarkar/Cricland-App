import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../home/controller/home_controller.dart';
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
    return GetBuilder<HomeController>(builder: (homeController) {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
        children: [
          SizedBox(height: dSize(.45)),
          Container(
            padding: EdgeInsets.all(dSize(.04)),
            decoration: BoxDecoration(
                color: PublicController.pc.toggleCardBg(),
                borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))),
            child: Column(
              children: [
                _aboutBuilder(
                    'Role:', '${homeController.playerInfoModel.role}'),
                Divider(height: dSize(.1), thickness: 0.2, color: Colors.grey),
                _aboutBuilder('Bats:', '${homeController.playerInfoModel.bat}'),
                Divider(height: dSize(.1), thickness: 0.2, color: Colors.grey),
                _aboutBuilder(
                    'Bowl:',
                    homeController.playerInfoModel.bowl != null
                        ? '${homeController.playerInfoModel.bowl}'
                        : "N/A"),
              ],
            ),
          ),
          SizedBox(height: dSize(.1)),
          Text('About "${homeController.playerInfoModel.name}"',
              style: _textStyle.copyWith(
                  fontSize: dSize(.04), fontWeight: FontWeight.bold)),
          SizedBox(height: dSize(.02)),
          Container(
            padding: EdgeInsets.all(dSize(.04)),
            decoration: BoxDecoration(
                color: PublicController.pc.toggleCardBg(),
                borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))),
            child: Column(
              children: [
                _aboutBuilder('Name', '${homeController.playerInfoModel.name}'),
                Divider(height: dSize(.1), thickness: 0.2, color: Colors.grey),
                _aboutBuilder(
                    'Birth', '${homeController.playerInfoModel.doBFormat}'),
                Divider(height: dSize(.1), thickness: 0.2, color: Colors.grey),
                _aboutBuilder('Birth Place',
                    '${homeController.playerInfoModel.birthPlace}'),
                Divider(height: dSize(.1), thickness: 0.2, color: Colors.grey),
                _aboutBuilder(
                    'Height',
                    homeController.playerInfoModel.height != null
                        ? '${homeController.playerInfoModel.height}'
                        : "N/A"),
                Divider(height: dSize(.1), thickness: 0.2, color: Colors.grey),
                _aboutBuilder('Nationality',
                    '${homeController.playerInfoModel.intlTeam}'),
              ],
            ),
          ),
          SizedBox(height: dSize(.1)),
          Container(
            padding: EdgeInsets.all(dSize(.02)),
            decoration: BoxDecoration(
                color: PublicController.pc.toggleCardBg(),
                borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))),
            child: Text(
              Variables.aboutSakib,
              textAlign: TextAlign.justify,
              style: CLTextStyle.paragraphTextStyle.copyWith(
                fontSize: dSize(.03),
                color: PublicController.pc.toggleTextColor(),
              ),
            ),
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
    });
  }

  Widget _aboutBuilder(String key, String value) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                key,
                style: CLTextStyle.paragraphTextStyle.copyWith(
                  fontSize: dSize(.03),
                  color: PublicController.pc.toggleTextColor(),
                ),
              )),
          Expanded(
              flex: 2,
              child: Text(
                value,
                style: CLTextStyle.paragraphTextStyle.copyWith(
                  fontSize: dSize(.03),
                  color: PublicController.pc.toggleTextColor(),
                ),
              )),
        ],
      );

  Widget _socialRowBuilder(IconData icon, String title) => Expanded(
        child: Row(
          children: [
            Icon(icon,
                size: dSize(.05), color: PublicController.pc.toggleTextColor()),
            Text(
              ' $title',
              style: CLTextStyle.paragraphTextStyle.copyWith(
                fontSize: dSize(.03),
                color: PublicController.pc.toggleTextColor(),
              ),
            )
          ],
        ),
      );
}
