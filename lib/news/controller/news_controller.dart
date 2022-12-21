import 'dart:io';
import 'package:cricland/news/model/article_model.dart';
import 'package:cricland/public/variables/app_string.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsController extends GetxController{
  static NewsController nc = Get.find();

  NewsController({required this.vsync});
  final TickerProvider vsync;

  late RxBool loading;
  late TabController tabController;
  late RefreshController refreshController;

  late RxList<String> categoryList;
  late RxList<ArticleModel> articleList;

  @override
  void onInit() {
    super.onInit();
    loading = false.obs;
    categoryList = <String>[].obs;
    articleList = <ArticleModel>[].obs;
    refreshController = RefreshController(initialRefresh: false);
    fetchInitialData();
  }

  @override
  void dispose() {
    super.dispose();
    loading.close();
  }

  Future<void> fetchInitialData() async {
    await getCategory();
    await getArticleFromTabSwitch();
  }

  Future<void> getCategory() async {
    loading(true);
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(AppString.categoryCollection)
          .get();
      categoryList.clear();
      for (var element in snapshot.docChanges) {
        categoryList.add(element.doc['category_name']);
      }
      NewsController.nc.tabController = TabController(
          length: NewsController.nc.categoryList.length,
          vsync: vsync);

      NewsController.nc.tabController.index=0;
      loading(false);
    } on SocketException {
      loading(false);
      showToast(AppString.noInternet);
    } catch (error) {
      loading(false);
      showToast(error.toString());
      print(error.toString());
    }
  }

  Future<void> loadNewArticle() async {
    try {
      QuerySnapshot snapshot;
      if (articleList.isEmpty) {
        snapshot = await FirebaseFirestore.instance
            .collection(AppString.articleCollection)
            .where('category',isEqualTo: categoryList[tabController.index])
            .orderBy('time_stamp', descending: true)
            .limit(30)
            .get();
      } else {
        snapshot = await FirebaseFirestore.instance
            .collection(AppString.articleCollection)
            .where('time_stamp', isGreaterThan: articleList.first.timeStamp)
            .where('category',isEqualTo: categoryList[tabController.index])
            .orderBy('time_stamp', descending: true)
            .limit(30)
            .get();
      }

      for (var element in snapshot.docChanges) {
        ArticleModel model = ArticleModel(
          id: element.doc['id'],
          title: element.doc['title'],
          category: element.doc['category'],
          article: element.doc['article'],
          imageLink: element.doc['image_link'],
          youtubeVideoLink: element.doc['youtube_video_link'],
          timeStamp: element.doc['time_stamp'],
        );
        articleList.add(model);
      }
      if (kDebugMode) {
        print('Article Total: ${articleList.length}');
      }
    } on SocketException {
      showToast(AppString.noInternet);
    } catch (error) {
      showToast(error.toString());
      print(error.toString());
    }
  }

  Future<void> getArticleFromTabSwitch() async {
    loading(true);
    try {
       QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection(AppString.articleCollection)
            .where('category',isEqualTo: categoryList[tabController.index])
            .orderBy('time_stamp', descending: true)
            .limit(30)
            .get();
       articleList.clear();
      for (var element in snapshot.docChanges) {
        ArticleModel model = ArticleModel(
          id: element.doc['id'],
          title: element.doc['title'],
          category: element.doc['category'],
          article: element.doc['article'],
          imageLink: element.doc['image_link'],
          youtubeVideoLink: element.doc['youtube_video_link'],
          timeStamp: element.doc['time_stamp'],
        );
        articleList.add(model);
      }
      if (kDebugMode) {
        print('Article Total: ${articleList.length}');
      }
      loading(false);
    } on SocketException {
      loading(false);
      showToast(AppString.noInternet);
    } catch (error) {
      loading(false);
      showToast(error.toString());
      print(error.toString());
    }
  }

  Future<void> onRefreshNews() async{
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(AppString.articleCollection)
          .where('category',isEqualTo: categoryList[tabController.index])
          .orderBy('time_stamp', descending: true)
          .limit(30)
          .get();
      articleList.clear();
      for (var element in snapshot.docChanges) {
        ArticleModel model = ArticleModel(
          id: element.doc['id'],
          title: element.doc['title'],
          category: element.doc['category'],
          article: element.doc['article'],
          imageLink: element.doc['image_link'],
          youtubeVideoLink: element.doc['youtube_video_link'],
          timeStamp: element.doc['time_stamp'],
        );
        articleList.add(model);
      }
      if (kDebugMode) {
        print('Article Total: ${articleList.length}');
      }
    } on SocketException {
      showToast(AppString.noInternet);
    } catch (error) {
      showToast(error.toString());
    }
    refreshController.refreshCompleted();
    update();
  }

  Future<void> onLoadingNews() async{
    await loadNewArticle();
    refreshController.loadComplete();
    update();
  }
}