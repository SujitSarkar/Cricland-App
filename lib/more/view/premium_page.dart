import 'package:cricland/public/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

            Container(
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
                color: AllColor.purpleColor.withOpacity(.25),
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
                color: AllColor.tabUnderlineColor.withOpacity(.25),
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
                color: AllColor.blueColor.withOpacity(.25),
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
}
