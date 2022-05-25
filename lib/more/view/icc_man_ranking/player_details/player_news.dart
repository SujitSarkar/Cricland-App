import 'package:flutter/material.dart';
import '../../../../public/variables/config.dart';
import '../../widgets/article_card_portrait.dart';

class PlayerNews extends StatelessWidget {
  const PlayerNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
      children: [
        SizedBox(height: dSize(.4)),

        ListView.separated(
          itemCount: 20,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)=>ArticleCardPortrait(),
          separatorBuilder: (context, index)=>SizedBox(height: dSize(.08)),
        )
      ],
    );
  }
}
