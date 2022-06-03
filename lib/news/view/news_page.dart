import 'package:flutter/material.dart';
import '../../more/view/widgets/article_card_portrait.dart';
import '../../public/controller/public_controller.dart';
import '../../public/variables/colors.dart';
import '../../public/variables/config.dart';
import '../../public/variables/variable.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  String _newsType=Variables.newsCategory.first;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: Variables.newsCategory.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News',
          style: TextStyle(fontSize: dSize(.045))),
        bottom: _tabBar(),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.04)),
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>ArticleCardPortrait(),
              separatorBuilder: (context, index)=>SizedBox(height: dSize(.08)),
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.04)),
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>ArticleCardPortrait(),
              separatorBuilder: (context, index)=>SizedBox(height: dSize(.08)),
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.04)),
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>ArticleCardPortrait(),
              separatorBuilder: (context, index)=>SizedBox(height: dSize(.08)),
            )
          ],

        ),
      ),
    );
  }

  PreferredSize _tabBar()=>PreferredSize(
    preferredSize: Size.fromHeight(dSize(.04)),
    child: TabBar(
      onTap: (covariant) async {
        setState(() => _tabController.index = covariant);
      },
      isScrollable: true,
      controller: _tabController,
      labelColor: PublicController.pc.toggleLoadingColor(),
      indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dSize(.02)),
              topRight: Radius.circular(dSize(.02))
          ),
          color: PublicController.pc.toggleTabColor()),
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      physics: const BouncingScrollPhysics(),
      tabs: Variables.newsCategory.map<Widget>((String item)=>
          Padding(
            padding: EdgeInsets.symmetric(vertical: dSize(.01),horizontal: dSize(.02)),
            child: Text(item),
          )).toList(),
    ),
  );
}
