import 'package:cricland/public/variables/variable.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

double dSize(double size){
  return Get.size.width>=500?Get.size.height*size:Get.size.width*size;
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