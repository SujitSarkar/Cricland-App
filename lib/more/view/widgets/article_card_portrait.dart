import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';
import '../icc_man_ranking/player_details/read_news_page.dart';

class ArticleCardPortrait extends StatelessWidget {
  ArticleCardPortrait({Key? key}) : super(key: key);

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.04),
      fontWeight: FontWeight.bold,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>ReadNewsPage()),
      child: Container(
        decoration: BoxDecoration(
          color: PublicController.pc.toggleCardBg(),
          borderRadius: BorderRadius.all(Radius.circular(dSize(.04)))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
              child: Image.asset('assets/t20.png',height: dSize(.5),width: double.infinity,fit: BoxFit.cover)),
            SizedBox(height: dSize(.04)),

            Padding(
              padding: EdgeInsets.only(left: dSize(.02),right: dSize(.02),bottom: dSize(.02)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Umran Malik is nowhere near the finished article: Ian Bishop -'
                      ' Firstcricket News, Firstpost',style: _textStyle),
                  SizedBox(height: dSize(.02)),
                  Text(DateFormat('dd MMM yyyy').format(DateTime.now()),style: _textStyle.copyWith(fontSize: dSize(.03),fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
