import 'package:flutter/material.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';

class ArticleCardLandscape extends StatelessWidget {
  ArticleCardLandscape({Key? key}) : super(key: key);

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.04),
      fontWeight: FontWeight.bold,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dSize(.55),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
            child: Image.asset('assets/article_land.jpg',height: dSize(.35),fit: BoxFit.cover)),
          SizedBox(height: dSize(.02)),
          Text('Umran Malik is nowhere near the finished article: Ian Bishop -'
              ' Firstcricket News, Firstpost',style: _textStyle)
        ],
      ),
    );
  }
}
