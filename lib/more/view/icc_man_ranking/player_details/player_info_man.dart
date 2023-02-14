import 'package:cricland/home/model/custom_widget/app_text_style.dart';
import 'package:cricland/more/controller/ranking_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PlayerInfoMan extends StatelessWidget {
  PlayerInfoMan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.find();
    return GetBuilder<RankingController>(builder: (rankingController) {
      return rankingController.playerInfoModel.value.name != null
          ? ListView(
              padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
              children: [
                SizedBox(height: dSize(.45)),
                Container(
                  padding: EdgeInsets.all(dSize(.04)),
                  decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius:
                          BorderRadius.all(Radius.circular(dSize(.02)))),
                  child: Column(
                    children: [
                      _aboutBuilder(
                          'Role:',
                          rankingController.playerInfoModel.value.role ??
                              "N/A"),
                      Divider(
                          height: dSize(.1),
                          thickness: 0.2,
                          color: Colors.grey),
                      _aboutBuilder('Bats:',
                          rankingController.playerInfoModel.value.bat ?? "N/A"),
                      Divider(
                          height: dSize(.1),
                          thickness: 0.2,
                          color: Colors.grey),
                      _aboutBuilder(
                          'Bowl:',
                          rankingController.playerInfoModel.value.bowl ??
                              "N/A"),
                    ],
                  ),
                ),
                SizedBox(height: dSize(.1)),
                Text(
                    'About ${rankingController.playerInfoModel.value.name ?? ''}',
                    style: AppTextStyle().largeTitleBoldStyle),
                SizedBox(height: dSize(.02)),
                Container(
                  padding: EdgeInsets.all(dSize(.04)),
                  decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius:
                          BorderRadius.all(Radius.circular(dSize(.02)))),
                  child: Column(
                    children: [
                      _aboutBuilder(
                          'Name',
                          rankingController.playerInfoModel.value.name ??
                              "N/A"),
                      Divider(
                          height: dSize(.1),
                          thickness: 0.2,
                          color: Colors.grey),
                      _aboutBuilder(
                          'Birth',
                          rankingController.playerInfoModel.value.doBFormat ??
                              "N/A"),
                      Divider(
                          height: dSize(.1),
                          thickness: 0.2,
                          color: Colors.grey),
                      _aboutBuilder(
                          'Birth Place',
                          rankingController.playerInfoModel.value.birthPlace ??
                              "N/A"),
                      Divider(
                          height: dSize(.1),
                          thickness: 0.2,
                          color: Colors.grey),
                      _aboutBuilder(
                          'Height',
                          rankingController.playerInfoModel.value.height ??
                              "N/A"),
                      Divider(
                          height: dSize(.1),
                          thickness: 0.2,
                          color: Colors.grey),
                      _aboutBuilder(
                          'Nationality',
                          rankingController.playerInfoModel.value.intlTeam ??
                              "N/A"),
                    ],
                  ),
                ),
                SizedBox(height: dSize(.1)),
                Container(
                    padding: EdgeInsets.all(dSize(.02)),
                    decoration: BoxDecoration(
                        color: PublicController.pc.toggleCardBg(),
                        borderRadius:
                            BorderRadius.all(Radius.circular(dSize(.02)))),
                    child: Html(
                      data:
                          """ ${rankingController.playerInfoModel.value.bio ?? ''} """,
                      style: {
                        'strong':
                            Style(color: publicController.toggleTextColor()),
                        'body':
                            Style(color: publicController.toggleTextColor()),
                        'span':
                            Style(color: publicController.toggleTextColor()),
                        'p': Style(color: publicController.toggleTextColor()),
                        'li': Style(color: publicController.toggleTextColor()),
                        'ul': Style(color: publicController.toggleTextColor()),
                        'table':
                            Style(color: publicController.toggleTextColor()),
                        'tbody':
                            Style(color: publicController.toggleTextColor()),
                        'tr': Style(color: publicController.toggleTextColor()),
                        'td': Style(color: publicController.toggleTextColor()),
                        'th': Style(color: publicController.toggleTextColor()),
                      },
                    )),
                SizedBox(height: dSize(.1)),
                _socialRowBuilder(
                    FontAwesomeIcons.earthAsia,
                    rankingController.playerInfoModel.value.name ?? '',
                    rankingController.playerInfoModel.value.appIndex!.webUrl ??
                        ''),
                SizedBox(height: dSize(.1)),
              ],
            )
          : const SizedBox.shrink();
    });
  }

  Widget _aboutBuilder(String key, String value) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                key,
                style: AppTextStyle().paragraphTextStyle.copyWith(
                      fontSize: dSize(.035),
                      color: PublicController.pc.toggleTextColor(),
                    ),
              )),
          Expanded(
              flex: 2,
              child: Text(
                value,
                style: AppTextStyle().paragraphTextStyle.copyWith(
                      fontSize: dSize(.035),
                      color: PublicController.pc.toggleTextColor(),
                    ),
              )),
        ],
      );

  Widget _socialRowBuilder(IconData icon, String title, String url) => Expanded(
        child: InkWell(
          onTap: () {
            launchInWebViewOrVC(url);
          },
          child: Row(
            children: [
              Icon(icon,
                  size: dSize(.05),
                  color: PublicController.pc.toggleTextColor()),
              Text(
                ' $title',
                style: AppTextStyle().paragraphTextStyle.copyWith(
                      fontSize: dSize(.03),
                      color: PublicController.pc.toggleTextColor(),
                    ),
              )
            ],
          ),
        ),
      );
}
