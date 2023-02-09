import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/IPL/view/squad_bottom_sheet_screen.dart';
import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_details_man.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'over_view_tab.dart';

class SquadsTab extends StatefulWidget {
  const SquadsTab({Key? key}) : super(key: key);

  @override
  _SquadsTabState createState() => _SquadsTabState();
}

class _SquadsTabState extends State<SquadsTab> {
  void initState() {
    super.initState();
    // fetchData();
  }



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
                itemCount: homeController.matchSquadModel.squads!.length,
                itemBuilder: (BuildContext context, int index) {
                  return homeController
                              .matchSquadModel.squads![index].squadId !=
                          null
                      ? Column(
                          children: [
                            ListTile(
                                onTap: () {
                                  _showModalBottomSheet("3718", "15826");
                                },
                                horizontalTitleGap: 2.0,
                                leading: Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          ApiEndpoints.imageMidPoint +
                                              "${homeController.matchSquadModel.squads![index].imageId}" +
                                              ApiEndpoints.imageLastPoint,
                                          headers: ApiEndpoints.headers,
                                        ),
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
                                  homeController.matchSquadModel.squads![index]
                                      .squadType!,
                                  style: TextStyle(
                                    fontSize: dSize(.04),
                                    fontWeight: FontWeight.w500,
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                )),
                            Divider(),
                          ],
                        )
                      : SizedBox();
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
