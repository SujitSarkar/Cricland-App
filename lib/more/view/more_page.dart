import 'package:cricland/more/controller/more_controller.dart';
import 'package:cricland/more/view/icc_man_ranking/icc_man_ranking_page.dart';
import 'package:cricland/more/view/premium_page.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/more/view/widgets/toogle_btn.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../public/variables/colors.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final TextStyle _titleStyle = TextStyle(
      fontSize: dSize(.042),
      fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More',
            style: TextStyle(fontSize: dSize(.045))),
      ),
      body: _bodyUI(context),
    );
  }

  Widget _bodyUI(BuildContext context) {
    return Obx(() =>  ListView(
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
                  showDivider: true,
                  onTap: () {
                    Get.to(() => const ICCManRankingPage());
                  }),
              CardTile(
                  leadingIcon: FontAwesomeIcons.userNurse,
                  title: 'ICC Women\'s Ranking',
                  onTap: () {
                    Get.to(() => const ICCManRankingPage());
                  })
            ],
          ),
        ),
        SizedBox(height: dSize(.12)),

        ///Premium
        Text('Premium', style: _titleStyle),
        SizedBox(height: dSize(.02)),
        MoreCard(
          child: CardTile(
              onTap: () {
                Get.to(()=>PremiumPage());
              },
              leadingIcon: FontAwesomeIcons.crown,
              title: 'Cricland',
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
              )),
        ),
        SizedBox(height: dSize(.12)),

        ///Follow Us
        Text('Follow Us', style: _titleStyle),
        SizedBox(height: dSize(.02)),
        MoreCard(
          child: Column(
            children: [
              CardTile(
                  leadingIcon: FontAwesomeIcons.youtube,
                  title: 'Youtube',
                  showDivider: true,
                  onTap: () async {
                    if (await canLaunchUrl(
                        Uri.parse('https://icons8.com/line-awesome'))) {
                      await launchUrl(
                          Uri.parse('https://icons8.com/line-awesome'));
                    }
                  }),
              CardTile(
                  leadingIcon: FontAwesomeIcons.facebook,
                  title: 'Facebook',
                  showDivider: true,
                  onTap: () async {
                    if (await canLaunchUrl(
                        Uri.parse('https://icons8.com/line-awesome'))) {
                      await launchUrl(
                          Uri.parse('https://icons8.com/line-awesome'));
                    }
                  }),
              CardTile(
                  leadingIcon: FontAwesomeIcons.instagram,
                  title: 'Instagram',
                  onTap: () async {
                    if (await canLaunchUrl(
                        Uri.parse('https://icons8.com/line-awesome'))) {
                      await launchUrl(
                          Uri.parse('https://icons8.com/line-awesome'));
                    }
                  })
            ],
          ),
        ),
        SizedBox(height: dSize(.12)),

        ///Settings
        Text('Setting & Appearance', style: _titleStyle),
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
            onTap: () {
              _showLanguageChangeSheet(context);
            },
          ),
        ),
        SizedBox(height: dSize(.03)),
        MoreCard(
          child: Column(
            children: [
              CardTile(
                  leadingIcon: FontAwesomeIcons.solidLightbulb,
                  title: 'Change Theme',
                  showDivider: true,
                  onTap: () {
                    _showThemeChangeSheet(context);
                  }),
              CardTile(
                leadingIcon: FontAwesomeIcons.bell,
                title: 'Notifications',
                trailingWidget: SizedBox(
                  height: dSize(.04),
                  child: Switch(
                    value: MoreController.mc.notiSwitchValue.value,
                    onChanged: (val){
                      MoreController.mc.notiSwitchValue(val);
                      MoreController.mc.update();
                    },
                    trackColor: MaterialStateProperty.all<Color>(AllColor.primaryColor),
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        SizedBox(height: dSize(.12)),

        ///Support
        Text('Rate Us', style: _titleStyle),
        SizedBox(height: dSize(.02)),
        MoreCard(
          child: Column(
            children: [
              CardTile(
                  leadingIcon: FontAwesomeIcons.star,
                  title: 'Rate Us',
                  showDivider: true,
                  onTap: () {
                    LaunchReview.launch(
                        androidAppId: "bd.com.baghmama.bm",
                        iOSAppId: "585027354");
                  }),
              CardTile(
                  leadingIcon: FontAwesomeIcons.message,
                  title: 'Feedback',
                  showDivider: true,
                  onTap: () {
                    LaunchReview.launch(
                        androidAppId: "bd.com.baghmama.bm",
                        iOSAppId: "585027354");
                  }),
              CardTile(
                  leadingIcon: FontAwesomeIcons.shareNodes,
                  title:'Share App',
                  onTap: () {
                    Share.share(
                        'https://play.google.com/store/apps/details?id=com.glamworlditltd.muktodhara');
                  })
            ],
          ),
        ),
        SizedBox(height: dSize(.12)),

        ///Terms & privacy
        Text('About', style: _titleStyle),
        SizedBox(height: dSize(.02)),
        MoreCard(
          child: Column(
            children: [
              CardTile(
                  leadingIcon: FontAwesomeIcons.gavel,
                  title: 'Terms of Use',
                  showDivider: true,
                  onTap: () {}),
              CardTile(
                  leadingIcon: FontAwesomeIcons.lock,
                  title: 'Privacy Policy',
                  onTap: () {}),
            ],
          ),
        ),
        SizedBox(height: dSize(.08)),

        Text('Version: ${PublicController.pc.packageInfo.version}',textAlign: TextAlign.center,style: _titleStyle),
        SizedBox(height: dSize(.02)),
      ],
    ));
  }

  void _showThemeChangeSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
          height: dSize(.7),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(dSize(.04)),
          decoration: BoxDecoration(
              color: PublicController.pc.toggleCardBg(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
              child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Container(
                        width: dSize(.1),
                        height: dSize(.01),
                        decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(dSize(.05)))
                      )),
                      InkWell(
                          onTap:()=>Get.back(),
                          child: Icon(LineAwesomeIcons.times,size: dSize(.06),color: Colors.grey,))
                    ],
                  ),
                  SizedBox(height: dSize(.1)),
                  Text('Change the app theme by your own choice',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: PublicController.pc.toggleTextColor(),
                          fontSize: dSize(.045),
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: dSize(.08)),
                  AnimatedToggleButton(
                    values: const ['Light', 'Dark'],
                    toggleValue: PublicController.pc.isLight.value,
                    width: dSize(.85),
                    height: dSize(0.12),
                    fontSize: dSize(0.045),
                    onToggleCallback: (v) async {
                      setState(() {
                        PublicController.pc.isLight.value =
                            !PublicController.pc.isLight.value;
                        PublicController.pc.changeTheme(
                            PublicController.pc.isLight.value);
                        PublicController.pc.update();
                      });
                      //setState(() {});
                    },
                  ),
                ],
              )),
        ));
  }

  void _showLanguageChangeSheet(BuildContext context) {
    bool _isEnglishSelected = false;
    bool _isBanglaSelected = false;
    showModalBottomSheet(
        context: context,
        builder: (_) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return FractionallySizedBox(
                heightFactor: .7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: PublicController.pc.toggleCardBg(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text('Close'),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'App Language',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _isEnglishSelected
                                        ? PublicController.pc.toggleTextColor()
                                        : Colors.white, // red as border color
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: ListTile(
                                  onTap: () {
                                    setState(() {
                                      _isEnglishSelected = true;
                                      _isBanglaSelected = false;
                                    });
                                  },
                                  title: Text(
                                    'English',
                                    style: TextStyle(
                                        color: PublicController.pc
                                            .toggleTextColor()),
                                  ),
                                  trailing: Icon(
                                    Icons.check_circle,
                                    color: _isEnglishSelected
                                        ? PublicController.pc.toggleStatusBar()
                                        : Colors.white,
                                  ),
                                  selected: _isEnglishSelected,
                                  selectedTileColor:
                                      PublicController.pc.toggleStatusBar(),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _isBanglaSelected == true
                                        ? PublicController.pc.toggleTextColor()
                                        : Colors.white, // red as border color
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: ListTile(
                                  onTap: () {
                                    setState(() {
                                      _isEnglishSelected = false;
                                      _isBanglaSelected = true;
                                    });
                                  },
                                  title: Text(
                                    'বাংলা',
                                    style: TextStyle(
                                        color: PublicController.pc
                                            .toggleTextColor()),
                                  ),
                                  trailing: Icon(
                                    Icons.check_circle,
                                    color: _isBanglaSelected
                                        ? PublicController.pc.toggleStatusBar()
                                        : Colors.white,
                                  ),
                                  selected: _isBanglaSelected,
                                  selectedTileColor:
                                      PublicController.pc.toggleStatusBar(),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 18.0),
                                        child: Text('Continue'),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.white,
                                        primary: Colors.indigo,
                                      ),
                                      onPressed: () {
                                        if (_isEnglishSelected) {
                                          LanguageController.lc
                                              .changeLanguage(true);
                                        } else {
                                          LanguageController.lc
                                              .changeLanguage(false);
                                        }
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
