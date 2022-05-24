import 'package:cricland/more/view/widgets/article_card_landscape.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../public/controller/public_controller.dart';
import '../../../../public/variables/colors.dart';
import '../../../../public/variables/config.dart';

class PlayerOverview extends StatefulWidget {
   const PlayerOverview({Key? key}) : super(key: key);

  @override
  State<PlayerOverview> createState() => _PlayerOverviewState();
}

class _PlayerOverviewState extends State<PlayerOverview> {
   final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.03),
      fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

   String _gameType=Variables.manGameType.first;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
      children: [
        SizedBox(height: dSize(.45)),
        Row(
          children: [
            Icon(Icons.sports_cricket,color: PublicController.pc.toggleTextColor(),size: dSize(.05)),
            Text(' Right Handed Batter',style: _textStyle.copyWith(fontSize: dSize(.035)))
          ],
        ),
        SizedBox(height: dSize(.04)),

        SizedBox(
          height: dSize(.075),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: Variables.manGameType.length,
            itemBuilder: (context, index)=>Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: dSize(.02)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
                border: Border.all(color: Colors.grey,)
              ),
              child: Text('#${index+1} Batter in ${Variables.manGameType[index]}',style: _textStyle,),
            ),
            separatorBuilder: (context, index)=>SizedBox(width: dSize(.04))),
        ),
        SizedBox(height: dSize(.1)),

        ///Recent Form
        RichText(
          text: TextSpan(
            style: _textStyle,
            children: [
              TextSpan(text: 'Recent Form', style: _textStyle.copyWith(fontSize: dSize(.04))),
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
              itemBuilder: (context, index)=>Container(
                width: dSize(.27),
                alignment: Alignment.center,
                //padding: EdgeInsets.symmetric(horizontal: dSize(.02)),
                decoration: BoxDecoration(
                  color: PublicController.pc.toggleCardBg(),
                  borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('0-2',style: TextStyle(
                      color: PublicController.pc.toggleLoadingColor(),
                      fontSize: dSize(.04),
                      fontWeight: FontWeight.bold
                    )),
                    Text('vs AUS TEST',style: _textStyle),
                  ],
                ),
              ),
              separatorBuilder: (context, index)=>SizedBox(width: dSize(.03))),
        ),
        SizedBox(height: dSize(.1)),

        ///Bowling Career
        RichText(
          text: TextSpan(
            style: _textStyle,
            children: [
              TextSpan(text: 'Bowling Career', style: _textStyle.copyWith(fontWeight: FontWeight.w500,fontSize: dSize(.04))),
              const TextSpan(text: ' (Right-arm offbreak)'),
            ],
          ),
        ),
        SizedBox(height: dSize(.04)),
        Row(
          children: Variables.manGameType.map((item) => Expanded(
              child: InkWell(
                onTap: ()=> setState(()=>_gameType=item),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: item==Variables.manGameType[0] || item==Variables.manGameType[1]
                      ?dSize(.03):0.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: item==_gameType
                          ? AllColor.primaryColor:PublicController.pc.isLight.value?Colors.grey:PublicController.pc.toggleCardBg(),
                          width: 0.5),
                      color: item==_gameType?AllColor.primaryColor:PublicController.pc.toggleCardBg(),
                      borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: dSize(.015),
                      horizontal: dSize(.04)),
                  child: Text(item,maxLines:1,style: TextStyle(
                      fontSize: dSize(.035),
                      fontWeight: FontWeight.w500,
                      color: item==_gameType
                          ? Colors.white:PublicController.pc.toggleTextColor()
                  ),),
                ),
              ))
          ).toList(),
        ),
        SizedBox(height: dSize(.04)),

        Row(
          children: Variables.playerOverview.map((item) => Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: PublicController.pc.toggleCardBg(),
                    border: item==Variables.playerOverview.last
                        ?null:const Border(right: BorderSide(color: Colors.grey,width: 0.3))
                ),
                padding: EdgeInsets.symmetric(
                    vertical: dSize(.04)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('40',maxLines:1,style: _textStyle.copyWith(fontSize: dSize(.05))),
                    Text(item,maxLines:1,style: _textStyle),
                  ],
                ),
              ))
          ).toList(),
        ),
        SizedBox(height: dSize(.02)),

        Row(
          children: Variables.bowlerOverview.map((item) => Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: PublicController.pc.toggleCardBg(),
                    border: item==Variables.playerOverview.last
                        ?null:const Border(right: BorderSide(color: Colors.grey,width: 0.3))
                ),
                padding: EdgeInsets.symmetric(
                    vertical: dSize(.04)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('1',maxLines:1,style: _textStyle.copyWith(fontSize: dSize(.05))),
                    Text(item,maxLines:1,style: _textStyle),
                  ],
                ),
              ))
          ).toList(),
        ),
        const Divider(height: 0.0,thickness: 0.3,color: Colors.grey),

        Row(
          children: Variables.iccRank.map((item) => Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: PublicController.pc.toggleCardBg(),
                    border: item==Variables.playerOverview.last
                        ?null:const Border(right: BorderSide(color: Colors.grey,width: 0.3))
                ),
                padding: EdgeInsets.symmetric(
                    vertical: dSize(.04)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('20',maxLines:1,style: _textStyle.copyWith(fontSize: dSize(.05))),
                    Text(item,maxLines:1,style: _textStyle),
                  ],
                ),
              ))
          ).toList(),
        ),
        SizedBox(height: dSize(.1)),

        ///Articles
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Latest Updates',style: _textStyle.copyWith(fontSize: dSize(.04),fontWeight: FontWeight.bold)),
            Text('View All',style: TextStyle(color: PublicController.pc.toggleLoadingColor(),
                fontWeight: FontWeight.w500,fontSize: dSize(.035))),
          ],
        ),
        SizedBox(height: dSize(.04)),
        SizedBox(
          height: dSize(.65),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index)=> ArticleCardLandscape(),
              separatorBuilder: (context, index)=>SizedBox(width: dSize(.04))),
        ),
        SizedBox(height: dSize(.1)),

        Text('Teams played for',style: _textStyle.copyWith(fontSize: dSize(.04),fontWeight: FontWeight.bold)),
        Container(
          padding: EdgeInsets.all(dSize(.04)),
          margin: EdgeInsets.only(top: dSize(.04)),
          decoration: BoxDecoration(
            color: PublicController.pc.toggleCardBg(),
            borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
          ),
          child: Text('Team India has been known to have quality batsmen over the years,'
              ' but the former India opener feels the team has dominated Test cricket consistently',
            style: _textStyle.copyWith(fontSize: dSize(.038))),
        ),
        SizedBox(height: dSize(.1)),

        ///About
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('About Sakib-Al-Hasan',style: _textStyle.copyWith(fontSize: dSize(.04),fontWeight: FontWeight.bold)),
            Text('Player Info',style: TextStyle(color: PublicController.pc.toggleLoadingColor(),
                fontWeight: FontWeight.w500,fontSize: dSize(.035))),
          ],
        ),
        SizedBox(height: dSize(.04)),
        Container(
          padding: EdgeInsets.all(dSize(.04)),
          decoration: BoxDecoration(
              color: PublicController.pc.toggleCardBg(),
              borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
          ),
          child: Column(
            children: [
              _aboutBuilder('Name', 'Sakib-Al-Hasan'),
              Divider(height: dSize(.1),thickness: 0.3,color: Colors.grey),
              _aboutBuilder('Birth', '15 Oct 1998'),
              Divider(height: dSize(.1),thickness: 0.3,color: Colors.grey),
              _aboutBuilder('Birth Place', 'Dhaka, Bangladesh'),
              Divider(height: dSize(.1),thickness: 0.3,color: Colors.grey),
              _aboutBuilder('Height', 'NA'),
              Divider(height: dSize(.1),thickness: 0.3,color: Colors.grey),
              _aboutBuilder('Nationality', 'Bangladeshi'),
            ],
          ),
        ),
        SizedBox(height: dSize(.1)),

        Container(
          padding: EdgeInsets.all(dSize(.04)),
          decoration: BoxDecoration(
              color: PublicController.pc.toggleCardBg(),
              borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
          ),
          child: Text(Variables.aboutSakib,textAlign: TextAlign.justify,style: _textStyle.copyWith(fontSize: dSize(.035))),
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
  }

  Widget _aboutBuilder(String key, String value)=>Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Text(key,style: _textStyle.copyWith(fontSize: dSize(.035)))),
      Expanded(
          flex: 2,
          child: Text(value,style: _textStyle.copyWith(fontSize: dSize(.035)))),
    ],
  );

  Widget _socialRowBuilder(IconData icon, String title)=>Expanded(
    child: Row(
      children: [
        Icon(icon,size: dSize(.05),color: PublicController.pc.toggleTextColor()),
        Text(' $title',style: _textStyle)
      ],
    ),
  );
}
