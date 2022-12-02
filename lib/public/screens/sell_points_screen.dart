
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/screens/home_nav_page.dart';
import 'package:cricland/public/screens/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/public_controller.dart';
import '../variables/colors.dart';
import '../variables/config.dart';
import '../variables/variable.dart';
import '../widgets/text_field_tile.dart';

class SellPointScreen extends StatefulWidget {
  const SellPointScreen({Key? key}) : super(key: key);

  @override
  State<SellPointScreen> createState() => _SellPointScreenState();
}

class _SellPointScreenState extends State<SellPointScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController sellPointController = TextEditingController();
  TextEditingController transectionMediaController = TextEditingController();
  int _depositRadioSelected = 1;
  bool _valueDeposit = false;
  String _radioVal = 'bkash';
  bool _isLoading = false;
  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032),
      //fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController)
    {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sell Point',
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
                    Text('Points',textAlign: TextAlign.end,
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

            Text("Available Point: ${homeController.userModel.totalPoint}",style: const TextStyle(fontSize: 25),),
            SizedBox(height: dSize(.06)),

            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.red,
                  value: _valueDeposit,
                  onChanged: (value) {
                    setState(() {
                      _valueDeposit = value!;
                    });
                  },
                ),
                Text(
                  'Sells System',
                  style: TextStyle(fontSize: dSize(.04)),
                ),
              ],
            ),
            Visibility(
              visible: _valueDeposit,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step 1: Minimum Available points must be 500',
                    style: TextStyle(fontSize: dSize(.04)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.02)),
                    child: Text(
                      'Step 2: Fill the below instruction & Send Request ',
                      style: TextStyle(fontSize: dSize(.04)),
                    ),
                  ),
                  Text(
                    'Step 3: Then wait to approval ',
                    style: TextStyle(fontSize: dSize(.04)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: dSize(.02)),
                    child: Text(
                      'Step 4: within 24 hours to get your balance',
                      style: TextStyle(fontSize: dSize(.04)),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/bkash_logo.png',
                      // scale: 50,
                    ),
                    Radio(
                      value: 1,
                      groupValue: _depositRadioSelected,
                      activeColor: Colors.pink,
                      onChanged: (value) {
                        setState(() {
                          _depositRadioSelected = value as int;
                          _radioVal = 'bkash';
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/nogot_logo.png', scale: 50),
                    Radio(
                      value: 2,
                      groupValue: _depositRadioSelected,
                      activeColor: Colors.yellowAccent.shade700,
                      onChanged: (value) {
                        setState(() {
                          _depositRadioSelected = value as int;
                          _radioVal = 'nogod';
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/rocket.png', scale: 10),
                    Radio(
                      value: 3,
                      groupValue: _depositRadioSelected,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          _depositRadioSelected = value as int;
                          _radioVal = 'rocket';
                        });
                      },
                    )
                  ],
                ),
              ],
            ),


            SizedBox(height: dSize(.06)),
            TextFieldTile(controller: sellPointController,hintText: "Sell Point",labelText: "Sell Point",),
            SizedBox(height: dSize(.06)),
            TextFieldTile(controller: transectionMediaController,hintText: "Bkash / Nogot No",labelText: "Bkash / Nogot No",),
            SizedBox(height: dSize(.06)),

            TextFieldTile(controller: passwordController,
              hintText: "Password",labelText: "Password",),
            SizedBox(height: dSize(.06)),
            SizedBox(height: dSize(.06)),
            TextButton(style: TextButton.styleFrom(
              backgroundColor: AllColor.purpleColor,
            ),
              onPressed: (){
              if(sellPointController.text.isNotEmpty && transectionMediaController.text.isNotEmpty && passwordController.text.isNotEmpty && _radioVal.isNotEmpty ){
                setState(() {
                  _isLoading = true;
                  homeController
                      .sellPoint(
                    sellPointController.text,
                    transectionMediaController.text,
                    passwordController.text,
                    _radioVal,
                  ).then((value) {
                    setState(() {
                      _isLoading = false;
                    });

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomeNavPage(),),);
                    //
                    // _emptyFieldCreator();
                  });
                });


              }else {

                showToast('All Field is required');
              }



               // Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));
              }, child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: dSize(.25)),
                child: _isLoading?const Center(child: CircularProgressIndicator(color: Colors.white,),): Text('Send Request',style: _textStyle.copyWith(fontSize: dSize(.035),fontWeight: FontWeight.bold,color: AllColor.lightCardColor),),
              ),),
            SizedBox(height: dSize(.06)),

          ],
        ),
      ),



    ],
  ));
  _emptyFieldCreator() {
    sellPointController.clear();
    transectionMediaController.clear();
    passwordController.clear();
  }
}
