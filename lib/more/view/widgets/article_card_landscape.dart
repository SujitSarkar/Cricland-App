import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/news/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';
import '../../../news/view/read_news_page.dart';

class ArticleCardLandscape extends StatelessWidget {
  ArticleCardLandscape({Key? key}) : super(key: key);

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.04),
      fontWeight: FontWeight.bold,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => ReadNewsPage(model: ArticleModel())),
      child: Container(
        decoration: BoxDecoration(
            color: PublicController.pc.toggleCardBg(),
            borderRadius: BorderRadius.all(Radius.circular(dSize(.04)))),
        width: dSize(.55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
                child: Image.asset('assets/t20.png',
                    height: dSize(.35), fit: BoxFit.cover)),
            SizedBox(height: dSize(.02)),
            Padding(
              padding: EdgeInsets.only(
                  left: dSize(.02), right: dSize(.02), bottom: dSize(.02)),
              child: Text(
                'Umran Malik is nowhere near the finished article: Ian Bishop -'
                ' Firstcricket News, Firstpost Umran Malik is nowhere near the finished article: Ian Bishop -'
                ' Firstcricket News, Firstpos',
                maxLines: 4,
                style: CLTextStyle.paragraphTextStyle.copyWith(
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
