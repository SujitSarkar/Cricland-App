import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      body: Center(child: ElevatedButton(onPressed: (){
        PublicController.pc.changeTheme(!PublicController.pc.isLight.value);
      }, child:  Text(LanguageController.lc.themeChangeButton.value))),

    );
  }
}
