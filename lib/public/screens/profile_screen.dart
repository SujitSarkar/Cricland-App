import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricland/public/screens/profile_update_screen.dart';
import 'package:cricland/public/screens/sell_points_screen.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/public/widgets/decoration.dart';
import 'package:cricland/public/widgets/gradiend_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../home/controller/home_controller.dart';
import '../controller/public_controller.dart';
import '../variables/colors.dart';
import '../variables/config.dart';
import '../variables/variable.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? galleryImage;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        appBar: AppBar(
          flexibleSpace:
              Container(decoration: StDecoration().sliverAppbarGradient),
          title: Text('Profile',
              style: AppTextStyle()
                  .largeTitleBoldStyle
                  .copyWith(color: AllColor.darkTextColor)),
        ),
        body: _bodyUI(context, homeController),
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
                    Stack(
                      children: [
                        galleryImage != null
                            ? CircleAvatar(
                                radius: 70,
                                backgroundImage: FileImage(
                                  File(galleryImage!.path),
                                ),
                              )
                            : homeController.userModel.profileImage!.isEmpty
                                ? const CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        AssetImage('assets/player.png'))
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundImage: NetworkImage(
                                        homeController.userModel.profileImage!),
                                  ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              _modalBottomSheetMenu(homeController);
                            },
                            child: const CircleAvatar(
                                child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(Icons.camera_alt_outlined),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: dSize(.05)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Name:',
                            style: AppTextStyle().largeTitleBoldStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '  ${homeController.userModel.firstName} ${homeController.userModel.lastName}',
                                style: AppTextStyle()
                                    .largeTitleBoldStyle
                                    .copyWith(color: AllColor.fbColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: dSize(.05)),
                        homeController.userModel.phone == null
                            ? const SizedBox()
                            : RichText(
                                text: TextSpan(
                                  text: 'Phone:',
                                  style: AppTextStyle().largeTitleBoldStyle,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          '  ${homeController.userModel.phone}',
                                      style: AppTextStyle()
                                          .boldBodyTextStyle
                                          .copyWith(
                                              fontSize: dSize(.05),
                                              color: AllColor.fbColor),
                                    ),
                                  ],
                                ),
                              ),
                        SizedBox(height: dSize(.05)),
                        RichText(
                          text: TextSpan(
                            text: 'A.Points:',
                            style: AppTextStyle().largeTitleStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '  ${homeController.userModel.totalPoint} Pts',
                                style: AppTextStyle()
                                    .largeTitleBoldStyle
                                    .copyWith(color: AllColor.fbColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: dSize(.3)),
                        GradientButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => UpdateProfile(
                                  userModel: homeController.userModel,
                                ),
                              ),
                            );
                          },
                          child: Text('Profile Update',
                              style: AppTextStyle().buttonTextStyle),
                        ),
                        SizedBox(height: dSize(.04)),
                        GradientButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SellPointScreen()));
                          },
                          child: Text(
                            'Sell Point',
                            style: AppTextStyle().buttonTextStyle,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ));

  void _modalBottomSheetMenu(HomeController homeController) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 100.0,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    XFile? pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.camera);

                    if (pickedFile != null) {
                      setState(() {
                        galleryImage = File(pickedFile.path);
                      });
                      uploadProfileImageUpdate(pickedFile,
                          "${homeController.userModel.id}", homeController);
                    }
                  },
                  icon: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) =>
                        StDecoration().tabBarGradient.createShader(bounds),
                    child: const Icon(
                      Icons.camera,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: dSize(0.1),
                ),
                IconButton(
                  onPressed: () async {
                    XFile? pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    final FirebaseStorage _storage = FirebaseStorage.instance;
                    Reference ref = _storage
                        .ref()
                        .child("images/${DateTime.now().toString()}");
                    if (pickedFile != null) {
                      setState(() {
                        galleryImage = File(pickedFile.path);
                      });
                      uploadProfileImageUpdate(pickedFile,
                          "${homeController.userModel.id}", homeController);
                    }
                  },
                  icon: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) =>
                        StDecoration().tabBarGradient.createShader(bounds),
                    child: const Icon(
                      Icons.photo,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  uploadProfileImageUpdate(
      XFile pickedFile, String profileId, HomeController homeController) async {
    final FirebaseStorage _storage = FirebaseStorage.instance;
    Reference ref = _storage.ref().child("images/${DateTime.now().toString()}");

    UploadTask uploadTask = ref.putFile(File(pickedFile.path));
    String downloadURL = await (await uploadTask).ref.getDownloadURL();

    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(profileId)
          .update({
        'profileImage': downloadURL,
      });
      await homeController.getUser(profileId);

      showToast('Success');
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
  }
}
