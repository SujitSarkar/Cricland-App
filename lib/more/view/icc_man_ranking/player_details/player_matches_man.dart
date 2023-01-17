import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/more/view/widgets/expandable_tile.dart';
import 'package:flutter/material.dart';
import '../../../../public/controller/public_controller.dart';
import '../../../../public/variables/colors.dart';
import '../../../../public/variables/config.dart';
import '../../../../public/variables/variable.dart';

class PlayerMatchesMan extends StatefulWidget {
  const PlayerMatchesMan({Key? key}) : super(key: key);

  @override
  State<PlayerMatchesMan> createState() => _PlayerMatchesManState();
}

class _PlayerMatchesManState extends State<PlayerMatchesMan> {
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
                        style: CLTextStyle.optionTextStyle.copyWith(
                          fontSize: dSize(.035),
                          color: item == _gameType
                              ? Colors.white
                              : PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                  )))
              .toList(),
        ),
        //SizedBox(height: dSize(.1)),

        ListView.separated(
          itemCount: 20,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ExpandableTile(),
          separatorBuilder: (context, index) => SizedBox(height: dSize(.04)),
        )
      ],
    );
  }
}
