import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/model/rapid_model/recent_match_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../details_view/home_details/home_details_screen.dart';

class FinishedCardTile extends StatelessWidget {
 final RapidMatch rapidMatch;
  const FinishedCardTile({
    Key? key,
    required this.rapidMatch,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(rapidMatch.matchScore!.team1Score!.inngs1!.runs);
        Get.to(
          HomeDetailsScreen(
            rapidMatch:rapidMatch,
          ),
        );
      },
      child: Card(
        color: PublicController.pc.toggleCardBg(),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${rapidMatch.matchInfo!.seriesName}",
                    style: CLTextStyle().nameTextStyle.copyWith(
                      fontSize: dSize(.04),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                ApiEndpoints.imageMidPoint +
                                    "${rapidMatch.matchInfo!.team1!.imageId}" +
                                    ApiEndpoints.imageLastPoint,
                                headers: ApiEndpoints.headers,
                              ),
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.low),
                        ),
                      ),
                      Text(
                        "${rapidMatch.matchInfo!.team1!.teamSName}",
                        style: CLTextStyle().nameTextStyle.copyWith(
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text:rapidMatch.matchScore != null? "${rapidMatch.matchScore!.team1Score!.inngs1!.runs}":"0.0",
                              style: CLTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: rapidMatch.matchScore != null? "${rapidMatch.matchScore!.team1Score!.inngs1!.overs}":"0.0",
                                  style:
                                      CLTextStyle().paragraphTextStyle.copyWith(
                                    fontSize: dSize(.02),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                                // TextSpan(text: ' world!'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '  VS',
                        style: TextStyle(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: dSize(.3),
                        child: Text(
                          rapidMatch.matchInfo!.status != null? rapidMatch.matchInfo!.status!:"0.0",
                          textAlign: TextAlign.center,
                          style: CLTextStyle().paragraphTextStyle.copyWith(
                            fontSize: dSize(.03),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                ApiEndpoints.imageMidPoint +
                                    "${rapidMatch.matchInfo!.team2!.imageId}"+
                                    ApiEndpoints.imageLastPoint,
                                headers: ApiEndpoints.headers,
                              ),
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.low),
                        ),
                      ),
                      Text(
                        rapidMatch.matchInfo!.team1!.teamSName!,
                        style: CLTextStyle().nameTextStyle.copyWith(
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: rapidMatch.matchScore != null? "${rapidMatch.matchScore!.team2Score!.inngs1!.runs}":"0.0",
                              style: CLTextStyle().paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: rapidMatch.matchScore != null? "${rapidMatch.matchScore!.team2Score!.inngs1!.overs}":"0.0",
                                  style:
                                      CLTextStyle().paragraphTextStyle.copyWith(
                                    fontSize: dSize(.02),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
                                ),
                                // TextSpan(text: ' world!'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2 More Matches",
                    style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
                      fontSize: dSize(.03),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: PublicController.pc.toggleTextColor(),
                    size: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
