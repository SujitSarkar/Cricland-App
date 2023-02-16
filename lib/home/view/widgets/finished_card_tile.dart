import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/home/model/rapid_model/recent_match_model.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => HomeDetailsScreen(rapidMatch: rapidMatch)));
        },
        child: Card(
          color: PublicController.pc.toggleCardBg(),
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Row(
                    children: [
                      Text(
                        "${rapidMatch.matchInfo!.matchDesc} ",
                        style: AppTextStyle().boldBodyTextStyle,
                      ),
                      Text(
                        "${rapidMatch.matchInfo!.venueInfo!.ground}, ${rapidMatch.matchInfo!.venueInfo!.city}",
                        style: AppTextStyle().boldBodyTextStyle,
                      )
                    ],
                  ),
                ),
                SizedBox(height: dSize(.03)),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  height: dSize(.05),
                                  width: dSize(.05),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
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
                                SizedBox(width: dSize(.02)),
                                Text(
                                  "${rapidMatch.matchInfo!.team1!.teamSName} ",
                                  style: AppTextStyle().boldBodyTextStyle,
                                ),
                                rapidMatch.matchScore != null
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${rapidMatch.matchScore!.team1Score!.inngs1!.runs}-${rapidMatch.matchScore!.team1Score!.inngs1!.wickets}",
                                            style: AppTextStyle()
                                                .boldBodyTextStyle,
                                          ),
                                          Text(
                                              " ${rapidMatch.matchScore!.team1Score!.inngs1!.overs}",
                                              style: AppTextStyle()
                                                  .paragraphTextStyle),
                                        ],
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: dSize(.05),
                                width: dSize(.05),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        ApiEndpoints.imageMidPoint +
                                            "${rapidMatch.matchInfo!.team2!.imageId}" +
                                            ApiEndpoints.imageLastPoint,
                                        headers: ApiEndpoints.headers,
                                      ),
                                      fit: BoxFit.fill,
                                      filterQuality: FilterQuality.low),
                                ),
                              ),
                              SizedBox(width: dSize(.02)),
                              Text(
                                "${rapidMatch.matchInfo!.team2!.teamSName}",
                                style: AppTextStyle().boldBodyTextStyle,
                              ),
                              rapidMatch.matchScore != null
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          " ${rapidMatch.matchScore!.team2Score!.inngs1!.runs}-${rapidMatch.matchScore!.team2Score!.inngs1!.wickets}",
                                          style:
                                              AppTextStyle().boldBodyTextStyle,
                                        ),
                                        Text(
                                          " ${rapidMatch.matchScore!.team2Score!.inngs1!.overs}",
                                          style:
                                              AppTextStyle().boldBodyTextStyle,
                                        ),
                                      ],
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: SizedBox(
                          width: 150,
                          child: Text("${rapidMatch.matchInfo!.status}",
                              style: AppTextStyle().boldBodyTextStyle,
                              textAlign: TextAlign.center),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
