import 'package:cricland/more/view/icc_man_ranking/icc_man_ranking_page.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  static final TextStyle _titleStyle = TextStyle(
      fontSize: dSize(.04),
      fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text('More', style: TextStyle(fontSize: dSize(.045))),
          ),
          body: _bodyUI(context),
        ));
  }

  Widget _bodyUI(BuildContext context) => ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(dSize(.04)),
        children: [
          ///Ranking
          MoreCard(
            child: Column(
              children: [
                CardTile(
                    leadingIcon: FontAwesomeIcons.userLarge,
                    title: 'ICC Men\'s Ranking',
                    onTap: () {
                      Get.to(()=>const ICCManRankingPage());
                    }),
                Divider(height: dSize(.06), color: Colors.grey),
                CardTile(
                    leadingIcon: FontAwesomeIcons.userNurse,
                    title: 'ICC Women\'s Ranking',
                    onTap: () {})
              ],
            ),
          ),
          SizedBox(height: dSize(.12)),

          ///Settings
          Text('Settings', style: _titleStyle),
          SizedBox(height: dSize(.02)),
          MoreCard(
            child: CardTile(
                leadingIcon: FontAwesomeIcons.language,
                title: 'App Language',
                trailingWidget: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: dSize(.03), vertical: dSize(.01)),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('English',
                          style: TextStyle(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor())),
                      Icon(FontAwesomeIcons.angleRight,
                          size: dSize(.032), color: Colors.grey),
                    ],
                  ),
                ),
                onTap: () {}),
          ),
          SizedBox(height: dSize(.03)),
          MoreCard(
            child: Column(
              children: [
                CardTile(
                    leadingIcon: FontAwesomeIcons.gear,
                    title: 'Match Settings',
                    onTap: () {}),
                Divider(height: dSize(.06), color: Colors.grey),
                CardTile(
                    leadingIcon: FontAwesomeIcons.solidLightbulb,
                    title: 'Change Theme',
                    onTap: () {
                      _showThemeChangeSheet(context);
                    }),
              ],
            ),
          ),
          SizedBox(height: dSize(.12)),

          ///Premium
          Text('PREMIUM', style: _titleStyle),
          SizedBox(height: dSize(.02)),
          MoreCard(
            child: CardTile(
                leadingIcon: FontAwesomeIcons.language,
                title: 'Cricland - Cricket Exchange',
                trailingWidget: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: dSize(.03), vertical: dSize(.01)),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Premium',
                          style: TextStyle(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor())),
                      Icon(FontAwesomeIcons.angleRight,
                          size: dSize(.032), color: Colors.grey),
                    ],
                  ),
                ),
                onTap: () {}),
          ),
          SizedBox(height: dSize(.12)),

          ///Visit
          Text('Visit', style: _titleStyle),
          SizedBox(height: dSize(.02)),
          MoreCard(
            child: Column(
              children: [
                CardTile(
                    leadingIcon: FontAwesomeIcons.facebook,
                    title: 'Facebook',
                    onTap: () {}),
                Divider(height: dSize(.06), color: Colors.grey),
                CardTile(
                    leadingIcon: FontAwesomeIcons.instagram,
                    title: 'Instagram',
                    onTap: () {})
              ],
            ),
          ),
          SizedBox(height: dSize(.12)),

          ///Support
          Text('Support', style: _titleStyle),
          SizedBox(height: dSize(.02)),
          MoreCard(
            child: Column(
              children: [
                CardTile(
                    leadingIcon: FontAwesomeIcons.star,
                    title: 'Rate us',
                    onTap: () {}),
                Divider(height: dSize(.06), color: Colors.grey),
                CardTile(
                    leadingIcon: FontAwesomeIcons.download,
                    title: 'Check for updates',
                    onTap: () {}),
                Divider(height: dSize(.06), color: Colors.grey),
                CardTile(
                    leadingIcon: FontAwesomeIcons.circleExclamation,
                    title: 'Report a problem',
                    onTap: () {}),
                Divider(height: dSize(.06), color: Colors.grey),
                CardTile(
                    leadingIcon: FontAwesomeIcons.shareNodes,
                    title: 'Invite friends',
                    onTap: () {})
              ],
            ),
          ),
          SizedBox(height: dSize(.12)),

          ///About
          Text('About', style: _titleStyle),
          SizedBox(height: dSize(.02)),
          MoreCard(
            child: Column(
              children: [
                CardTile(
                    leadingIcon: FontAwesomeIcons.circleInfo,
                    title: 'About us',
                    onTap: () {}),
                Divider(height: dSize(.06), color: Colors.grey),
                CardTile(
                    leadingIcon: FontAwesomeIcons.gavel,
                    title: 'Terms & Condition',
                    onTap: () {}),
                Divider(height: dSize(.06), color: Colors.grey),
                CardTile(
                    leadingIcon: FontAwesomeIcons.scaleBalanced,
                    title: 'Privacy policy',
                    onTap: () {}),
              ],
            ),
          ),
          SizedBox(height: dSize(.12)),

          Center(
              child: Text('V ${PublicController.pc.packageInfo.version}',
                  style: _titleStyle)),
          SizedBox(height: dSize(.04)),
        ],
      );

  void _showThemeChangeSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => StatefulBuilder(builder: (context, setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.cancel_outlined,
                          color: Colors.white70, size: dSize(.1))),
                  SizedBox(height: dSize(.04)),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(dSize(.04)),
                      decoration: BoxDecoration(
                          color: PublicController.pc.themeRadioValue.value == 1
                              ? Colors.white
                              : AllColor.appDarkBg,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                      child: Column(
                        children: [
                          SizedBox(height: dSize(.09)),
                          Text('Change Your App Theme',
                              style: _titleStyle.copyWith(
                                  fontSize: dSize(.045),
                                  color: PublicController
                                              .pc.themeRadioValue.value ==
                                          1
                                      ? AllColor.lightTextColor
                                      : AllColor.darkTextColor)),
                          SizedBox(height: dSize(.1)),
                          Row(
                            children: [
                              ///Light Radio
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('Light',
                                        style: _titleStyle.copyWith(
                                            color: PublicController
                                                        .pc
                                                        .themeRadioValue
                                                        .value ==
                                                    1
                                                ? AllColor.lightTextColor
                                                : AllColor.darkTextColor)),
                                    Radio(
                                      value: 1,
                                      groupValue: PublicController
                                          .pc.themeRadioValue.value,
                                      onChanged: (int? value) {
                                        setState(() {
                                          PublicController.pc.themeRadioValue
                                              .value = value!;
                                          PublicController.pc.update();
                                        });
                                      },
                                      activeColor: AllColor.primaryColor,
                                      fillColor: MaterialStateProperty.all(
                                          PublicController.pc.themeRadioValue
                                                      .value ==
                                                  1
                                              ? AllColor.primaryColor
                                              : AllColor.darkTextColor),
                                    ),
                                  ],
                                ),
                              ),

                              ///Dark Radio
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('Dark',
                                        style: _titleStyle.copyWith(
                                            color: PublicController
                                                        .pc
                                                        .themeRadioValue
                                                        .value ==
                                                    1
                                                ? AllColor.lightTextColor
                                                : AllColor.darkTextColor)),
                                    Radio(
                                      value: 2,
                                      groupValue: PublicController
                                          .pc.themeRadioValue.value,
                                      onChanged: (int? value) {
                                        setState(() {
                                          PublicController.pc.themeRadioValue
                                              .value = value!;
                                          PublicController.pc.update();
                                        });
                                      },
                                      activeColor: AllColor.primaryColor,
                                      fillColor: MaterialStateProperty.all(
                                          PublicController.pc.themeRadioValue
                                                      .value ==
                                                  1
                                              ? AllColor.primaryColor
                                              : AllColor.darkTextColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: dSize(.1)),
                          ElevatedButton(
                            onPressed: () {
                              PublicController.pc.changeTheme(
                                  PublicController.pc.themeRadioValue.value == 1
                                      ? true
                                      : false);
                              Get.back();
                            },
                            child: Text('Save Changes',
                                style: _titleStyle.copyWith(
                                    color: AllColor.darkTextColor)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
