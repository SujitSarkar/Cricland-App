import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/more/controller/package_controller.dart';
import 'package:cricland/more/tile/premium_tile.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../public/controller/public_controller.dart';
import '../../public/model/usermodel.dart';
import '../../public/variables/config.dart';
import '../../public/variables/variable.dart';

class PremiumPage extends StatelessWidget {
  PremiumPage({Key? key}) : super(key: key);

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032), color: PublicController.pc.toggleTextColor());


  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackageController>(
        init: PackageController(),
        builder: (controller) {
          return Obx(() => Stack(
                children: [
                  Scaffold(
                    appBar: AppBar(
                      title: Text('Get Premium',
                          style: TextStyle(fontSize: dSize(.045))),
                    ),
                    body: _bodyUI(context, controller),
                  ),
                  if (controller.loading.value) const LoadingWidget()
                ],
              ));
        });
  }

  Widget _bodyUI(BuildContext context, PackageController controller) =>
      Obx(() => RefreshIndicator(
            onRefresh: () async {
              await controller.getPackage();
            },
            backgroundColor: PublicController.pc.togglePagedBg(),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                          Image.asset('assets/main_logo.png',
                              height: dSize(.2)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Cricland',
                                  style: _textStyle.copyWith(
                                      fontSize: dSize(.1),
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold)),
                              Text('PREMIUM',
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
                            'Subscribe to premium and get access to our ads free plan'
                            ' and enjoy cricket without interruptions',
                            style: _textStyle,
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(height: dSize(.06)),
                      InkWell(
                        onTap: () => _showLoginModal(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: dSize(.02), vertical: dSize(.04)),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(dSize(.02))),
                              border: Border.all(
                                  color:
                                      PublicController.pc.togglePrimaryGrey(),
                                  width: 0.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Already a paid user', style: _textStyle),
                              Text('Login/Signup',
                                  style: _textStyle.copyWith(
                                      fontSize: dSize(.035),
                                      fontWeight: FontWeight.bold,
                                      color: PublicController.pc
                                          .toggleLoadingColor()))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: dSize(.05)),
                Container(
                    padding: EdgeInsets.all(dSize(.03)),
                    decoration: BoxDecoration(
                      color: PublicController.pc.toggleCardBg(),
                      borderRadius:
                          BorderRadius.all(Radius.circular(dSize(.02))),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.packageList.length,
                      itemBuilder: (context, index) =>
                          PremiumTile(model: controller.packageList[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: dSize(.03)),
                    ))
              ],
            ),
          ));

  void _showLoginModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) =>  GetBuilder<HomeController>(
            init: HomeController(),
            builder: (homeController) {
              return Obx(() =>   Container(
                height: dSize(.7),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(dSize(.04)),
                decoration: BoxDecoration(
                    color: PublicController.pc.toggleCardBg(),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Login/Signup',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: PublicController.pc.toggleTextColor(),
                                fontSize: dSize(.06),
                                fontWeight: FontWeight.bold)),
                        InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              LineAwesomeIcons.times,
                              size: dSize(.05),
                              color: Colors.black,
                            ))
                      ],
                    ),
                    Divider(height: dSize(.09)),
                    //SizedBox(height: dSize(.1)),

                    ///Google button
                    ElevatedButton(
                      onPressed: () {
                        _googleLogin(context,homeController);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: dSize(.03)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.google,
                                color: Colors.white, size: dSize(.06)),
                            SizedBox(width: dSize(.03)),
                            Text('Google',
                                style: _textStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: dSize(.045)))
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: AllColor.googleColor, elevation: 0.0),
                    ),
                    SizedBox(height: dSize(.05)),

                    ///Facebook button
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: dSize(.03)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.facebook,
                                color: Colors.white, size: dSize(.06)),
                            SizedBox(width: dSize(.03)),
                            Text('Facebook',
                                style: _textStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: dSize(.045)))
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: AllColor.fbColor, elevation: 0.0),
                    ),
                    const Spacer(),

                    RichText(
                      text: TextSpan(
                        style: _textStyle.copyWith(fontSize: dSize(.028)),
                        children: [
                          const TextSpan(text: 'I agree with the '),
                          TextSpan(
                              text: 'terms of use',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {},
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: PublicController.pc
                                      .toggleLoadingColor())),
                          const TextSpan(text: ' and '),
                          TextSpan(
                              text: 'privacy policy',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {},
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: PublicController.pc
                                      .toggleLoadingColor())),
                        ],
                      ),
                    )
                  ],
                )),
              ));
            })

    );
  }


  _googleLogin(BuildContext context,HomeController homeController)async{
    final googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _user;
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null)return;
    _user = googleUser;



    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken:  googleAuth.accessToken,
      idToken:  googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{


        _isLoading = true;
        homeController.  registerUserWithGoogle(
            _user!.displayName!,
            "",
            _user.id,
            _user.email,
            "",
            _user.photoUrl!
        ).then((value) {
          Navigator.pop(context);
            _isLoading = false;
        });
        _isLoading = false;
        Navigator.pop(context);

      // Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileScreen(),),);
    });
  }

}
