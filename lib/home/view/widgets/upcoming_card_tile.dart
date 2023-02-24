import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/rapid_model/recent_match_model.dart';
import '../details_view/home_details/home_details_screen.dart';

class UpcomingCardTile extends StatelessWidget {
  final RapidMatch rapidMatch;

  const UpcomingCardTile({
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
              builder: (_) => HomeDetailsScreen(
                // selectedIndex: 2,
                rapidMatch: rapidMatch,
              ),
            ),
          );
        },
        child: Card(
          elevation: 0.0,
          color: PublicController.pc.toggleCardBg(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      child: Text("${rapidMatch.matchInfo!.matchDesc} ${rapidMatch.matchInfo!.venueInfo!.ground}, ${rapidMatch.matchInfo!.venueInfo!.city} ",
                          style: AppTextStyle().bodyTextStyle),
                    ),
                    Icon(Icons.notifications,color: Colors.grey,)
                  ],
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
                                    style: AppTextStyle().bodyTextStyle),
                                rapidMatch.matchScore != null
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              "${rapidMatch.matchScore!.team1Score!.inngs1!.runs}-${rapidMatch.matchScore!.team1Score!.inngs1!.wickets}",
                                              style: AppTextStyle()
                                                  .bodyTextStyle),
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
                              SizedBox(
                                width: dSize(.02),
                              ),
                              Text("${rapidMatch.matchInfo!.team2!.teamSName}",style: AppTextStyle().bodyTextStyle),
                              rapidMatch.matchScore != null
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            " ${rapidMatch.matchScore!.team2Score!.inngs1!.runs}-${rapidMatch.matchScore!.team2Score!.inngs1!.wickets}",
                                            style: AppTextStyle()
                                                .bodyTextStyle),
                                        Text(
                                            " ${rapidMatch.matchScore!.team2Score!.inngs1!.overs}",
                                            style: AppTextStyle()
                                                .paragraphTextStyle),
                                      ],
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Column(
                          children: [
                            rapidMatch.matchInfo!.state == "Live"
                                ? const Icon(
                                    Icons.do_not_disturb_on_total_silence,
                                    color: Colors.red)
                                : const SizedBox(),

                            Text("Starting in:",
                                style: AppTextStyle().bodyTextStyle),
                            Text(
                                DateFormat('hh:mm a')
                                    .format(DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(rapidMatch
                                                .matchInfo!.startDate!) *
                                            1000))
                                    .toString(),
                                style: AppTextStyle().largeTitleStyle.copyWith(color: Colors.orange)),
                          ],
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
