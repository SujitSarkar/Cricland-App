import 'package:cricland/news/model/article_model.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ReadNewsPage extends StatelessWidget {
  ReadNewsPage({Key? key, required this.model}) : super(key: key);
  final ArticleModel model;

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
      Image.network(model.imageLink!,fit: BoxFit.fitWidth),

      Padding(
        padding: EdgeInsets.all(dSize(.04)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal:dSize(.02),vertical: dSize(.002)),
              child: Text(DateFormat('MMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(model.timeStamp!)),style: _textStyle),
              decoration: BoxDecoration(
                  color: PublicController.pc.toggleCardBg(),
                  borderRadius: BorderRadius.all(Radius.circular(dSize(.01)))
              ),
            ),
            SizedBox(height:dSize(.06)),

            Text(model.title!,
              style: _textStyle.copyWith(fontSize: dSize(.055),fontWeight: FontWeight.bold)),
            SizedBox(height:dSize(.06)),

            Text(model.article!,
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
