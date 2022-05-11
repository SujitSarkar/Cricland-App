import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PublicController extends GetxController{
  static PublicController pc = Get.find();
  late SharedPreferences? pref;
  RxDouble size = 0.0.obs;
  RxBool loading=false.obs;
  RxDouble totalAsset=0.0.obs;
  RxDouble totalExpense=0.0.obs;


  Future<void> initApp(BuildContext context) async {
    pref = await SharedPreferences.getInstance();
    if (MediaQuery.of(context).size.width<=500) {
      size(MediaQuery.of(context).size.width);
    } else {size(MediaQuery.of(context).size.height);}
    update();
    if (kDebugMode) {
      print('Initialized\n Size: ${size.value}');
    }
  }

}