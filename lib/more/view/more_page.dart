import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/more/controller/more_controller.dart';
import 'package:cricland/more/view/feedback_page.dart';
import 'package:cricland/more/view/icc_man_ranking/icc_man_ranking_page.dart';
import 'package:cricland/more/view/icc_women_ranking/icc_women_ranking_page.dart';
import 'package:cricland/more/view/premium_page.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/more/view/widgets/toogle_btn.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/decoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../public/variables/variable.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    final LanguageController lc = Get.find();
    return GetBuilder<MoreController>(builder: (moreController) {
      return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container( decoration: StDecoration().sliverAppbarGradient),
          title: Text(lc.languageModel.value.more!,
              style: TextStyle(fontSize: dSize(.045))),
        ),
        body: _bodyUI(context, moreController, lc),
      );
    });
  }

  Widget _bodyUI(BuildContext context, MoreController moreController,
      LanguageController lc) {
    return Obx(() => ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(dSize(.04)),
          children: [
            ///Ranking
            MoreCard(
              child: Column(
                children: [
                  CardTile(
                      leadingIcon: FontAwesomeIcons.userLarge,
                      title: lc.languageModel.value.iccMenRanking!,
                      showDivider: true,
                      onTap: () {
                        Get.to(() => const ICCManRankingPage());
                      }),
                  CardTile(
                      leadingIcon: FontAwesomeIcons.userLarge,
                      title: lc.languageModel.value.iccWomenRanking!,
                      onTap: () {
                        Get.to(() => const ICCWomenRankingPage());
                      })
                ],
              ),
            ),
            SizedBox(height: dSize(.1)),

            ///Premium
            Text(lc.languageModel.value.premium!,
                style: AppTextStyle().titleTextStyle),
            SizedBox(height: dSize(.02)),
            MoreCard(
              child: CardTile(
                  onTap: () {
                    Get.to(() => const PremiumPage());
                  },
                  leadingIcon: FontAwesomeIcons.crown,
                  title: lc.languageModel.value.cricland!,
                  trailingWidget: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: dSize(.03), vertical: dSize(.01)),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(lc.languageModel.value.premium!,
                            style: TextStyle(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor())),
                        Icon(FontAwesomeIcons.angleRight,
                            size: dSize(.032), color: Colors.grey),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: dSize(.1)),

            ///Follow Us
            Text(lc.languageModel.value.followUs!,
                style: AppTextStyle().titleTextStyle),
            SizedBox(height: dSize(.02)),
            MoreCard(
              child: Column(
                children: [
                  CardTile(
                      leadingIcon: FontAwesomeIcons.youtube,
                      title: lc.languageModel.value.youtube!,
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
                      title: lc.languageModel.value.facebook!,
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
                      title: lc.languageModel.value.instagram!,
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
            SizedBox(height: dSize(.1)),

            ///Settings
            Text(lc.languageModel.value.settingAppearence!,
                style: AppTextStyle().titleTextStyle),
            SizedBox(height: dSize(.02)),
            MoreCard(
              child: CardTile(
                leadingIcon: FontAwesomeIcons.language,
                title: lc.languageModel.value.appLanguage!,
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
                      Text(lc.languageModel.value.language!,
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
                      leadingIcon: FontAwesomeIcons.solidLightbulb,
                      title: lc.languageModel.value.changeTheme!,
                      showDivider: true,
                      onTap: () {
                        _showThemeChangeSheet(context, lc);
                      }),
                  CardTile(
                    leadingIcon: FontAwesomeIcons.bell,
                    title: lc.languageModel.value.notifications!,
                    trailingWidget: SizedBox(
                      height: dSize(.04),
                      child: Switch(
                        value: MoreController.mc.notiSwitchValue.value,
                        onChanged: (val) {
                          MoreController.mc.notiSwitchValue(val);
                          MoreController.mc.update();
                        },
                        trackColor: MaterialStateProperty.all<Color>(
                            AllColor.primaryColor),
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
            SizedBox(height: dSize(.1)),

            ///Support
            Text(lc.languageModel.value.rateUs!,
                style: AppTextStyle().titleTextStyle),
            SizedBox(height: dSize(.02)),
            MoreCard(
              child: Column(
                children: [
                  CardTile(
                      leadingIcon: FontAwesomeIcons.star,
                      title: lc.languageModel.value.rateUs!,
                      showDivider: true,
                      onTap: () {
                        LaunchReview.launch(
                            androidAppId: "bd.com.baghmama.bm",
                            iOSAppId: "585027354");
                      }),
                  CardTile(
                      leadingIcon: FontAwesomeIcons.message,
                      title: lc.languageModel.value.feedback!,
                      showDivider: true,
                      onTap: () {
                        Get.to(() => const FeedbackPage());
                      }),
                  CardTile(
                      leadingIcon: FontAwesomeIcons.shareNodes,
                      title: lc.languageModel.value.shareApp!,
                      onTap: () {
                        Share.share(
                            'https://play.google.com/store/apps/details?id=com.glamworlditltd.muktodhara');
                      })
                ],
              ),
            ),
            SizedBox(height: dSize(.1)),

            ///Terms & privacy
            Text(lc.languageModel.value.about!,
                style: AppTextStyle().titleTextStyle),
            SizedBox(height: dSize(.02)),
            MoreCard(
              child: Column(
                children: [
                  CardTile(
                      leadingIcon: FontAwesomeIcons.gavel,
                      title: lc.languageModel.value.termsOfUse!,
                      showDivider: true,
                      onTap: () {}),
                  CardTile(
                      leadingIcon: FontAwesomeIcons.lock,
                      showDivider: true,
                      title: lc.languageModel.value.privacyPolicy!,
                      onTap: () {}),
                  CardTile(
                      leadingIcon: FontAwesomeIcons.signOut,
                      title: lc.languageModel.value.logout!,
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.remove('userId');
                        final googleSignIn = GoogleSignIn();
                        await googleSignIn.signOut();
                        showToast('Successfully Logout');
                      }),
                ],
              ),
            ),
            SizedBox(height: dSize(.08)),

            Text(
                '${lc.languageModel.value.version!}: ${PublicController.pc.packageInfo.version}',
                textAlign: TextAlign.center,
                style: AppTextStyle().titleTextStyle),
            SizedBox(height: dSize(.02)),
          ],
        ));
  }

  void _showThemeChangeSheet(BuildContext context, LanguageController lc) {
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
                      Container(
                          width: dSize(.1),
                          height: dSize(.01),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(dSize(.05))))),
                      SizedBox(height: dSize(.1)),
                      Text(lc.languageModel.value.changeThemeTitle!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: PublicController.pc.toggleTextColor(),
                              fontSize: dSize(.045),
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: dSize(.08)),
                      AnimatedToggleButton(
                        values: [
                          lc.languageModel.value.light!,
                          lc.languageModel.value.dark!
                        ],
                        toggleValue: PublicController.pc.isLight.value,
                        width: dSize(.85),
                        height: dSize(0.12),
                        fontSize: dSize(0.045),
                        onToggleCallback: (v) async {
                          setState(() {
                            PublicController.pc.isLight.value =
                                !PublicController.pc.isLight.value;
                            PublicController.pc
                                .changeTheme(PublicController.pc.isLight.value);
                            PublicController.pc.update();
                          });
                          //setState(() {});
                        },
                      ),
                    ],
                  )),
            ));
  }

  void _showLanguageChangeSheet(BuildContext context, LanguageController lc) {
    bool _isEnglishSelected = false;
    bool _isBanglaSelected = false;
    bool _isHindiSelected = false;
    showModalBottomSheet(
        context: context,
        builder: (_) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return FractionallySizedBox(
                heightFactor: .85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: PublicController.pc.toggleCardBg(),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () => Get.back(),
                                  child: Text(
                                    lc.languageModel.value.close!,
                                    style: TextStyle(
                                        color: PublicController.pc
                                            .toggleTextColor()),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  lc.languageModel.value.appLanguage!,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: PublicController.pc
                                          .toggleTextColor()),
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
                                      _isHindiSelected = false;
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
                              const SizedBox(height: 5),
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
                                      _isHindiSelected = false;
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
                              const SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _isHindiSelected == true
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
                                      _isBanglaSelected = false;
                                      _isHindiSelected = true;
                                    });
                                  },
                                  title: Text(
                                    'हिन्दी',
                                    style: TextStyle(
                                        color: PublicController.pc
                                            .toggleTextColor()),
                                  ),
                                  trailing: Icon(
                                    Icons.check_circle,
                                    color: _isHindiSelected
                                        ? PublicController.pc.toggleStatusBar()
                                        : Colors.white,
                                  ),
                                  selected: _isHindiSelected,
                                  selectedTileColor:
                                      PublicController.pc.toggleStatusBar(),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18.0),
                                        child: Text(lc.languageModel.value
                                            .languageModelContinue!),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.white,
                                        primary: Colors.indigo,
                                      ),
                                      onPressed: () {
                                        if (_isEnglishSelected) {
                                          LanguageController.lc
                                              .changeLanguage('english');
                                        } else {
                                          LanguageController.lc
                                              .changeLanguage('bangla');
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
