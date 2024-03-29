

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../home/controller/home_controller.dart';
import '../controller/public_controller.dart';
import '../variables/colors.dart';
import '../variables/config.dart';
import '../variables/variable.dart';
import '../widgets/text_field_tile.dart';
import 'home_nav_page.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032),
      //fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController)
    {
      return  Scaffold(
        appBar: AppBar(
          title: Text('SignUp',
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
            SizedBox(height: dSize(.06)),

            TextFieldTile(controller: firstNameController,
              hintText: "First Name",labelText: "First Name",),
            SizedBox(height: dSize(.06)),
            TextFieldTile(controller: lastNameController,hintText: "Last Name",labelText: "Last Name",),
            SizedBox(height: dSize(.06)),
            TextFieldTile(controller: phoneController,hintText: "Phone Number",labelText: "Phone Number",),
            SizedBox(height: dSize(.06)),
            TextFieldTile(controller: passwordController,hintText: "Password",labelText: "Password",obscure:true),
            SizedBox(height: dSize(.06)),

            RichText(
              text: TextSpan(
                text: 'Already Have an account ?',
                style: _textStyle,
                children:  <TextSpan>[
                  TextSpan(text: '  SignIn',style: _textStyle.copyWith(fontSize: dSize(.035),fontWeight: FontWeight.bold,color: AllColor.fbColor),
                    recognizer:  TapGestureRecognizer()..onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginScreen(),),);
                    },
                  ),

                ],
              ),
            ),
            SizedBox(height: dSize(.06)),
            TextButton(style: TextButton.styleFrom(
              backgroundColor: AllColor.purpleColor,
            ),
              onPressed: (){

              if( firstNameController.text.isNotEmpty &&  lastNameController.text.isNotEmpty &&  phoneController.text.isNotEmpty && passwordController.text.isNotEmpty){
                setState(() {
                  _isLoading = true;
                  homeController
                      .registerUser(
                    firstNameController.text,
                    lastNameController.text,
                    phoneController.text,
                    passwordController.text,
                  ).then((value) {
                    setState(() {
                      _isLoading = false;
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeNavPage(),),);

                    _emptyFieldCreator();
                  });
                });
              }else {

                showToast('All Field is required');

              }


              }, child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: dSize(.25)),
                child: _isLoading ?const Center(child: CircularProgressIndicator()): Text('Submit',style: _textStyle.copyWith(fontSize: dSize(.035),fontWeight: FontWeight.bold,color: AllColor.lightCardColor),),
              ),),
            SizedBox(height: dSize(.06)),

          ],
        ),
      ),
    ],
  ));
  _emptyFieldCreator() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    passwordController.clear();

  }
}