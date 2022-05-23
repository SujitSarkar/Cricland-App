import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/model/language_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static LanguageController lc = Get.find();
  late SharedPreferences pref;
  Rx<LangModel> langModel = LangModel().obs;

  Future<void> getLanguage()async{
    if(isEnglish.value==true){
      final String jsonString = await rootBundle.loadString('assets/language/english.json');
      langModel(langModelFromJson(jsonString));
    }else{
      final String jsonString = await rootBundle.loadString('assets/language/bangla.json');
      langModel(langModelFromJson(jsonString));
    }
    update();
    print(langModel.value.home);
  }

  // var packageInfo = PackageInfo(appName: '', packageName: '', version: '', buildNumber: '').obs;

  RxBool isLoading = false.obs;
  RxBool isEnglish = true.obs;
  RxBool isConnected = true.obs;
  // RxInt langRadioValue = 1.obs;
  RxDouble size = 0.0.obs;
  RxList bottomNavItem = [].obs;
  var videoFullScreen = false.obs;
  RxBool autoPlay = false.obs;
  RxBool cellularData = false.obs;
  RxString videoQuality = 'Medium'.obs;

  //bottom Nav variable
  RxString bottomNews = ''.obs;
  RxString bottomIPL = ''.obs;
  RxString bottomHome = ''.obs;
  RxString bottomMore = ''.obs;
//more
  RxString settingsTitle = ''.obs;
  RxString appLanguage = ''.obs;
  RxString language = ''.obs;
  RxString continueButton = ''.obs;
  RxString close = ''.obs;
  RxString notificationsSettings = ''.obs;
  RxString matchSettings = ''.obs;
  RxString themeChange = ''.obs;
  RxString premium = ''.obs;
  RxString visit = ''.obs;
  RxString facebook = ''.obs;
  RxString instagram = ''.obs;
  RxString support = ''.obs;
  RxString rateUs = ''.obs;
  RxString checkForUpdate = ''.obs;
  RxString problem = ''.obs;
  RxString invite = ''.obs;
  RxString about = ''.obs;
  RxString aboutUs = ''.obs;
  RxString terms = ''.obs;
  RxString privacy = ''.obs;
  RxString themeChangeButton = ''.obs;


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
    PublicController.pc.pref.setBool('isEnglish', val);
    changeVariables();
    update();
    getLanguage();
  }

  void changeVariables() {
    //bottom nav
    bottomNews.value = isEnglish.value ? 'News' : 'খবর';
    bottomHome.value = isEnglish.value ? 'Home' : 'হোম';
    bottomIPL.value = isEnglish.value ? 'IPL' : 'IPL';
    bottomMore.value = isEnglish.value ? 'More' : 'অধিক';
    //more
    settingsTitle.value = isEnglish.value ? 'Settings' : 'সেটিংস';
    appLanguage.value = isEnglish.value ? 'App Language' : 'অ্যাপ ভাষা';
    language.value = isEnglish.value ? 'English' : 'বাংলা';
    continueButton.value = isEnglish.value ? 'Continue' : 'এগিয়ে যান';
    close.value = isEnglish.value ? 'Close' : 'বন্ধ করুন';
    notificationsSettings.value =
        isEnglish.value ? 'Notifications Settings' : 'নোটিফিকেশন সেটিংস';
    matchSettings.value = isEnglish.value ? 'Match Settings' : 'ম্যাচ সেটিংস';
    themeChange.value = isEnglish.value ? 'Change Theme' : 'থিম বদলান';
    premium.value = isEnglish.value ? 'Premium' : 'প্রিমিয়াম';
    visit.value = isEnglish.value ? 'Visit' : 'দর্শন';
    facebook.value = isEnglish.value ? 'Facebook' : 'ফেইসবুক';
    instagram.value = isEnglish.value ? 'instagram' : 'ইন্সটাগ্রাম';
    support.value = isEnglish.value ? 'Support' : 'সমর্থন';
    rateUs.value =
        isEnglish.value ? 'Rate us' : 'আমাদের ব্যাপারে আপনার মতামত দিন';
    checkForUpdate.value = isEnglish.value
        ? 'Check for Updates'
        : 'হালনাগাদ এর জন্য অনুসন্ধান করুন';
    problem.value =
        isEnglish.value ? 'Report a Problem' : 'এক্তি সমস্যা রিপোর্ট';
    invite.value =
        isEnglish.value ? 'Invite Friends' : 'বন্ধুকে আমন্ত্রন জানান';
    about.value = isEnglish.value ? 'About' : 'সম্পর্কিত';
    aboutUs.value = isEnglish.value ? 'About us' : 'About us';
    terms.value =
        isEnglish.value ? 'Terms and Conditions' : 'Terms and Conditions';
    privacy.value = isEnglish.value ? 'Privacy Policy' : 'Privacy Policy';
    themeChangeButton.value = isEnglish.value ? 'Change Theme' : 'থিম পরিবর্তন';

    update();
  }

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
