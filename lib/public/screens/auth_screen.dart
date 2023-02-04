import 'package:cricland/public/screens/login_screen.dart';
import 'package:cricland/public/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? userId;
  @override
  void initState() {
    checkedLogIn();
    // TODO: implement initState
    super.initState();
  }

  checkedLogIn() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
    setState(() {});
    return userId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: checkedLogIn(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ProfileScreen();
              // print("hasData");
            } else {
              return LoginScreen();
              // print("object");
            }
            // return userId != null ? const ProfileScreen() : const LoginScreen();
          }),
    );
  }
}
