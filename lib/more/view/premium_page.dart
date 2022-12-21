import 'package:cricland/public/variables/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../public/controller/public_controller.dart';
import '../../public/variables/config.dart';

class PremiumPage extends StatelessWidget {
  PremiumPage({Key? key}) : super(key: key);

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032),
      //fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Premium',
            style: TextStyle(fontSize: dSize(.045))),
      ),
      body: _bodyUI(context),
    );
  }

  Widget _bodyUI(BuildContext context)=>Obx(() => ListView(
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
                Image.asset('assets/logo.png',height: dSize(.2)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Cricland',style: _textStyle.copyWith(fontSize: dSize(.1),fontStyle:FontStyle.italic,fontWeight: FontWeight.bold)),
                    Text('PREMIUM',textAlign: TextAlign.end,
                        style: TextStyle(fontSize: dSize(.05),fontWeight: FontWeight.bold,color: AllColor.goldenColor)),
                  ],
                )
              ],
            ),
            SizedBox(height: dSize(.05)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: dSize(.1)),
              child: Text('Subscribe to premium and get access to our ads free plan'
                  ' and enjoy cricket without interruptions',
                  style: _textStyle,textAlign: TextAlign.center),
            ),
            SizedBox(height: dSize(.06)),

            InkWell(
              onTap: ()=> _showLoginModal(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: dSize(.02),vertical: dSize(.04)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
                    border: Border.all(color: PublicController.pc.togglePrimaryGrey(),width: 0.5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Already a paid user',style: _textStyle),
                    Text('Login/Signup',style: _textStyle.copyWith(fontSize: dSize(.035),fontWeight: FontWeight.bold,color: PublicController.pc.toggleLoadingColor()))
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
          borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
        ),
        child: Column(
          children: [
            /// 1 Month
            Container(
              padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.07)),
              decoration: BoxDecoration(
                color: const Color(0xffCCCFD7),
                borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$ 99.0',style: TextStyle(color: AllColor.lightTextColor,fontSize: dSize(.06),fontWeight: FontWeight.bold)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: dSize(.015),vertical: dSize(.005)),
                        decoration: BoxDecoration(
                          color: AllColor.purpleColor,
                          borderRadius: BorderRadius.all(Radius.circular(dSize(.01))),
                        ),
                        child: Text('SILVER',style: _textStyle.copyWith(color: AllColor.darkTextColor,fontSize: dSize(.03))),
                      ),
                      Text('1 Month',style: TextStyle(color: AllColor.lightTextColor,fontSize: dSize(.06),fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: dSize(.03)),

            /// 3 Month
            Container(
              padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.07)),
              decoration: BoxDecoration(
                color: const Color(0xffFCE1BF),
                borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('\$ 299.0',
                          style: TextStyle(color: AllColor.lightTextColor,fontSize: dSize(.045),decoration: TextDecoration.lineThrough)),
                      Container(
                        margin: EdgeInsets.only(left: dSize(.02)),
                        padding: EdgeInsets.symmetric(horizontal: dSize(.015),vertical: dSize(.005)),
                        decoration: BoxDecoration(
                          border: Border.all(color: AllColor.tabUnderlineColor,width: 0.4),
                          borderRadius: BorderRadius.all(Radius.circular(dSize(.05))),
                        ),
                        child: Text('You save 33%',style: _textStyle.copyWith(color: AllColor.tabUnderlineColor,fontSize: dSize(.03))),
                      ),
                      const Spacer(),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: dSize(.015),vertical: dSize(.005)),
                        decoration: BoxDecoration(
                          color: AllColor.tabUnderlineColor,
                          borderRadius: BorderRadius.all(Radius.circular(dSize(.01))),
                        ),
                        child: Text('GOLD',style: _textStyle.copyWith(color: AllColor.darkTextColor,fontSize: dSize(.03))),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ 199.0',style: TextStyle(color: AllColor.lightTextColor,fontSize: dSize(.06),fontWeight: FontWeight.bold)),
                      Text('3 Months',style: TextStyle(color: AllColor.lightTextColor,fontSize: dSize(.06),fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: dSize(.03)),

            /// 12 Month
            Container(
              padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.07)),
              decoration: BoxDecoration(
                color: const Color(0xffD1E8F5),
                borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('\$ 1199.0',
                          style: TextStyle(color: AllColor.lightTextColor,fontSize: dSize(.045),decoration: TextDecoration.lineThrough)),
                      Container(
                        margin: EdgeInsets.only(left: dSize(.02)),
                        padding: EdgeInsets.symmetric(horizontal: dSize(.015),vertical: dSize(.005)),
                        decoration: BoxDecoration(
                          border: Border.all(color: AllColor.blueColor,width: 0.4),
                          borderRadius: BorderRadius.all(Radius.circular(dSize(.05))),
                        ),
                        child: Text('You save 50%',style: _textStyle.copyWith(color: AllColor.blueColor,fontSize: dSize(.03))),
                      ),
                      const Spacer(),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: dSize(.015),vertical: dSize(.005)),
                        decoration: BoxDecoration(
                          color: AllColor.blueColor,
                          borderRadius: BorderRadius.all(Radius.circular(dSize(.01))),
                        ),
                        child: Text('PLATINUM',style: _textStyle.copyWith(color: AllColor.darkTextColor,fontSize: dSize(.03))),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ 599.0',style: TextStyle(color: AllColor.lightTextColor,fontSize: dSize(.06),fontWeight: FontWeight.bold)),
                      Text('12 Months',style: TextStyle(color: AllColor.lightTextColor,fontSize: dSize(.06),fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )

    ],
  ));

  void _showLoginModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
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
                  InkWell(onTap:()=>Get.back(),
                    child: Icon(LineAwesomeIcons.times,size: dSize(.05),color: Colors.black,))
                ],
              ),
              Divider(height: dSize(.09)),
              //SizedBox(height: dSize(.1)),

              ///Google button
              ElevatedButton(
                onPressed: (){},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: dSize(.03)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.google,color: Colors.white,size: dSize(.06)),
                      SizedBox(width: dSize(.03)),
                      Text('Google',style: _textStyle.copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: dSize(.045)))
                    ],
                  ),
                ),style: ElevatedButton.styleFrom(
                  primary: AllColor.googleColor,
                  elevation: 0.0
              ),),
              SizedBox(height: dSize(.05)),

              ///Facebook button
              ElevatedButton(
                onPressed: (){},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: dSize(.03)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.facebook,color: Colors.white,size: dSize(.06)),
                      SizedBox(width: dSize(.03)),
                      Text('Facebook',style: _textStyle.copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: dSize(.045)))
                    ],
                  ),
                ),style: ElevatedButton.styleFrom(
                  primary: AllColor.fbColor,
                  elevation: 0.0
              ),),
              const Spacer(),

              RichText(
                text: TextSpan(
                  style: _textStyle.copyWith(fontSize: dSize(.028)),
                  children:[
                    const TextSpan(text: 'I agree with the '),
                    TextSpan(text: 'terms of use',
                        recognizer: TapGestureRecognizer()..onTap = (){},
                        style: TextStyle(decoration: TextDecoration.underline,color: PublicController.pc.toggleLoadingColor())),
                    const TextSpan(text: ' and '),
                    TextSpan(text: 'privacy policy',
                        recognizer: TapGestureRecognizer()..onTap = (){},
                        style: TextStyle(decoration: TextDecoration.underline,color: PublicController.pc.toggleLoadingColor())),
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
