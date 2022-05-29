import 'package:cricland/public/controller/public_controller.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                PublicController.pc
                    .changeTheme(!PublicController.pc.isLight.value);
              },
              child: const Text('Change Theme'))),
    );
  }
}
