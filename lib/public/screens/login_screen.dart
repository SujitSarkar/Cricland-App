import 'package:cricland/public/screens/home_nav_page.dart';
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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  bool _isLoading = false;
  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032),
      //fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  bool _isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(builder: (homeController)
    {
      return  Scaffold(
        appBar: AppBar(
          title: Text(_isSignUp?"SignUp":'Login',
              style: TextStyle(fontSize: dSize(.045))),
        ),
        body: _isSignUp?_bodyUISignUp(context,homeController): _bodyUI(context,homeController),
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
                    setState(() {
                      _isSignUp = true;
                    });

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
  Widget _bodyUISignUp(BuildContext context,HomeController homeController)=>Obx(() => ListView(
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
  setState(() {
    _isSignUp = false;
  });

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

                      _emptyFieldCreatorSignUp();
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
  _emptyFieldCreatorSignUp() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    passwordController.clear();

  }
}
