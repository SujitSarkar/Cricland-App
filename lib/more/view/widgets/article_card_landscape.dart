import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/news/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';
import '../../../news/view/read_news_page.dart';

class ArticleCardLandscape extends StatelessWidget {
  const ArticleCardLandscape({Key? key, required this.model}) : super(key: key);
  final ArticleModel model;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => ReadNewsPage(model: model)),
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
                child: CachedNetworkImage(
                    imageUrl: model.imageLink!,
                    placeholder: ((context, url) => Icon(Icons.image,
                        size: dSize(.35), color: Colors.grey.shade400)),
                    height: dSize(.35),
                    fit: BoxFit.cover)),
            SizedBox(height: dSize(.02)),
            Padding(
              padding: EdgeInsets.only(
                  left: dSize(.02), right: dSize(.02), bottom: dSize(.02)),
              child: Text(
                model.title!,
                maxLines: 4,
                style: AppTextStyle().paragraphTextStyle.copyWith(
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
