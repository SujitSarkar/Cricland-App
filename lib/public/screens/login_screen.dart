import 'package:cricland/public/screens/home_nav_page.dart';
import 'package:cricland/public/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/controller/home_controller.dart';
import '../controller/public_controller.dart';
import '../variables/colors.dart';
import '../variables/config.dart';
import '../variables/variable.dart';
import '../widgets/text_field_tile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032),
      //fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController)
    {
      return  Scaffold(
        appBar: AppBar(
          title: Text('Login',
              style: TextStyle(fontSize: dSize(.045))),
        ),
        body: _bodyUI(context,homeController),
      );
    }
    );
  }

  Widget _bodyUI(BuildContext context,HomeController homeController)=>Obx(() => ListView(
    physics: const BouncingScrollPhysics(),
    padding: EdgeInsets.all(dSize(.04)),
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: dSize(.07),vertical: dSize(.05)),
        decoration: BoxDecoration(
          color: PublicController.pc.toggleCardBg(),
          borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
        ),
        child: Column(
          children: [
            SizedBox(height: dSize(.05)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/dark_logo.png',height: dSize(.2)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Cricland',style: _textStyle.copyWith(fontSize: dSize(.1),fontStyle:FontStyle.italic,fontWeight: FontWeight.bold)),
                    Text('Login/Signup',textAlign: TextAlign.end,
                        style: TextStyle(fontSize: dSize(.05),fontWeight: FontWeight.bold,color: AllColor.goldenColor)),
                  ],
                )
              ],
            ),
            SizedBox(height: dSize(.05)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: dSize(.1)),
              child: Text('SignIn to Earn by clicking Add.'
                  ' and enjoy cricket with happiness',
                  style: _textStyle,textAlign: TextAlign.center),
            ),
            SizedBox(height: dSize(.1)),
            TextFieldTile(controller: phoneController,hintText: "Phone Number",labelText: "Phone Number",),
            SizedBox(height: dSize(.1)),
            TextFieldTile(controller: passwordController,hintText: "Password",labelText: "Password",),
            SizedBox(height: dSize(.3)),

            RichText(
              text: TextSpan(
                text: 'If You Are a New User ',
                style: _textStyle,
                children:  <TextSpan>[
                  TextSpan(text: '  Signup',style: _textStyle.copyWith(fontSize: dSize(.035),fontWeight: FontWeight.bold,color: AllColor.fbColor),
                    recognizer:  TapGestureRecognizer()..onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUpScreen(),),);
                    },
                  ),

                ],
              ),
            ),

            SizedBox(height: dSize(.1)),
            TextButton(style: TextButton.styleFrom(
              backgroundColor: AllColor.purpleColor,
            ),
              onPressed: ()async{

              if(phoneController.text.isNotEmpty && passwordController.text.isNotEmpty){
                await homeController
                    .loginData(phoneController.text,
                    passwordController.text)
                    .then((value) async {
                      print("Phone: ${phoneController.text}");
                      print("Phone: ${homeController.userModel.phone}");
                      print("Password: ${passwordController.text}");
                      print("Password: ${homeController.userModel.password}");
                  if (phoneController.text ==
                      homeController.userModel.phone &&
                      passwordController.text ==
                          homeController.userModel.password) {
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    prefs.setString(
                        'userId', homeController.userModel.id!)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const HomeNavPage()));
                    }).then((value) {
                      showToast('Successfully login');
                      _emptyFieldCreator();
                    });
                  } else {
                    showToast('Phone or Password is Invalid');
                  }
                });
              }else {
                showToast('All Field is required');
              }


               // Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: dSize(.25)),
                child: Text('Submit',style: _textStyle.copyWith(fontSize: dSize(.035),fontWeight: FontWeight.bold,color: AllColor.lightCardColor),),
              ),)

          ],
        ),
      ),


    ],
  ));
  _emptyFieldCreator() {
    phoneController.clear();
    passwordController.clear();
  }
}
