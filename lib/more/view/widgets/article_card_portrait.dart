import 'package:cricland/news/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';
import '../../../news/view/read_news_page.dart';

class ArticleCardPortrait extends StatefulWidget {
  ArticleCardPortrait({Key? key, required this.model}) : super(key: key);
  final ArticleModel model;

  @override
  State<ArticleCardPortrait> createState() => _ArticleCardPortraitState();
}

class _ArticleCardPortraitState extends State<ArticleCardPortrait> {
  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.04),
      fontWeight: FontWeight.bold,
      color: PublicController.pc.toggleTextColor());
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();

    youtubePlayerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
          startAt: Duration(seconds: 30),
          showFullscreenButton: true,
          autoPlay: false,
          mute: true
      ),
    );
    youtubePlayerController = YoutubePlayerController()..onInit = (){
      youtubePlayerController.loadVideo(widget.model.youtubeVideoLink!);
    };
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>ReadNewsPage(model: widget.model)),
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
              child: widget.model.youtubeVideoLink!.isEmpty
                  ? Image.network(widget.model.imageLink!,height: dSize(.5),width: double.infinity,fit: BoxFit.cover)
                  : YoutubePlayer(
                controller: youtubePlayerController,
                aspectRatio: 16/9,
              )),
            SizedBox(height: dSize(.04)),

            Padding(
              padding: EdgeInsets.only(left: dSize(.02),right: dSize(.02),bottom: dSize(.02)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.model.title!,style: _textStyle),
                  SizedBox(height: dSize(.02)),
                  Text(DateFormat('dd MMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(widget.model.timeStamp!)),style: _textStyle.copyWith(fontSize: dSize(.03),fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
