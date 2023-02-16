import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricland/public/screens/home_nav_page.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/public/widgets/decoration.dart';
import 'package:cricland/public/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
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
    firstNameController =
        TextEditingController(text: widget.userModel.firstName);
    lastNameController = TextEditingController(text: widget.userModel.lastName);
    phoneController = TextEditingController(text: widget.userModel.phone);
    super.initState();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Stack(alignment: Alignment.center, children: [
        Scaffold(
          appBar: AppBar(
            flexibleSpace:
                Container(decoration: StDecoration().sliverAppbarGradient),
            title: Text("Update Profile",
                style: AppTextStyle()
                    .largeTitleBoldStyle
                    .copyWith(color: AllColor.darkTextColor)),
          ),
          body: _bodyUIUpdate(context, homeController),
        ),
        if (_isLoading) const LoadingPage()
      ]);
    });
  }

  Widget _bodyUIUpdate(BuildContext context, HomeController homeController) =>
      Obx(() => ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(dSize(.05)),
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
                                    .largeTitleBoldStyle
                                    .copyWith(
                                        fontSize: dSize(.1),
                                        fontStyle: FontStyle.italic)),
                            Text('Profile Update',
                                textAlign: TextAlign.end,
                                style: AppTextStyle()
                                    .largeTitleBoldStyle
                                    .copyWith(color: AllColor.goldenColor)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: dSize(.3)),
                    TextFieldTile(
                        controller: firstNameController,
                        hintText: "First Name",
                        labelText: "First Name",
                        textCapitalization: TextCapitalization.words),
                    SizedBox(height: dSize(.06)),
                    TextFieldTile(
                        controller: lastNameController,
                        hintText: "Last Name",
                        labelText: "Last Name",
                        textCapitalization: TextCapitalization.words),
                    SizedBox(height: dSize(.06)),
                    TextFieldTile(
                      controller: phoneController,
                      hintText: "Phone Number",
                      labelText: "Phone Number",
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: dSize(.06)),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AllColor.primaryColor,
                      ),
                      onPressed: () async {
                        if (firstNameController.text.isNotEmpty) {
                          try {
                            setState(() => _isLoading = true);
                            await FirebaseFirestore.instance
                                .collection("Users")
                                .doc(widget.userModel.id)
                                .update({
                              'firstName': firstNameController.text,
                              'lastName': lastNameController.text,
                              'phone': phoneController.text,
                            });
                            await homeController.getUser(widget.userModel.id!);
                            setState(() => _isLoading = false);
                            showToast('Success');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeNavPage(),
                                ));
                          } catch (e) {
                            setState(() => _isLoading = false);
                            showToast(e.toString());
                          }
                        } else {
                          showToast('All Field is required');
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: dSize(.2)),
                        child: Text(
                          'Update',
                          style: AppTextStyle()
                              .titleTextBoldStyle
                              .copyWith(color: Colors.white),
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
