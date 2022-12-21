import 'package:cricland/news/controller/news_controller.dart';
import 'package:cricland/public/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../more/view/widgets/article_card_portrait.dart';
import '../../public/controller/public_controller.dart';
import '../../public/variables/config.dart';
import '../../public/variables/variable.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(vsync: this),
        autoRemove: false,
        builder: (nc) {
          return Obx(() => Scaffold(
                backgroundColor: PublicController.pc.togglePagedBg(),
                appBar: AppBar(
                  title: Text('News', style: TextStyle(fontSize: dSize(.045))),
                  bottom: _tabBar(nc),
                ),
                body: nc.loading.value
                    ? const LoadingWidget()
                    : SafeArea(
                        child: SmartRefresher(
                          enablePullDown: true,
                          enablePullUp: true,
                          header: const WaterDropHeader(),
                          footer: CustomFooter(
                            builder: (context, mode) {
                              Widget body;
                              if (mode == LoadStatus.idle) {
                                body = const Text("Pull up load");
                              } else if (mode == LoadStatus.loading) {
                                body = const LoadingWidget();
                              } else if (mode == LoadStatus.failed) {
                                body = const Text("Load Failed! Click retry!");
                              } else if (mode == LoadStatus.canLoading) {
                                body = const Text("Release to load more");
                              } else {
                                body = const Text("No more News");
                              }
                              return SizedBox(
                                height: 55.0,
                                child: Center(child: body),
                              );
                            },
                          ),
                          controller: nc.refreshController,
                          onRefresh: nc.onRefreshNews,
                          onLoading: nc.onLoadingNews,
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                                horizontal: dSize(.04), vertical: dSize(.04)),
                            itemCount: nc.articleList.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                ArticleCardPortrait(
                                    model: nc.articleList[index]),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: dSize(.08)),
                          ),
                        ),
                      ),
              ));
        });
  }

  PreferredSize _tabBar(NewsController nc) => PreferredSize(
        preferredSize: Size.fromHeight(dSize(.04)),
        child: nc.categoryList.isEmpty
            ? Container()
            : TabBar(
                onTap: (covariant) async {
                  NewsController.nc.tabController.index = covariant;
                  await nc.getArticleFromTabSwitch();
                },
                isScrollable: true,
                controller: NewsController.nc.tabController,
                labelColor: PublicController.pc.toggleLoadingColor(),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(dSize(.02)),
                        topRight: Radius.circular(dSize(.02))),
                    color: PublicController.pc.toggleTabColor()),
                unselectedLabelColor: Colors.grey.shade400,
                unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: dSize(.045)),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: dSize(.045)),
                indicatorSize: TabBarIndicatorSize.label,
                physics: const BouncingScrollPhysics(),
                tabs: Variables.newsCategory
                    .map<Widget>((String item) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: dSize(.01), horizontal: dSize(.02)),
                          child: Text(item),
                        ))
                    .toList(),
              ),
      );
}
