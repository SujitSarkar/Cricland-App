import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/rapid_model/recent_match_model.dart';
import '../details_view/home_details/home_details_screen.dart';
import '../details_view/upcoming_details/upcoming_details_screen.dart';

class UpcomingCardTile extends StatelessWidget {
  final RapidMatch rapidMatch;
  const UpcomingCardTile({
    Key? key,
    required this.rapidMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
        fontSize: dSize(.032), color: PublicController.pc.toggleTextColor());
    return GestureDetector(
      onTap: (){
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
      child: Container(

        height: 130,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Row(
                    children:  [
                      Text("${rapidMatch.matchInfo!.matchDesc} ",style:_textStyle.copyWith(
                          fontSize: dSize(.035),
                          fontWeight: FontWeight.bold,
                          color: PublicController.pc
                              .toggleLoadingColor(),),),
                      Text("${rapidMatch.matchInfo!.venueInfo!.ground}, ${rapidMatch.matchInfo!.venueInfo!.city}",style:_textStyle.copyWith(
                        fontSize: dSize(.035),
                        fontWeight: FontWeight.bold,
                        color: PublicController.pc
                            .toggleLoadingColor(),),)
                    ],
                  ),
                ),
                SizedBox(
                  height: dSize(.03),
                ),
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
                              children:  [
                                Container(
                                  height: dSize(.05),
                                  width:dSize(.05),
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
                                SizedBox(
                                  width: dSize(.02),
                                ),
                                Text("${rapidMatch.matchInfo!.team1!.teamSName} ",style:_textStyle.copyWith(
                                  fontSize: dSize(.035),
                                  fontWeight: FontWeight.bold,
                                  color: PublicController.pc
                                      .toggleLoadingColor(),),),
                                rapidMatch.matchScore != null?   Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("${rapidMatch.matchScore!.team1Score!.inngs1!.runs}-${rapidMatch.matchScore!.team1Score!.inngs1!.wickets}",style:_textStyle.copyWith(
                                      fontSize: dSize(.035),
                                      fontWeight: FontWeight.bold,
                                      color: PublicController.pc
                                          .toggleLoadingColor(),),),
                                    Text(" ${rapidMatch.matchScore!.team1Score!.inngs1!.overs}",style:_textStyle.copyWith(
                                    fontSize: dSize(.03),
        fontWeight: FontWeight.bold,
        color: PublicController.pc
            .toggleLoadingColor(),),),
                                  ],
                                ):const SizedBox()
                              ],
                            ),
                          ),

                          Row(
                            children:  [
                              Container(
                                height: dSize(.05),
                                width:dSize(.05),
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
                              Text("${rapidMatch.matchInfo!.team2!.teamSName}"),
                             rapidMatch.matchScore != null?   Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(" ${rapidMatch.matchScore!.team2Score!.inngs1!.runs}-${rapidMatch.matchScore!.team2Score!.inngs1!.wickets}",style:_textStyle.copyWith(
                                    fontSize: dSize(.035),
                                    fontWeight: FontWeight.bold,
                                    color: PublicController.pc
                                        .toggleLoadingColor(),),),
                                  Text(" ${rapidMatch.matchScore!.team2Score!.inngs1!.overs}",style:_textStyle.copyWith(
                                    fontSize: dSize(.03),
                                    fontWeight: FontWeight.bold,
                                    color: PublicController.pc
                                        .toggleLoadingColor(),),),
                                ],
                              ):const SizedBox()
                            ],
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Column(
                          children:  [
                            rapidMatch.matchInfo!.state=="Live"?   Icon(Icons.do_not_disturb_on_total_silence,color: Colors.red,):SizedBox(),
                            Text("${rapidMatch.matchInfo!.state}",style:_textStyle.copyWith(
                              fontSize: dSize(.035),
                              fontWeight: FontWeight.bold,
                              color: PublicController.pc
                                  .toggleLoadingColor(),),),
                            Text("Start at:",style:_textStyle.copyWith(
                              fontSize: dSize(.03),
                              fontWeight: FontWeight.bold,
                              color: PublicController.pc
                                  .toggleLoadingColor(),),),
                            Text(  DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(rapidMatch.matchInfo!.startDate!) * 1000)).toString(),style:_textStyle.copyWith(
                            fontSize: dSize(.035),
                  fontWeight: FontWeight.bold,
                  color: PublicController.pc
                      .toggleLoadingColor(),),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],),
          ),),
      )
    );
  }
}
