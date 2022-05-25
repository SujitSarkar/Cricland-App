import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';

class ArticleCardPortrait extends StatelessWidget {
  ArticleCardPortrait({Key? key}) : super(key: key);

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.04),
      fontWeight: FontWeight.bold,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
          child: Image.asset('assets/article_land.jpg',width: double.infinity,fit: BoxFit.cover)),
        SizedBox(height: dSize(.04)),
        Text('Umran Malik is nowhere near the finished article: Ian Bishop -'
            ' Firstcricket News, Firstpost',style: _textStyle),
        SizedBox(height: dSize(.02)),
        Text(DateFormat('dd MMM yyyy').format(DateTime.now()),style: _textStyle.copyWith(fontSize: dSize(.03),fontWeight: FontWeight.w400)),
      ],
    );
  }
}
