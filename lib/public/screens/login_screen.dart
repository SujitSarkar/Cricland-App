import 'package:cricland/public/screens/home_nav_page.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/public/widgets/decoration.dart';
import 'package:cricland/public/widgets/gradiend_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  bool _isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        appBar: AppBar(
          flexibleSpace:
              Container(decoration: StDecoration().sliverAppbarGradient),
          title: Text(_isSignUp ? "SignUp" : 'Login',
              style: TextStyle(fontSize: dSize(.045))),
        ),
        body: _isSignUp
            ? _bodyUISignUp(context, homeController)
            : _bodyUI(context, homeController),
      );
    });
  }

  Widget _bodyUI(BuildContext context, HomeController homeController) =>
      Obx(() => ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(dSize(.04)),
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: dSize(.07), vertical: dSize(.05)),
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
                        Image.asset('assets/dark_logo.png', height: dSize(.2)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Cricland',
                                style: AppTextStyle()
                                    .boldBodyTextStyle
                                    .copyWith(
                                        fontSize: dSize(.1),
                                        fontStyle: FontStyle.italic)),
                            Text('Login/Signup',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: dSize(.05),
                                    fontWeight: FontWeight.bold,
                                    color: AllColor.goldenColor)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: dSize(.05)),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: dSize(.1)),
                      child: Text(
                          'SignIn to Earn by clicking Add.'
                          ' and enjoy cricket with happiness',
                          style: AppTextStyle().bodyTextStyle,
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(height: dSize(.1)),
                    TextFieldTile(
                      controller: phoneController,
                      hintText: "Phone Number",
                      labelText: "Phone Number",
                    ),
                    SizedBox(height: dSize(.05)),
                    TextFieldTile(
                      controller: passwordController,
                      hintText: "Password",
                      labelText: "Password",
                    ),
                    SizedBox(height: dSize(.05)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: dSize(.03)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              _googleLogin(homeController);
                            },
                            icon: Icon(FontAwesomeIcons.google,
                                color: Colors.deepOrangeAccent,
                                size: dSize(.06)),
                          ),
                          SizedBox(width: dSize(.03)),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Upcoming Feature")));
                              // _facebookLogin();
                            },
                            icon: Icon(FontAwesomeIcons.facebook,
                                color: Colors.blueAccent, size: dSize(.06)),
                          )
                        ],
                      ),
                    ),

                    // TextButton(onPressed: (){
                    //   _showLoginModal(context,homeController);
                    // }, child: const Text("Social SignIn"),),
                    RichText(
                      text: TextSpan(
                        text: 'If You Are a New User ',
                        style: AppTextStyle().bodyTextStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: '  Signup',
                            style: AppTextStyle()
                                .boldBodyTextStyle
                                .copyWith(color: AllColor.fbColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  _isSignUp = true;
                                });
                              },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: dSize(.05)),
                    GradientButton(
                      onTap: () async {
                        if (phoneController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          await homeController
                              .loginData(
                                  phoneController.text, passwordController.text)
                              .then((value) async {
                            if (phoneController.text ==
                                    homeController.userModel.phone &&
                                passwordController.text ==
                                    homeController.userModel.password) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs
                                  .setString(
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
                        } else {
                          showToast('All Field is required');
                        }

                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));
                      },
                      child: Text(
                        'Submit',
                        style: AppTextStyle().buttonTextStyle,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
  _emptyFieldCreator() {
    phoneController.clear();
    passwordController.clear();
  }

  Widget _bodyUISignUp(BuildContext context, HomeController homeController) =>
      Obx(() => ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(dSize(.04)),
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: dSize(.07), vertical: dSize(.05)),
                decoration: BoxDecoration(
                  color: PublicController.pc.toggleCardBg(),
                  borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/dark_logo.png', height: dSize(.2)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Cricland',
                                style: AppTextStyle()
                                    .boldBodyTextStyle
                                    .copyWith(
                                        fontSize: dSize(.1),
                                        fontStyle: FontStyle.italic)),
                            Text('Login/Signup',
                                textAlign: TextAlign.end,
                                style: AppTextStyle()
                                    .boldBodyTextStyle
                                    .copyWith(
                                        fontSize: dSize(.05),
                                        color: AllColor.goldenColor)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: dSize(.05)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: dSize(.1)),
                      child: Text(
                          'SignIn to Earn by clicking Add.'
                          ' and enjoy cricket with happiness',
                          style: AppTextStyle().bodyTextStyle,
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(height: dSize(.06)),
                    TextFieldTile(
                      controller: firstNameController,
                      hintText: "First Name",
                      labelText: "First Name",
                    ),
                    SizedBox(height: dSize(.06)),
                    TextFieldTile(
                      controller: lastNameController,
                      hintText: "Last Name",
                      labelText: "Last Name",
                    ),
                    SizedBox(height: dSize(.06)),
                    TextFieldTile(
                      controller: phoneController,
                      hintText: "Phone Number",
                      labelText: "Phone Number",
                    ),
                    SizedBox(height: dSize(.06)),
                    TextFieldTile(
                        controller: passwordController,
                        hintText: "Password",
                        labelText: "Password",
                        obscure: true),
                    SizedBox(height: dSize(.06)),
                    RichText(
                      text: TextSpan(
                        text: 'Already Have an account ?',
                        style: AppTextStyle().bodyTextStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: '  SignIn',
                            style: AppTextStyle()
                                .bodyTextStyle
                                .copyWith(color: AllColor.fbColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  _isSignUp = false;
                                });
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: dSize(.06)),
                    GradientButton(
                      onTap: () {
                        if (firstNameController.text.isNotEmpty &&
                            lastNameController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          setState(() {
                            _isLoading = true;
                            homeController
                                .registerUser(
                                    firstNameController.text,
                                    lastNameController.text,
                                    phoneController.text,
                                    passwordController.text,
                                    "")
                                .then((value) {
                              setState(() {
                                _isLoading = false;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeNavPage(),
                                ),
                              );

                              _emptyFieldCreatorSignUp();
                            });
                          });
                        } else {
                          showToast('All Field is required');
                        }
                      },
                      child: _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Text(
                              'Submit',
                              style: AppTextStyle().buttonTextStyle,
                            ),
                    ),
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

  // void _showLoginModal(BuildContext context,HomeController homeController) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) => Container(
  //         height: dSize(.7),
  //         width: dSize(1),
  //         padding: EdgeInsets.all(dSize(.04)),
  //         decoration: BoxDecoration(
  //             color: PublicController.pc.toggleCardBg(),
  //             borderRadius: const BorderRadius.only(
  //               topLeft: Radius.circular(15),
  //               topRight: Radius.circular(15),
  //             )),
  //         child: Obx(() => Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text('Login/Signup',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                         color: PublicController.pc.toggleTextColor(),
  //                         fontSize: dSize(.06),
  //                         fontWeight: FontWeight.bold)),
  //                 InkWell(onTap:()=>Get.back(),
  //                     child: Icon(LineAwesomeIcons.times,size: dSize(.05),color: Colors.black,))
  //               ],
  //             ),
  //             Divider(height: dSize(.09)),
  //             //SizedBox(height: dSize(.1)),
  //
  //             ///Google button
  //             ElevatedButton(
  //               onPressed: (){
  //                 _googleLogin(homeController);
  //               },
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(vertical: dSize(.03)),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Icon(FontAwesomeIcons.google,color: Colors.white,size: dSize(.06)),
  //                     SizedBox(width: dSize(.03)),
  //                     Text('Google',style: _textStyle.copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: dSize(.045)))
  //                   ],
  //                 ),
  //               ),style: ElevatedButton.styleFrom(
  //                 primary: AllColor.googleColor,
  //                 elevation: 0.0
  //             ),),
  //             SizedBox(height: dSize(.05)),
  //
  //             ///Facebook button
  //             ElevatedButton(
  //               onPressed: (){
  //                 _facebookLogin();
  //               },
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(vertical: dSize(.03)),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Icon(FontAwesomeIcons.facebook,color: Colors.white,size: dSize(.06)),
  //                     SizedBox(width: dSize(.03)),
  //                     Text('Facebook',style: _textStyle.copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: dSize(.045)))
  //                   ],
  //                 ),
  //               ),style: ElevatedButton.styleFrom(
  //                 primary: AllColor.fbColor,
  //                 elevation: 0.0
  //             ),),
  //             const Spacer(),
  //
  //             RichText(
  //               text: TextSpan(
  //                 style: _textStyle.copyWith(fontSize: dSize(.028)),
  //                 children:[
  //                   const TextSpan(text: 'I agree with the '),
  //                   TextSpan(text: 'terms of use',
  //                       recognizer: TapGestureRecognizer()..onTap = (){},
  //                       style: TextStyle(decoration: TextDecoration.underline,color: PublicController.pc.toggleLoadingColor())),
  //                   const TextSpan(text: ' and '),
  //                   TextSpan(text: 'privacy policy',
  //                       recognizer: TapGestureRecognizer()..onTap = (){},
  //                       style: TextStyle(decoration: TextDecoration.underline,color: PublicController.pc.toggleLoadingColor())),
  //                 ],
  //               ),
  //             )
  //           ],
  //         )),
  //       ));
  // }
  // _facebookLogin() async {
  //   final fb = FacebookLogin();
  //
  //   final res = await fb.logIn(permissions: [
  //     FacebookPermission.publicProfile,
  //     FacebookPermission.email,
  //   ]);
  //
  //   switch (res.status) {
  //     case FacebookLoginStatus.success:
  //       final FacebookAccessToken? accessToken = res.accessToken;
  //       print('Access token: ${accessToken!.token}');
  //
  //       // Get profile data
  //       final profile = await fb.getUserProfile();
  //       print('Hello, ${profile!.name}! You ID: ${profile.userId}');
  //
  //       // Get user profile image url
  //       final imageUrl = await fb.getProfileImageUrl(width: 100);
  //       print('Your profile image: $imageUrl');
  //
  //       // Get email (since we request email permission)
  //       final email = await fb.getUserEmail();
  //       // But user can decline permission
  //       if (email != null) print('And your email is $email');
  //
  //       break;
  //     case FacebookLoginStatus.cancel:
  //       // User cancel log in
  //       break;
  //     case FacebookLoginStatus.error:
  //       // Log in failed
  //       print('Error while log in: ${res.error}');
  //       break;
  //   }
  // }

  _googleLogin(HomeController homeController) async {
    final googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _user;
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      setState(() {
        _isLoading = true;
        homeController
            .registerUserWithGoogle(_user!.displayName!, "", _user.id,
                _user.email, "", _user.photoUrl!)
            .then((value) async {
          setState(() {
            _isLoading = false;
          });
        });
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeNavPage(),
        ),
      );

      // Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileScreen(),),);
    });
  }
}
