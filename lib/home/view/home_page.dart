import 'package:cricland/public/controller/public_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: (){
        PublicController.pc.changeTheme();
      }, child: const Text('Change Theme'))),
    );
  }
}
