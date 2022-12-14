import 'package:cricland/public/screens/sell_points_screen.dart';
import 'package:cricland/public/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../home/controller/home_controller.dart';
import '../controller/public_controller.dart';
import '../variables/colors.dart';
import '../variables/config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.04),
      //fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController)
    {
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile',
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

            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/player.png'),

            ),
            SizedBox(height: dSize(.05)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Name:',
                    style: TextStyle(
                        fontSize: dSize(.05),

                        color: PublicController.pc.toggleTextColor()),
                    children:  <TextSpan>[
                      TextSpan(text: '  ${homeController.userModel.firstName} ${homeController.userModel.lastName}',style: _textStyle.copyWith(fontSize: dSize(.05),fontWeight: FontWeight.bold,color: AllColor.fbColor),
                        recognizer:  TapGestureRecognizer()..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUpScreen(),),);
                        },
                      ),

                    ],
                  ),
                ),
                SizedBox(height: dSize(.05)),
                RichText(
                  text: TextSpan(
                    text: 'Phone:',
                    style: TextStyle(
                        fontSize: dSize(.05),

                        color: PublicController.pc.toggleTextColor()),
                    children:  <TextSpan>[
                      TextSpan(text: '  ${homeController.userModel.phone}',style: _textStyle.copyWith(fontSize: dSize(.05),fontWeight: FontWeight.bold,color: AllColor.fbColor),
                        recognizer:  TapGestureRecognizer()..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUpScreen(),),);
                        },
                      ),

                    ],
                  ),
                ),
                SizedBox(height: dSize(.05)),
                RichText(
                  text: TextSpan(
                    text: 'A.Points:',
                    style: TextStyle(
                        fontSize: dSize(.05),

                        color: PublicController.pc.toggleTextColor()),
                    children:  <TextSpan>[
                      TextSpan(text: '  ${homeController.userModel.totalPoint} Pts',style: _textStyle.copyWith(fontSize: dSize(.05),fontWeight: FontWeight.bold,color: AllColor.fbColor),
                        recognizer:  TapGestureRecognizer()..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUpScreen(),),);
                        },
                      ),

                    ],
                  ),
                ),

                SizedBox(height: dSize(.5)),
                TextButton(style: TextButton.styleFrom(
                  backgroundColor: AllColor.purpleColor,
                ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>const SellPointScreen()));
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: dSize(.25)),
                    child: Text('Sell Point',style: _textStyle.copyWith(fontSize: dSize(.035),fontWeight: FontWeight.bold,color: AllColor.lightCardColor),),
                  ),)
              ],
            ),


          ],
        ),
      ),


    ],
  ));


}


