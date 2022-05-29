import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/model/language_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static LanguageController lc = Get.find();
  late SharedPreferences pref;
  Rx<LangModel> langModel = LangModel().obs;

  Future<void> getLanguage() async {
    if (isEnglish.value == true) {
      final String jsonString =
          await rootBundle.loadString('assets/language/english.json');
      langModel(langModelFromJson(jsonString));
    } else {
      final String jsonString =
          await rootBundle.loadString('assets/language/bangla.json');
      langModel(langModelFromJson(jsonString));
    }
    update();
    if (kDebugMode) {
      print('Json Language Test: ${langModel.value.themeChange}');
    }
  }

  RxBool isLoading = false.obs;
  RxBool isEnglish = true.obs;
  RxBool isConnected = true.obs;
  // RxInt langRadioValue = 1.obs;
//   RxDouble size = 0.0.obs;
//   RxList bottomNavItem = [].obs;
//   var videoFullScreen = false.obs;
//   RxBool autoPlay = false.obs;
//   RxBool cellularData = false.obs;
//   RxString videoQuality = 'Medium'.obs;
//
//   //bottom Nav variable
//   RxString bottomNews = ''.obs;
//   RxString bottomIPL = ''.obs;
//   RxString bottomHome = ''.obs;
//   RxString bottomMore = ''.obs;
// //more
//   RxString settingsTitle = ''.obs;
//   RxString appLanguage = ''.obs;
//   RxString language = ''.obs;
//   RxString continueButton = ''.obs;
//   RxString close = ''.obs;
//   RxString notificationsSettings = ''.obs;
//   RxString matchSettings = ''.obs;
//   RxString themeChange = ''.obs;
//   RxString premium = ''.obs;
//   RxString visit = ''.obs;
//   RxString facebook = ''.obs;
//   RxString instagram = ''.obs;
//   RxString support = ''.obs;
//   RxString rateUs = ''.obs;
//   RxString checkForUpdate = ''.obs;
//   RxString problem = ''.obs;
//   RxString invite = ''.obs;
//   RxString about = ''.obs;
//   RxString aboutUs = ''.obs;
//   RxString terms = ''.obs;
//   RxString privacy = ''.obs;
//   RxString themeChangeButton = ''.obs;

  Future<void> initializeApp(BuildContext context) async {
    pref = await SharedPreferences.getInstance();
    isEnglish.value = pref.getBool('isEnglish') ?? true;
    changeVariables();
    //  packageInfo.value = await PackageInfo.fromPlatform();
    update();
  }

  void changeLanguage(bool val) async {
    isEnglish.value = val;
    //Save data to local
    pref.setBool('isEnglish', val);
    changeVariables();
    update();
    getLanguage();
  }

  void changeVariables() {}

  // Future<void> checkConnectivity() async {
  //   await (Connectivity().checkConnectivity()).then((result) {
  //     if (result == ConnectivityResult.none) {
  //       isConnected.value = false;
  //     } else if (result == ConnectivityResult.mobile) {
  //       isConnected.value = true;
  //     } else if (result == ConnectivityResult.wifi) {
  //       isConnected.value = true;
  //     }
  //     update();
  //     print('Internet Connected: ${isConnected.value}');
  //   });
  // }
}
