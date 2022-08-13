import 'package:cached_network_image/cached_network_image.dart';
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
    required this.onTap,
    this.leadingUrlOne,
    this.leadingUrlTwo,
    required this.title,
    this.teamOne,
    this.teamTwo,
    this.reachTitleOne,
    this.reachSubTitleOne,
    this.reachTitleTwo,
    this.reachSubTitleTwo,
    this.wonTeam,
    this.byWon,
  }) : super(key: key);
  final String? title;
  final String? leadingUrlOne;
  final String? leadingUrlTwo;
  final String? teamOne;
  final String? teamTwo;
  final String? reachTitleOne;
  final String? reachSubTitleOne;
  final String? reachTitleTwo;
  final String? reachSubTitleTwo;
  final String? wonTeam;
  final String? byWon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    )),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "P",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "W",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "D",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "NR",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "NRR",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Pts",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ),
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
                itemCount: homeController
                    .pointTableModel.pointsTable!.first.pointsTableInfo!.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Divider(),
                      SizedBox(
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
                                              "${homeController.pointTableModel.pointsTable!.first.pointsTableInfo![index].teamImageId!}" +
                                              ApiEndpoints.imageLastPoint,
                                          headers: ApiEndpoints.headers,
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${homeController.pointTableModel.pointsTable!.first.pointsTableInfo![index].teamName!.name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
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
                                  "${homeController.pointTableModel.pointsTable!.first.pointsTableInfo![index].matchesPlayed!}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                )),
                                Expanded(
                                  child: Text(
                                    homeController
                                                .pointTableModel
                                                .pointsTable!
                                                .first
                                                .pointsTableInfo![index]
                                                .matchesWon !=
                                            null
                                        ? "${homeController.pointTableModel.pointsTable!.first.pointsTableInfo![index].matchesWon!}"
                                        : "0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                  homeController
                                              .pointTableModel
                                              .pointsTable!
                                              .first
                                              .pointsTableInfo![index]
                                              .matchesDrawn !=
                                          null
                                      ? "${homeController.pointTableModel.pointsTable!.first.pointsTableInfo![index].matchesWon!}"
                                      : "0",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dSize(.03),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                )),
                                Expanded(
                                  child: Text(
                                    homeController
                                                .pointTableModel
                                                .pointsTable!
                                                .first
                                                .pointsTableInfo![index]
                                                .noRes !=
                                            null
                                        ? "${homeController.pointTableModel.pointsTable!.first.pointsTableInfo![index].noRes!}"
                                        : "0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    homeController
                                                .pointTableModel
                                                .pointsTable!
                                                .first
                                                .pointsTableInfo![index]
                                                .noRes !=
                                            null
                                        ? homeController
                                            .pointTableModel
                                            .pointsTable!
                                            .first
                                            .pointsTableInfo![index]
                                            .nrr!
                                        : "0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    homeController
                                                .pointTableModel
                                                .pointsTable!
                                                .first
                                                .pointsTableInfo![index]
                                                .points !=
                                            null
                                        ? "${homeController.pointTableModel.pointsTable!.first.pointsTableInfo![index].points!}"
                                        : "0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: dSize(.03),
                                      color:
                                          PublicController.pc.toggleTextColor(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                }),
          ],
        ),
      );
    });
  }
}
