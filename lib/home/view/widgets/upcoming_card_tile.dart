import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/rapid_model/recent_match_model.dart';
import '../details_view/upcoming_details/upcoming_details_screen.dart';

class UpcomingCardTile extends StatelessWidget {
  final RapidMatch rapidMatch;
  const UpcomingCardTile({
    Key? key,
    required this.rapidMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => UpcomingDetailsScreen(
              selectedIndex: 2,
              rapidMatch: rapidMatch,
            ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${rapidMatch.matchInfo!.seriesName}",
                      style: CLTextStyle().nameTextStyle.copyWith(
                        fontSize: dSize(.04),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.notifications_active_outlined,
                    color: PublicController.pc.toggleTextColor(),
                  )
                ],
              ),
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
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '  VS',
                        style: TextStyle(
                            fontSize: dSize(.04),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${rapidMatch.matchInfo!.status}",
                        style: CLTextStyle().paragraphTextStyle.copyWith(
                          fontSize: dSize(.035),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                                color: PublicController.pc.toggleTextColor(),
                                width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Start At : ",
                                style: CLTextStyle().paragraphTextStyle.copyWith(
                                    color: Colors.green,
                                    fontSize: dSize(.035),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(rapidMatch.matchInfo!.startDate!) * 1000)).toString(),
                                style: CLTextStyle().paragraphTextStyle.copyWith(
                                    color: Colors.green,
                                    fontSize: dSize(.03),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
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
                                    "${rapidMatch.matchInfo!.team2!.imageId}" +
                                    ApiEndpoints.imageLastPoint,
                                headers: ApiEndpoints.headers,
                              ),
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.low),
                        ),
                      ),
                      Text(rapidMatch.matchInfo!.team2!.teamSName!,
                          style: CLTextStyle().nameTextStyle.copyWith(
                            fontSize: dSize(.04),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor(),
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class LiveCard extends StatelessWidget {
//   const LiveCard({Key? key, required this.child}) : super(key: key);
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//           color: PublicController.pc.toggleCardBg(),
//           borderRadius: const BorderRadius.all(Radius.circular(8))),
//       child: child,
//     );
//   }
// }
