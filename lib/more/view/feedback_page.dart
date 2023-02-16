import 'package:cricland/more/controller/feedback_controller.dart';
import 'package:cricland/public/controller/language_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/loading_widget.dart';
import 'package:cricland/public/widgets/text_field_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LanguageController lc = Get.find();
    return GetBuilder<FeedbackController>(
        init: FeedbackController(),
        builder: (controller) {
          return Obx(() => Stack(
                children: [
                  Scaffold(
                    appBar: AppBar(
                      title: Text('Feedback',
                          style: TextStyle(fontSize: dSize(.045))),
                    ),
                    body: _bodyUI(context, controller, lc),
                  ),
                  if (controller.isLoading.value) const LoadingPage()
                ],
              ));
        });
  }

  Widget _bodyUI(BuildContext context, FeedbackController controller,
          LanguageController lc) =>
      ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(dSize(.04)),
        children: [
          Image.asset("assets/feedback.png",
              height: dSize(.6), fit: BoxFit.fitHeight),
          SizedBox(height: dSize(.05)),
          Container(
            padding: EdgeInsets.all(dSize(.03)),
            decoration: BoxDecoration(
              color: PublicController.pc.toggleCardBg(),
              borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
            ),
            child: Column(children: [
              SizedBox(height: dSize(.02)),
              TextFieldTile(
                controller: controller.name, 
                textCapitalization: TextCapitalization.words,
                hintText: lc.languageModel.value.name,
                labelText: lc.languageModel.value.name,
              ),
              SizedBox(height: dSize(.06)),
              TextFieldTile(
                controller: controller.email,
                textInputType: TextInputType.emailAddress,
                hintText: lc.languageModel.value.email,
                labelText: lc.languageModel.value.email,
              ),
              SizedBox(height: dSize(.06)),
              TextFieldTile(
                controller: controller.feedback,
                textCapitalization: TextCapitalization.sentences,
                hintText: lc.languageModel.value.feedback,
                labelText: lc.languageModel.value.feedback,
                maxLine: 5,
                minLine: 5,
              ),
              SizedBox(height: dSize(.06)),
              ElevatedButton(
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(lc.languageModel.value.submit!)),
                onPressed: () async {
                  await controller.submitButtonOnTap();
                },
              )
            ]),
          ),
        ],
      );
}
