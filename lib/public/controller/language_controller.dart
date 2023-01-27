import 'package:cricland/public/model/language_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static final LanguageController lc = Get.find();
  late SharedPreferences pref;
  Rx<LanguageModel> languageModel = LanguageModel().obs;

  RxBool isLoading = false.obs;
  RxString appLanguage = "english".obs;
  RxBool isConnected = true.obs;

  Future<void> initializeApp(BuildContext context) async {
    pref = await SharedPreferences.getInstance();
    appLanguage.value = pref.getString('language') ?? "english";
    await getLanguage();
    update();
  }

  Future<void> getLanguage() async {
    if (appLanguage.value=='english') {
      final String jsonString =
          await rootBundle.loadString('assets/language/english.json');
      languageModel(languageModelFromJson(jsonString));
    } else if(appLanguage.value=='bangla'){
      final String jsonString =
          await rootBundle.loadString('assets/language/bangla.json');
      languageModel(languageModelFromJson(jsonString));
    }
    update();
    if (kDebugMode) {
      print('App Language: ${languageModel.value.changeTheme}');
    }
  }

  void changeLanguage(String val) async {
    appLanguage.value = val;
    //Save data to local
    pref.setString('language', val);
    update();
    await getLanguage();
  }
}
