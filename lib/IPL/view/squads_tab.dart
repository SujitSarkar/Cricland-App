import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SquadsTab extends StatefulWidget {
  final ScrollController scrollController;
  const SquadsTab({Key? key, required this.scrollController}) : super(key: key);

  @override
  _SquadsTabState createState() => _SquadsTabState();
}

class _SquadsTabState extends State<SquadsTab> {
  void initState() {
    super.initState();
    // fetchData();
  }

  final TextStyle _textStyle = TextStyle(
      fontSize: dSize(.032), color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Text(
                  "ODI",
                  style: TextStyle(
                    fontSize: dSize(.05),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                          onTap: () {
                            //  _showModalBottomSheet("3718", "15826");
                          },
                          horizontalTitleGap: 2.0,
                          leading: Container(
                            height: 30,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/match_logo.png"),
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.low),
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: PublicController.pc.toggleTextColor(),
                            size: 20,
                          ),
                          title: Text(
                            "squadType",
                            style: _textStyle.copyWith(
                              fontSize: dSize(.035),
                              fontWeight: FontWeight.bold,
                              color: PublicController.pc.toggleLoadingColor(),
                            ),
                          )),
                      Divider(),
                    ],
                  );
                }),
          ],
        ),
      );
    });
  }

  _showModalBottomSheet(String seriesId, String squadId) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 58.0),
          // child: BottomSheetScreen(
          //   squadId: squadId,
          //   seriesId: seriesId,
          // ),
        );
      },
    );
  }
}
