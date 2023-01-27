import 'package:cricland/public/variables/variable.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

double dSize(double size) {
  return Get.size.width >= 500 ? Get.size.height * size : Get.size.width * size;
}

Future<void> launchInWebViewOrVC(String url) async {
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.inAppWebView,
    webViewConfiguration: const WebViewConfiguration(
        headers: <String, String>{'my_header_key': 'my_header_value'}),
  )) {
    showToast('Could not launch $url');
  }
}

String enToBnNum(String value) {
  return value
      .replaceAll('0', '০')
      .replaceAll('1', '১')
      .replaceAll('2', '২')
      .replaceAll('3', '৩')
      .replaceAll('4', '৪')
      .replaceAll('5', '৫')
      .replaceAll('6', '৬')
      .replaceAll('7', '৭')
      .replaceAll('8', '৮')
      .replaceAll('9', '৯');
}

String bnToEnNum(String value) {
  return value
      .replaceAll('০', '0')
      .replaceAll('১', '1')
      .replaceAll('২', '2')
      .replaceAll('৩', '3')
      .replaceAll('৪', '4')
      .replaceAll('৫', '5')
      .replaceAll('৬', '6')
      .replaceAll('৭', '7')
      .replaceAll('৮', '8')
      .replaceAll('৯', '9');
}
