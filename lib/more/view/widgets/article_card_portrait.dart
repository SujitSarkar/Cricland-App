import 'package:cricland/news/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';
import '../icc_man_ranking/player_details/read_news_page.dart';

class ArticleCardPortrait extends StatelessWidget {
  ArticleCardPortrait({Key? key, required this.model}) : super(key: key);
  final ArticleModel model;

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
              child: Image.network(model.imageLink!,height: dSize(.5),width: double.infinity,fit: BoxFit.cover)),
            SizedBox(height: dSize(.04)),

            Padding(
              padding: EdgeInsets.only(left: dSize(.02),right: dSize(.02),bottom: dSize(.02)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title!,style: _textStyle),
                  SizedBox(height: dSize(.02)),
                  Text(DateFormat('dd MMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(model.timeStamp!)),style: _textStyle.copyWith(fontSize: dSize(.03),fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
