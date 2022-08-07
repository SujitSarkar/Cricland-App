import 'dart:io';
import 'package:cricland/news/model/article_model.dart';
import 'package:cricland/public/variables/app_string.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsController extends GetxController{
  static NewsController nc = Get.find();

  late RxBool loading;
  late TabController tabController;

  late RxList<String> categoryList;
  late RxList<ArticleModel> articleList;

  @override
  void onInit() {
    super.onInit();
    loading = false.obs;

    categoryList = <String>[].obs;
    articleList = <ArticleModel>[].obs;
    fetchInitialData();
  }

  @override
  void dispose() {
    super.dispose();
    loading.close();
  }

  Future<void> fetchInitialData() async {
    await getCategory();
    await getArticle();
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
      loading(false);
    } on SocketException {
      loading(false);
      showToast(AppString.noInternet);
    } catch (error) {
      loading(false);
      showToast(error.toString());
    }
  }


  Future<void> getArticle() async {
    loading(true);
    try {
      QuerySnapshot snapshot;
      if (articleList.isEmpty) {
        snapshot = await FirebaseFirestore.instance
            .collection(AppString.articleCollection)
            .where('category',isEqualTo: categoryList[tabController.index])
            .orderBy('time_stamp', descending: true)
            .limit(5)
            .get();
      } else {
        snapshot = await FirebaseFirestore.instance
            .collection(AppString.articleCollection)
            .where('time_stamp', isGreaterThan: articleList.last.timeStamp)
            .where('category',isEqualTo: categoryList[tabController.index])
            .orderBy('time_stamp', descending: true)
            .limit(5)
            .get();
      }

      for (var element in snapshot.docChanges) {
        ArticleModel model = ArticleModel(
          id: element.doc['id'],
          title: element.doc['title'],
          category: element.doc['category'],
          article: element.doc['article'],
          imageLink: element.doc['image_link'],
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

  Future<void> getArticleFromTabSwitch() async {
    loading(true);
    try {
       QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection(AppString.articleCollection)
            .where('category',isEqualTo: categoryList[tabController.index])
            .orderBy('time_stamp', descending: true)
            .limit(5)
            .get();
       articleList.clear();
      for (var element in snapshot.docChanges) {
        ArticleModel model = ArticleModel(
          id: element.doc['id'],
          title: element.doc['title'],
          category: element.doc['category'],
          article: element.doc['article'],
          imageLink: element.doc['image_link'],
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
}