import 'package:cricland/news/model/article_model.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ReadNewsPage extends StatefulWidget {
  const ReadNewsPage({Key? key, required this.model}) : super(key: key);
  final ArticleModel model;

  @override
  State<ReadNewsPage> createState() => _ReadNewsPageState();
}

class _ReadNewsPageState extends State<ReadNewsPage> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();

    youtubePlayerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        autoPlay: false,
        mute: true,
      ),
    )..onInit = () {
        youtubePlayerController.loadVideo(widget.model.youtubeVideoLink!);
      };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyUI(),
      floatingActionButton: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.cancel, color: Colors.grey, size: dSize(.09)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }

  Widget _bodyUI() => ListView(
        children: [
          widget.model.youtubeVideoLink!.isEmpty
              ? Image.network(widget.model.imageLink!, fit: BoxFit.fitWidth)
              : YoutubePlayer(
                  controller: youtubePlayerController,
                  aspectRatio: 16 / 9,
                ),
          Padding(
            padding: EdgeInsets.all(dSize(.04)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: dSize(.02), vertical: dSize(.002)),
                  child: Text(
                      DateFormat('MMM dd, yyyy').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              widget.model.timeStamp!)),
                      textAlign: TextAlign.start,
                      style: AppTextStyle().paragraphTextStyle),
                  decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius:
                          BorderRadius.all(Radius.circular(dSize(.01)))),
                ),
                SizedBox(height: dSize(.06)),
                Text(widget.model.title!,
                    style: AppTextStyle().titleTextBoldStyle),
                SizedBox(height: dSize(.06)),
                Text(widget.model.article!,
                    style: AppTextStyle().bodyTextStyle),
              ],
            ),
          )
        ],
      );
}
