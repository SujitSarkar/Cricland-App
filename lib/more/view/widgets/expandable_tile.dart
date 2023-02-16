import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';
import '../../../public/variables/variable.dart';
import 'dart:math' as math;

class ExpandableTile extends StatelessWidget {
  const ExpandableTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(dSize(.02), dSize(.02), dSize(.02), 0.0),
      decoration: BoxDecoration(
        color: PublicController.pc.toggleCardBg(),
        borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
      ),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
            iconColor: PublicController.pc.toggleTextColor(),
            collapseIcon: LineAwesomeIcons.angle_up,
            expandIcon: LineAwesomeIcons.angle_down,
            iconSize: dSize(.04)),
        header: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/bd_logo.png', height: dSize(.12)),
            SizedBox(width: dSize(.02)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'BAN vs SRI 2022',
                    style: AppTextStyle().largeTitleStyle.copyWith(
                      fontSize: dSize(.035),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                  Text(
                    '${DateFormat('dd MMM').format(DateTime.now())} '
                    '- ${DateFormat('dd MMM').format(DateTime.now().add(const Duration(days: 2)))} * Played for Ban',
                    style: AppTextStyle().paragraphTextStyle.copyWith(
                      fontSize: dSize(.03),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        collapsed: const Text(''),
        expanded: Column(
          children: [
            SizedBox(height: dSize(.04)),
            Container(
              decoration: BoxDecoration(
                  color: PublicController.pc.toggleCardBg(),
                  borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))),
              child: Column(
                children: [
                  ///TEST Card Header
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(left: dSize(.03)),
                        decoration: BoxDecoration(
                            color: PublicController.pc.toggleCardHeader(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(dSize(.02))),
                            border: Border.all(
                                color: PublicController.pc.toggleCardHeader())),
                        child: Row(
                          children: Variables.playerMatchOverview
                              .map((item) => Expanded(
                                      child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: item ==
                                                Variables
                                                    .playerMatchOverview.last
                                            ? null
                                            : const Border(
                                                right: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.1))),
                                    padding: EdgeInsets.symmetric(
                                        vertical: dSize(.03)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '40',
                                          maxLines: 1,
                                          style: AppTextStyle()
                                              .largeTitleStyle
                                              .copyWith(
                                            fontSize: dSize(.04),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                        Text(
                                          item,
                                          maxLines: 1,
                                          style: AppTextStyle().paragraphTextStyle
                                              .copyWith(
                                            fontSize: dSize(.03),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )))
                              .toList(),
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: dSize(.037)),
                            decoration: BoxDecoration(
                                color: PublicController.pc.toggleCardBg(),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(dSize(.04))),
                                border:
                                    Border.all(color: Colors.grey, width: .3)),
                            child: Transform.rotate(
                                angle: 270 * math.pi / 180,
                                child: Text(
                                  "TEST",
                                  style:
                                      AppTextStyle().paragraphTextStyle.copyWith(
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ))
                            //Text('T20',style: _textStyle.copyWith(fontSize: dSize(.035))),
                            ),
                      )
                    ],
                  ),
                  SizedBox(height: dSize(.04)),

                  //TEST Data Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            Variables.scoreDateMatch.first,
                            style: AppTextStyle().paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            Variables.scoreDateMatch[1],
                            style: AppTextStyle().paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )),
                      Expanded(
                        flex: 3,
                        child: Text(
                          Variables.scoreDateMatch.last,
                          textAlign: TextAlign.end,
                          style: AppTextStyle().paragraphTextStyle.copyWith(
                            fontSize: dSize(.03),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              '105(117)',
                              style: AppTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Text(
                              '02 Apr',
                              style: AppTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Text(
                              '3dr TEST vs SRI',
                              textAlign: TextAlign.end,
                              style: AppTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                            )),
                      ],
                    ),
                    separatorBuilder: (context, index) => Divider(
                        color: Colors.grey, thickness: 0.1, height: dSize(.1)),
                  ),
                  SizedBox(height: dSize(.1)),

                  ///ODI Card Header
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(left: dSize(.03)),
                        decoration: BoxDecoration(
                            color: PublicController.pc.toggleCardHeader(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(dSize(.02))),
                            border: Border.all(
                                color: PublicController.pc.toggleCardHeader())),
                        child: Row(
                          children: Variables.playerMatchOverview
                              .map((item) => Expanded(
                                      child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: item ==
                                                Variables
                                                    .playerMatchOverview.last
                                            ? null
                                            : const Border(
                                                right: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.1))),
                                    padding: EdgeInsets.symmetric(
                                        vertical: dSize(.03)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '40',
                                          maxLines: 1,
                                          style: AppTextStyle()
                                              .largeTitleStyle
                                              .copyWith(
                                            fontSize: dSize(.04),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                        Text(
                                          item,
                                          maxLines: 1,
                                          style: AppTextStyle().paragraphTextStyle
                                              .copyWith(
                                            fontSize: dSize(.03),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )))
                              .toList(),
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: dSize(.037)),
                            decoration: BoxDecoration(
                                color: PublicController.pc.toggleCardBg(),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(dSize(.04))),
                                border:
                                    Border.all(color: Colors.grey, width: .3)),
                            child: Transform.rotate(
                                angle: 270 * math.pi / 180,
                                child: Text(
                                  "ODI",
                                  style:
                                      AppTextStyle().paragraphTextStyle.copyWith(
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ))
                            //Text('T20',style: _textStyle.copyWith(fontSize: dSize(.035))),
                            ),
                      )
                    ],
                  ),
                  SizedBox(height: dSize(.04)),

                  //ODI Data Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            Variables.scoreDateMatch.first,
                            style: AppTextStyle().paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            Variables.scoreDateMatch[1],
                            style: AppTextStyle().paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            Variables.scoreDateMatch.last,
                            textAlign: TextAlign.end,
                            style: AppTextStyle().paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            '105(117)',
                            style: AppTextStyle().paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(
                              '02 Apr',
                              style: AppTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Text(
                              '3dr TEST vs SRI',
                              textAlign: TextAlign.end,
                              style: AppTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                            )),
                      ],
                    ),
                    separatorBuilder: (context, index) => Divider(
                        color: Colors.grey, thickness: 0.1, height: dSize(.1)),
                  ),
                  SizedBox(height: dSize(.1)),

                  ///T20 Card Header
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(left: dSize(.03)),
                        decoration: BoxDecoration(
                            color: PublicController.pc.toggleCardHeader(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(dSize(.02))),
                            border: Border.all(
                                color: PublicController.pc.toggleCardHeader())),
                        child: Row(
                          children: Variables.playerMatchOverview
                              .map((item) => Expanded(
                                      child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: item ==
                                                Variables
                                                    .playerMatchOverview.last
                                            ? null
                                            : const Border(
                                                right: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.1))),
                                    padding: EdgeInsets.symmetric(
                                        vertical: dSize(.03)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '40',
                                          maxLines: 1,
                                          style: AppTextStyle()
                                              .largeTitleStyle
                                              .copyWith(
                                            fontSize: dSize(.04),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                        Text(
                                          item,
                                          maxLines: 1,
                                          style: AppTextStyle().paragraphTextStyle
                                              .copyWith(
                                            fontSize: dSize(.03),
                                            color: PublicController.pc
                                                .toggleTextColor(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )))
                              .toList(),
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: dSize(.037)),
                            decoration: BoxDecoration(
                                color: PublicController.pc.toggleCardBg(),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(dSize(.04))),
                                border:
                                    Border.all(color: Colors.grey, width: .3)),
                            child: Transform.rotate(
                                angle: 270 * math.pi / 180,
                                child: Text(
                                  "T20",
                                  style:
                                      AppTextStyle().paragraphTextStyle.copyWith(
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ))
                            //Text('T20',style: _textStyle.copyWith(fontSize: dSize(.035))),
                            ),
                      )
                    ],
                  ),
                  SizedBox(height: dSize(.04)),

                  //T20 Data Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            Variables.scoreDateMatch.first,
                            style: AppTextStyle().paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            Variables.scoreDateMatch[1],
                            style: AppTextStyle().paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            Variables.scoreDateMatch.last,
                            textAlign: TextAlign.end,
                            style: AppTextStyle().paragraphTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              '105(117)',
                              style: AppTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Text(
                              '02 Apr',
                              style: AppTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Text(
                              '3dr TEST vs SRI',
                              textAlign: TextAlign.end,
                              style: AppTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                            )),
                      ],
                    ),
                    separatorBuilder: (context, index) => Divider(
                        color: Colors.grey, thickness: 0.1, height: dSize(.1)),
                  ),

                  SizedBox(height: dSize(.02))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
