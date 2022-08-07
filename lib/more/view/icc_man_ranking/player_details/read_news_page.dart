import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ReadNewsPage extends StatelessWidget {
  ReadNewsPage({Key? key}) : super(key: key);
  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.03),
      fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyUI(),
      floatingActionButton: IconButton(
        onPressed: ()=>Get.back(),
        icon: Icon(Icons.cancel,color: Colors.grey,size: dSize(.09)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }

  Widget _bodyUI()=>ListView(
    children: [
      Image.asset('assets/article_land.jpg',fit: BoxFit.fitWidth),

      Padding(
        padding: EdgeInsets.all(dSize(.04)),
        child: Column(
          children: [
            Row(
              children: [
                _cardTile('BAN'),
                _cardTile('S Al Hasan'),
                _cardTile('M Haque'),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:dSize(.02),vertical: dSize(.002)),
                  child: Text(DateFormat('MMM dd, yyyy').format(DateTime.now()),style: _textStyle),
                  decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius: BorderRadius.all(Radius.circular(dSize(.01)))
                  ),
                )
              ],
            ),
            SizedBox(height:dSize(.06)),

            Text('BAN vs SL | 1st Test | Shakib Al Hasan set to play against Sri Lanka, confirmed Mominul Haque',
              style: _textStyle.copyWith(fontSize: dSize(.055),fontWeight: FontWeight.bold)),
            SizedBox(height:dSize(.06)),

            Text(Variables.aboutSakib,
                style: _textStyle.copyWith(fontSize: dSize(.04))),
            SizedBox(height:dSize(.1)),

            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index)=> Container(),//ArticleCardPortrait(),
              separatorBuilder: (context, index)=>SizedBox(height: dSize(.08)),
            )
          ],
        ),
      )
    ],
  );

  Widget _cardTile(String title)=>Container(
    margin: EdgeInsets.only(right: dSize(.02)),
    padding: EdgeInsets.symmetric(horizontal:dSize(.02),vertical: dSize(.002)),
    child: Text(title,style: _textStyle),
    decoration: BoxDecoration(
        color: PublicController.pc.toggleCardBg(),
        borderRadius: BorderRadius.all(Radius.circular(dSize(.01)))
    ),
  );
}
