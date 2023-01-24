import 'dart:convert';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/variables/api_endpoint.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FeedbackController extends GetxController {
  late TextEditingController feedback;
  late TextEditingController email;
  late TextEditingController name;
  late RxBool isLoading;

  @override
  void onInit() {
    super.onInit();
    feedback = TextEditingController();
    email = TextEditingController();
    name = TextEditingController();
    isLoading = false.obs;
  }

  Future<void> submitButtonOnTap() async {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        feedback.text.isNotEmpty) {
      try {
        isLoading(true);

        Map<String, dynamic> bodyData = {
          "service_id": "service_7xs6ylm",
          "template_id": "template_x6m8eys",
          "user_id": "qMwZ1jP2a-IfqHaxB",
          "template_params": {
            "from_name": name.text,
            "from_email": email.text,
            "message": 'Feedback from Cricland App.\n\n${feedback.text}'
          }
        };
        var response = await http.post(Uri.parse(ApiEndpoint.emailSendBaseUrl),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(bodyData));

        if (response.statusCode == 200) {
          isLoading(false);
          showToast(LanguageController.lc.languageModel.value.success);
          feedback.clear();
        } else {
          isLoading(false);
          showToast(LanguageController.lc.languageModel.value.failed);
        }
      } catch (error) {
        isLoading(false);
        showToast(error.toString());
      }
    } else {
      showToast(LanguageController.lc.languageModel.value.provideAllData);
    }
  }
}
