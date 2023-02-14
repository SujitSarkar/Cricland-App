import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../public/controller/api_endpoints.dart';
import '../../controller/home_controller.dart';

class PointTableTile extends StatelessWidget {
  const PointTableTile({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
        fontSize: dSize(.032), color: PublicController.pc.toggleTextColor());
    return GetBuilder<HomeController>(builder: (homeController) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      "Team",
                      style:_textStyle.copyWith(
                        fontSize: dSize(.035),
                        fontWeight: FontWeight.bold,
                        color: PublicController.pc
                            .toggleLoadingColor(),),
                    )),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "P",
                          style:_textStyle.copyWith(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.bold,
                            color: PublicController.pc
                                .toggleLoadingColor(),),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "W",
                          style:_textStyle.copyWith(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.bold,
                            color: PublicController.pc
                                .toggleLoadingColor(),),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "D",
                          style:_textStyle.copyWith(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.bold,
                            color: PublicController.pc
                                .toggleLoadingColor(),),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "NR",
                          style:_textStyle.copyWith(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.bold,
                            color: PublicController.pc
                                .toggleLoadingColor(),),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "NRR",
                          style:_textStyle.copyWith(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.bold,
                            color: PublicController.pc
                                .toggleLoadingColor(),),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Pts",
                          style:_textStyle.copyWith(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.bold,
                            color: PublicController.pc
                                .toggleLoadingColor(),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
     ListView.builder(
                    itemCount: homeController.rapidPointTableList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              ApiEndpoints.imageMidPoint +
                                                  "${homeController.rapidPointTableList[index].teamImageId!}" +
                                                  ApiEndpoints.imageLastPoint,
                                              headers: ApiEndpoints.headers,
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      homeController.rapidPointTableList[index].teamName!,
                                      style:_textStyle.copyWith(
                                        fontSize: dSize(.03),
                                        fontWeight: FontWeight.bold,
                                        color: PublicController.pc
                                            .toggleLoadingColor(),),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "${homeController.rapidPointTableList[index].matchesPlayed!}",
                                          style:_textStyle.copyWith(
                                            fontSize: dSize(.03),
                                            fontWeight: FontWeight.bold,
                                            color: PublicController.pc
                                                .toggleLoadingColor(),),
                                    )),
                                    Expanded(
                                      child: Text(
                                        homeController.rapidPointTableList[index].matchesWon.toString(),
                                        style:_textStyle.copyWith(
                                          fontSize: dSize(.03),
                                          fontWeight: FontWeight.bold,
                                          color: PublicController.pc
                                              .toggleLoadingColor(),),
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                          homeController.rapidPointTableList[index].matchesDrawn.toString(),
                                          style:_textStyle.copyWith(
                                            fontSize: dSize(.03),
                                            fontWeight: FontWeight.bold,
                                            color: PublicController.pc
                                                .toggleLoadingColor(),),
                                    )),
                                    Expanded(
                                      child: Text(
                                        homeController.rapidPointTableList[index].noRes.toString(),
                                        style:_textStyle.copyWith(
                                          fontSize: dSize(.03),
                                          fontWeight: FontWeight.bold,
                                          color: PublicController.pc
                                              .toggleLoadingColor(),),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        homeController.rapidPointTableList[index].nrr.toString(),
                                        style:_textStyle.copyWith(
                                          fontSize: dSize(.03),
                                          fontWeight: FontWeight.bold,
                                          color: PublicController.pc
                                              .toggleLoadingColor(),),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        homeController.rapidPointTableList[index].points.toString(),
                                        style:_textStyle.copyWith(
                                          fontSize: dSize(.03),
                                          fontWeight: FontWeight.bold,
                                          color: PublicController.pc
                                              .toggleLoadingColor(),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      );
                    })

          ],
        ),
      );
    });
  }
}
