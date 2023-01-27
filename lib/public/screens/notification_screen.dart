import 'package:cricland/public/screens/home_nav_page.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key, this.title, this.body}) : super(key: key);
  final String? title;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeNavPage()),
              (route) => false);
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeNavPage()),
                    (route) => false);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text(body ?? '', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ));
  }
}
