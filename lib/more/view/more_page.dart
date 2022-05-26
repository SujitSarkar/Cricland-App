import 'package:cricland/more/view/icc_man_ranking/icc_man_ranking_page.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/more/view/widgets/toogle_btn.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {

  static final TextStyle _titleStyle = TextStyle(
      fontSize: dSize(.04),
      fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(builder: (lc) {
      return Scaffold(
        appBar: AppBar(
          title: Text(lc.bottomMore.value,
              style: TextStyle(fontSize: dSize(.045))),
        ),
        body: _bodyUI(context, lc),
      );
    });
  }

  Widget _bodyUI(BuildContext context, LanguageController lc) {
    return ListView(
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
                  onTap: () {
                    Get.to(()=>const ICCManRankingPage());
                  })
            ],
          ),
        ),
        SizedBox(height: dSize(.12)),

        ///Settings
        Text(lc.settingsTitle.value, style: _titleStyle),
        SizedBox(height: dSize(.02)),
        MoreCard(
          child: CardTile(
            leadingIcon: FontAwesomeIcons.language,
            title: lc.appLanguage.value,
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
                  Text(lc.language.value,
                      style: TextStyle(
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleTextColor())),
                  Icon(FontAwesomeIcons.angleRight,
                      size: dSize(.032), color: Colors.grey),
                ],
              ),
            ),
            onTap: () {
              _showLanguageChangeSheet(context, lc);
            },
          ),
        ),
        SizedBox(height: dSize(.03)),
        MoreCard(
          child: Column(
            children: [
              CardTile(
                  leadingIcon: FontAwesomeIcons.gear,
                  title: lc.matchSettings.value,
                  onTap: () {}),
              Divider(height: dSize(.06), color: Colors.grey),
              CardTile(
                  leadingIcon: FontAwesomeIcons.solidLightbulb,
                  title: lc.themeChange.value,
                  onTap: () {
                    _showThemeChangeSheet(context);
                  }),
            ],
          ),
        ),
        SizedBox(height: dSize(.12)),

        ///Premium
        Text(lc.premium.value, style: _titleStyle),
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
        Text(lc.visit.value, style: _titleStyle),
        SizedBox(height: dSize(.02)),
        MoreCard(
          child: Column(
            children: [
              CardTile(
                  leadingIcon: FontAwesomeIcons.facebook,
                  title: lc.facebook.value,
                  onTap: () async{
                    if (await canLaunchUrl(Uri.parse('https://icons8.com/line-awesome'))) {
                      await launchUrl(Uri.parse('https://icons8.com/line-awesome'));
                    }
                  }),
              Divider(height: dSize(.06), color: Colors.grey),
              CardTile(
                  leadingIcon: FontAwesomeIcons.instagram,
                  title: lc.instagram.value,
                  onTap: () async{
                    if (await canLaunchUrl(Uri.parse('https://icons8.com/line-awesome'))) {
                    await launchUrl(Uri.parse('https://icons8.com/line-awesome'));
                    }
                  })
            ],
          ),
        ),
        SizedBox(height: dSize(.12)),

        ///Support
        Text(lc.support.value, style: _titleStyle),
        SizedBox(height: dSize(.02)),
        MoreCard(
          child: Column(
            children: [
              CardTile(
                  leadingIcon: FontAwesomeIcons.star,
                  title: lc.rateUs.value,
                  onTap: () {
                    LaunchReview.launch(androidAppId: "bd.com.baghmama.bm",
                        iOSAppId: "585027354");
                  }),
              Divider(height: dSize(.06), color: Colors.grey),
              CardTile(
                  leadingIcon: FontAwesomeIcons.download,
                  title: lc.checkForUpdate.value,
                  onTap: () {
                    LaunchReview.launch(androidAppId: "bd.com.baghmama.bm",
                        iOSAppId: "585027354");
                  }),
              Divider(height: dSize(.06), color: Colors.grey),
              CardTile(
                  leadingIcon: FontAwesomeIcons.circleExclamation,
                  title: lc.problem.value,
                  onTap: () {}),
              Divider(height: dSize(.06), color: Colors.grey),
              CardTile(
                  leadingIcon: FontAwesomeIcons.shareNodes,
                  title: lc.invite.value,
                  onTap: () {
                    Share.share('https://play.google.com/store/apps/details?id=com.glamworlditltd.muktodhara');
                  })
            ],
          ),
        ),
        SizedBox(height: dSize(.12)),

        ///About
        Text(lc.about.value, style: _titleStyle),
        SizedBox(height: dSize(.02)),
        MoreCard(
          child: Column(
            children: [
              CardTile(
                  leadingIcon: FontAwesomeIcons.circleInfo,
                  title: lc.aboutUs.value,
                  onTap: () {}),
              Divider(height: dSize(.06), color: Colors.grey),
              CardTile(
                  leadingIcon: FontAwesomeIcons.gavel,
                  title: lc.terms.value,
                  onTap: () {}),
              Divider(height: dSize(.06), color: Colors.grey),
              CardTile(
                  leadingIcon: FontAwesomeIcons.scaleBalanced,
                  title: lc.privacy.value,
                  onTap: () {}),
            ],
          ),
        ),
        SizedBox(height: dSize(.12)),
      ],
    );
  }

  void _showThemeChangeSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SizedBox(
          height: dSize(.7),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.cancel_outlined,
                          color: Colors.white70, size: dSize(.1))),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(dSize(.04)),
                      decoration: BoxDecoration(
                          color: PublicController.pc.toggleCardBg(),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                      child: Obx(()=>Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Change the app theme by your own choice',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: PublicController.pc.toggleTextColor(),
                                fontSize: dSize(.045),
                                fontWeight: FontWeight.w500
                              )),
                          SizedBox(height: dSize(.08)),

                          AnimatedToggleButton(
                            values: const ['Light', 'Dark'],
                            toggleValue: PublicController.pc.isLight.value,
                            width: dSize(.85),
                            height: dSize(0.12),
                            fontSize: dSize(0.045),
                            onToggleCallback: (v) async {
                              setState((){
                                PublicController.pc.isLight.value = !PublicController.pc.isLight.value;
                                PublicController.pc.changeTheme(PublicController.pc.isLight.value);
                                PublicController.pc.update();
                              });
                              //setState(() {});
                            },
                          ),
                          SizedBox(height: dSize(.06)),

                        ],
                      )),
                    ),
                  ),
                ],
              ),
        ));
  }

  void _showLanguageChangeSheet(BuildContext context, LanguageController lc) {
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
                                  child: Text(lc.close.value),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  lc.appLanguage.value,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              Spacer(),
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
                              Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18.0),
                                        child: Text(
                                            lc.langModel.value.continueButton!),
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
