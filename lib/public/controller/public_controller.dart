import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../variables/colors.dart';
import '../variables/variable.dart';

class PublicController extends GetxController{
  static PublicController pc = Get.find();
  late SharedPreferences pref;
  late PackageInfo packageInfo;
  RxDouble size = 0.0.obs;
  RxBool loading=false.obs;
  RxBool isLight=true.obs;
  RxInt selectedIndex = 0.obs;
  RxInt themeRadioValue = 0.obs;

  void onItemTapped(int index) {
    selectedIndex(index);
    update();
  }


  Future<void> initApp(BuildContext context) async {
    pref = await SharedPreferences.getInstance();
    isLight(pref.getBool('isLight')??true);
    if (MediaQuery.of(context).size.width<=500) {
      size(MediaQuery.of(context).size.width);
    } else {size(MediaQuery.of(context).size.height);}
    themeRadioValue(isLight.value?1:2);
    packageInfo = await PackageInfo.fromPlatform();
    update();
    if (kDebugMode) {
      print('Initialized\n Size: ${size.value}');
    }
  }

  void changeTheme(bool val)async{
    isLight(val);
    update();
    pref.setBool('isLight', isLight.value);
  }

  ThemeData toggleTheme(){
    if(isLight.value==true){
      return Variables.lightThemeData;
    }else{
      return Variables.darkThemeData;
    }
  }

  Color toggleLoadingColor()=> isLight.value?AllColor.primaryColor:Colors.white;
  Color togglePrimaryGrey()=> isLight.value?AllColor.primaryColor:Colors.grey;
  Color toggleTextColor()=> isLight.value?AllColor.lightTextColor:AllColor.darkTextColor;
  Color toggleCardBg()=> isLight.value?AllColor.lightCardColor:AllColor.darkCardColor;
  Color toggleCardHeader()=> isLight.value?AllColor.lightCardHeader:AllColor.darkCardHeader;
  dynamic toggleStatusBar()=> isLight.value?Variables.lightStatusBarTheme:Variables.darkStatusBarTheme;

}