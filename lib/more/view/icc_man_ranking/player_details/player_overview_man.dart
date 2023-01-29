import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/more/controller/ranking_controller.dart';
import 'package:cricland/more/view/widgets/article_card_landscape.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PlayerOverviewMan extends StatefulWidget {
  const PlayerOverviewMan({Key? key}) : super(key: key);

  @override
  State<PlayerOverviewMan> createState() => _PlayerOverviewManState();
}

class _PlayerOverviewManState extends State<PlayerOverviewMan> {
  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.03),
      fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  String _gameType = Variables.manGameType.first;

  @override
  Widget build(BuildContext context) {
    final RankingController rankingController = Get.find();
    final PublicController publicController = Get.find();
    return GetBuilder<HomeController>(builder: (homeController) {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
        children: [
          SizedBox(height: dSize(.45)),
          Row(
            children: [
              Icon(
                Icons.sports_cricket,
                color: PublicController.pc.toggleTextColor(),
                size: dSize(.05),
              ),
              const SizedBox(width: 10),
              Text(
                homeController.playerInfoModel.bat ?? '',
                style: CLTextStyle.nameTextStyle.copyWith(
                  fontSize: dSize(.035),
                ),
              )
            ],
          ),
          SizedBox(height: dSize(.04)),

          SizedBox(
            height: dSize(.075),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: Variables.manGameType.length,
                itemBuilder: (context, index) => Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: dSize(.02)),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(dSize(.02))),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: Text(
                        '#${index + 1} Batter in ${Variables.manGameType[index]}',
                        style: CLTextStyle.paragraphTextStyle.copyWith(
                          fontSize: dSize(.03),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    SizedBox(width: dSize(.04))),
          ),
          SizedBox(height: dSize(.1)),

          ///Recent Form
          RichText(
            text: TextSpan(
              style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                  fontSize: dSize(.03),
                  color: PublicController.pc.toggleTextColor()),
              children: [
                TextSpan(
                  text: 'Recent Form',
                  style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                    fontSize: dSize(.04),
                  ),
                ),
                const TextSpan(text: ' (last played on 21 march)'),
              ],
            ),
          ),
          SizedBox(height: dSize(.04)),
          SizedBox(
            height: dSize(.25),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                      width: dSize(.27),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: PublicController.pc.toggleCardBg(),
                        borderRadius:
                            BorderRadius.all(Radius.circular(dSize(.02))),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '0-2',
                            style: CLTextStyle.paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor()),
                          ),
                          Text('vs AUS TEST',
                              style: CLTextStyle.paragraphTextStyle.copyWith(
                                  fontSize: dSize(.03),
                                  color:
                                      PublicController.pc.toggleTextColor())),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    SizedBox(width: dSize(.03))),
          ),
          SizedBox(height: dSize(.1)),

          ///Bowling Career
          RichText(
            text: TextSpan(
              style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                  fontSize: dSize(.03),
                  color: PublicController.pc.toggleTextColor()),
              children: [
                TextSpan(
                    text: 'Bowling Career',
                    style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor())),
                TextSpan(
                    text: homeController.playerInfoModel.bowl != null
                        ? ' (${homeController.playerInfoModel.bowl})'
                        : ""),
              ],
            ),
          ),
          SizedBox(height: dSize(.04)),
          Row(
            children: Variables.manGameType
                .map((item) => Expanded(
                        child: InkWell(
                      onTap: () => setState(() => _gameType = item),
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: item == Variables.manGameType.last
                                ? 0.0
                                : dSize(.03)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: item == _gameType
                                    ? AllColor.primaryColor
                                    : PublicController.pc.isLight.value
                                        ? Colors.grey
                                        : PublicController.pc.toggleCardBg(),
                                width: 0.5),
                            color: item == _gameType
                                ? AllColor.primaryColor
                                : PublicController.pc.toggleCardBg(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(dSize(.02)))),
                        padding: EdgeInsets.symmetric(
                            vertical: dSize(.015), horizontal: dSize(.04)),
                        child: Text(
                          item,
                          maxLines: 1,
                          style: CLTextStyle.paragraphHeadLineTextStyle
                              .copyWith(
                                  fontSize: dSize(.035),
                                  color: item == _gameType
                                      ? Colors.white
                                      : PublicController.pc.toggleTextColor()),
                        ),
                      ),
                    )))
                .toList(),
          ),
          SizedBox(height: dSize(.04)),

          Row(
            children: Variables.playerOverview
                .map((item) => Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: PublicController.pc.toggleCardBg(),
                          border: item == Variables.playerOverview.last
                              ? null
                              : const Border(
                                  right: BorderSide(
                                      color: Colors.grey, width: 0.3))),
                      padding: EdgeInsets.symmetric(vertical: dSize(.04)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('40',
                              maxLines: 1,
                              style: CLTextStyle.paragraphTextStyle.copyWith(
                                  fontSize: dSize(.045),
                                  color:
                                      PublicController.pc.toggleTextColor())),
                          Text(
                            item,
                            maxLines: 1,
                            style: CLTextStyle.paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ],
                      ),
                    )))
                .toList(),
          ),
          SizedBox(height: dSize(.02)),

          Row(
            children: Variables.bowlerOverview
                .map((item) => Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: PublicController.pc.toggleCardBg(),
                          border: item == Variables.playerOverview.last
                              ? null
                              : const Border(
                                  right: BorderSide(
                                      color: Colors.grey, width: 0.3))),
                      padding: EdgeInsets.symmetric(vertical: dSize(.04)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '1',
                            maxLines: 1,
                            style: CLTextStyle.paragraphTextStyle.copyWith(
                              fontSize: dSize(.045),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                          Text(
                            item,
                            maxLines: 1,
                            style: CLTextStyle.paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ],
                      ),
                    )))
                .toList(),
          ),
          const Divider(height: 0.0, thickness: 0.3, color: Colors.grey),

          Row(
            children: Variables.iccRank
                .map((item) => Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: PublicController.pc.toggleCardBg(),
                          border: item == Variables.playerOverview.last
                              ? null
                              : const Border(
                                  right: BorderSide(
                                      color: Colors.grey, width: 0.3))),
                      padding: EdgeInsets.symmetric(vertical: dSize(.04)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '20',
                            maxLines: 1,
                            style: CLTextStyle.paragraphTextStyle.copyWith(
                              fontSize: dSize(.045),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                          Text(
                            item,
                            maxLines: 1,
                            style: CLTextStyle.paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ],
                      ),
                    )))
                .toList(),
          ),
          SizedBox(height: dSize(.1)),

          ///Articles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Updates',
                style: CLTextStyle.paragraphTextStyle.copyWith(
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ],
          ),
          SizedBox(height: dSize(.04)),
          SizedBox(
            height: dSize(.65),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: rankingController.recentArticleList.length,
                itemBuilder: (context, index) => ArticleCardLandscape(model: rankingController.recentArticleList[index]),
                separatorBuilder: (context, index) =>
                    SizedBox(width: dSize(.04))),
          ),
          SizedBox(height: dSize(.1)),

          Text(
            'Teams played for',
            style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
              fontSize: dSize(.04),
              color: PublicController.pc.toggleTextColor(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(dSize(.04)),
            margin: EdgeInsets.only(top: dSize(.04)),
            decoration: BoxDecoration(
                color: PublicController.pc.toggleCardBg(),
                borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))),
            child: Text(
              rankingController.playerInfoModel.value.teams ?? 'N/A',
              textAlign: TextAlign.justify,
              style: CLTextStyle.paragraphTextStyle.copyWith(
                fontSize: dSize(.038),
                color: PublicController.pc.toggleTextColor(),
              ),
            ),
          ),
          SizedBox(height: dSize(.1)),

          ///About
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About ${rankingController.playerInfoModel.value.name ?? ''}',
                style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              Text(
                'Player Info',
                style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                  fontSize: dSize(.035),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            ],
          ),
          SizedBox(height: dSize(.04)),
          if (rankingController.playerInfoModel.value.name != null)
            Container(
              padding: EdgeInsets.all(dSize(.04)),
              decoration: BoxDecoration(
                  color: PublicController.pc.toggleCardBg(),
                  borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))),
              child: Column(
                children: [
                  _aboutBuilder('Name',
                      rankingController.playerInfoModel.value.name ?? 'N/A'),
                  Divider(
                      height: dSize(.1), thickness: 0.3, color: Colors.grey),
                  _aboutBuilder(
                      'Birth',
                      rankingController.playerInfoModel.value.doBFormat ??
                          'N/A'),
                  Divider(
                      height: dSize(.1), thickness: 0.3, color: Colors.grey),
                  _aboutBuilder(
                      'Birth Place',
                      rankingController.playerInfoModel.value.birthPlace ??
                          'N/A'),
                  Divider(
                      height: dSize(.1), thickness: 0.3, color: Colors.grey),
                  _aboutBuilder('Height',
                      rankingController.playerInfoModel.value.height ?? "N/A"),
                  Divider(
                      height: dSize(.1), thickness: 0.3, color: Colors.grey),
                  _aboutBuilder(
                      'Nationality',
                      rankingController.playerInfoModel.value.intlTeam ??
                          'N/A'),
                ],
              ),
            ),
          SizedBox(height: dSize(.1)),

          Container(
              padding: EdgeInsets.all(dSize(.02)),
              decoration: BoxDecoration(
                  color: PublicController.pc.toggleCardBg(),
                  borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))),
              child: Html(
                data:
                    """ ${rankingController.playerInfoModel.value.bio ?? ''} """,
                style: {
                  'strong': Style(color: publicController.toggleTextColor()),
                  'body': Style(color: publicController.toggleTextColor()),
                  'span': Style(color: publicController.toggleTextColor()),
                  'p': Style(color: publicController.toggleTextColor()),
                  'li': Style(color: publicController.toggleTextColor()),
                  'ul': Style(color: publicController.toggleTextColor()),
                  'table': Style(color: publicController.toggleTextColor()),
                  'tbody': Style(color: publicController.toggleTextColor()),
                  'tr': Style(color: publicController.toggleTextColor()),
                  'td': Style(color: publicController.toggleTextColor()),
                  'th': Style(color: publicController.toggleTextColor())
                },
              )),
          SizedBox(height: dSize(.1)),

          if (rankingController.playerInfoModel.value.name != null)
            _socialRowBuilder(
                FontAwesomeIcons.earthAsia,
                rankingController.playerInfoModel.value.name ?? '',
                rankingController.playerInfoModel.value.appIndex!.webUrl ?? ''),
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
                  fontSize: dSize(.035),
                  color: PublicController.pc.toggleTextColor(),
                ),
              )),
          Expanded(
              flex: 2,
              child: Text(
                value,
                style: CLTextStyle.paragraphTextStyle.copyWith(
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
                style: CLTextStyle.paragraphTextStyle.copyWith(
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              )
            ],
          ),
        ),
      );
}
