import 'package:cricland/public/screens/home_nav_page.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../home/controller/home_controller.dart';
import '../controller/public_controller.dart';
import '../model/usermodel.dart';
import '../variables/colors.dart';
import '../variables/config.dart';
import '../widgets/text_field_tile.dart';

class UpdateProfile extends StatefulWidget {
  final UserModel userModel;
  const UpdateProfile({Key? key, required this.userModel}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    firstNameController =
        TextEditingController(text: widget.userModel.firstName);
    lastNameController = TextEditingController(text: widget.userModel.lastName);
    phoneController = TextEditingController(text: widget.userModel.phone);

    super.initState();
  }

  bool _isLoading = false;
  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032),
      //fontWeight: FontWeight.w500,
      color: PublicController.pc.toggleTextColor());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        appBar: AppBar(
          title:
              Text("Update Profile", style: TextStyle(fontSize: dSize(.045))),
        ),
        body: _bodyUIUpdate(context, homeController),
      );
    });
  }

  Widget _bodyUIUpdate(BuildContext context, HomeController homeController) =>
      Obx(() => ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(dSize(.1)),
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
                                style: _textStyle.copyWith(
                                    fontSize: dSize(.1),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)),
                            Text('Profile Update',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: dSize(.05),
                                    fontWeight: FontWeight.bold,
                                    color: AllColor.goldenColor)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: dSize(.3)),
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
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AllColor.purpleColor,
                      ),
                      onPressed: () {
                        if (firstNameController.text.isNotEmpty &&
                            lastNameController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty) {
                          setState(() {
                            _isLoading = true;
                            // homeController
                            //     .registerUser(
                            //         firstNameController.text,
                            //         lastNameController.text,
                            //         phoneController.text,
                            //         passwordController.text,
                            //         "")
                            //     .then((value) {
                            //   setState(() {
                            //     _isLoading = false;
                            //   });

                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const HomeNavPage(),
                            //     ),
                            //   );
                            // });
                          });
                        } else {
                          showToast('All Field is required');
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: dSize(.2)),
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : Text(
                                'Update',
                                style: _textStyle.copyWith(
                                    fontSize: dSize(.035),
                                    fontWeight: FontWeight.bold,
                                    color: AllColor.lightCardColor),
                              ),
                      ),
                    ),
                    SizedBox(height: dSize(.06)),
                  ],
                ),
              ),
            ],
          ));
}
