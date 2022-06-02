import 'package:flutter/material.dart';
import '../../more/view/widgets/article_card_portrait.dart';
import '../../public/variables/config.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News',
          style: TextStyle(fontSize: dSize(.045))),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.04)),
          itemCount: 20,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index)=>ArticleCardPortrait(),
          separatorBuilder: (context, index)=>SizedBox(height: dSize(.08)),
        ),
      ),
    );
  }
}
