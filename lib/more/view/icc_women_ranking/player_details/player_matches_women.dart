import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/more/view/widgets/expandable_tile.dart';
import 'package:cricland/public/widgets/decoration.dart';
import 'package:flutter/material.dart';
import '../../../../public/controller/public_controller.dart';
import '../../../../public/variables/config.dart';
import '../../../../public/variables/variable.dart';

class PlayerMatchesWomen extends StatefulWidget {
  const PlayerMatchesWomen({Key? key}) : super(key: key);

  @override
  State<PlayerMatchesWomen> createState() => _PlayerMatchesWomenState();
}

class _PlayerMatchesWomenState extends State<PlayerMatchesWomen> {
  String _gameType = Variables.manGameType.first;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
      children: [
        SizedBox(height: dSize(.45)),

        ///Game Type
        Row(
          children: Variables.manGameType2
              .map((item) => Expanded(
                      child: InkWell(
                    onTap: () => setState(() => _gameType = item),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          right: item == Variables.manGameType2.last
                              ? 0.0
                              : dSize(.03)),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: item == _gameType
                                  ? Colors.transparent
                                  : PublicController.pc.isLight.value
                                      ? Colors.grey
                                      : PublicController.pc.toggleCardBg(),
                              width: 0.5),
                          gradient: item == _gameType
                              ? StDecoration().tabBarGradient
                              : null,
                          color: item == _gameType
                              ? null
                              : PublicController.pc.toggleCardBg(),
                          borderRadius:
                              BorderRadius.all(Radius.circular(dSize(.02)))),
                      padding: EdgeInsets.symmetric(
                          vertical: dSize(.025), horizontal: dSize(.04)),
                      child: Text(
                        item,
                        maxLines: 1,
                        style: AppTextStyle().bodyTextStyle.copyWith(
                              color: item == _gameType
                                  ? Colors.white
                                  : PublicController.pc.toggleTextColor(),
                            ),
                      ),
                    ),
                  )))
              .toList(),
        ),

        ListView.separated(
          itemCount: 20,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const ExpandableTile(),
          separatorBuilder: (context, index) => SizedBox(height: dSize(.04)),
        )
      ],
    );
  }
}
