
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/rapid_model/recent_match_model.dart';
import 'package:flutter/material.dart';
import '../../../public/controller/api_endpoints.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';


class MatchCardTile extends StatelessWidget {
 final RapidMatch rapidMatch;
  const MatchCardTile({Key? key,required this.rapidMatch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
        fontSize: dSize(.032), color: PublicController.pc.toggleTextColor());
    return    SizedBox(
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
                    Text("${rapidMatch.matchInfo!.matchDesc} ",
                      style:_textStyle.copyWith(
                        fontSize: dSize(.035),
                        fontWeight: FontWeight.bold,
                        color: PublicController.pc
                            .toggleLoadingColor(),),),
                    Text("${rapidMatch.matchInfo!.venueInfo!.ground}, ${rapidMatch.matchInfo!.venueInfo!.city}",
                      style:_textStyle.copyWith(
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
                          padding: const EdgeInsets.only(bottom: 8.0),
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
                              Text("${rapidMatch.matchInfo!.team1!.teamSName} "),
                              rapidMatch.matchScore != null?   Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${rapidMatch.matchScore!.team1Score!.inngs1!.runs}-${rapidMatch.matchScore!.team1Score!.inngs1!.wickets}",
                                    style:_textStyle.copyWith(
                                      fontSize: dSize(.035),
                                      fontWeight: FontWeight.bold,
                                      color: PublicController.pc
                                          .toggleLoadingColor(),),),
                                  Text(" ${rapidMatch.matchScore!.team1Score!.inngs1!.overs}",
                                      style:_textStyle.copyWith(
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
                            Text("${rapidMatch.matchInfo!.team2!.teamSName}",
                              style:_textStyle.copyWith(
                                fontSize: dSize(.035),
                                fontWeight: FontWeight.bold,
                                color: PublicController.pc
                                    .toggleLoadingColor(),),),
                            rapidMatch.matchScore != null?   Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(" ${rapidMatch.matchScore!.team2Score!.inngs1!.runs}-${rapidMatch.matchScore!.team2Score!.inngs1!.wickets}",
                                  style:_textStyle.copyWith(
                                    fontSize: dSize(.035),
                                    fontWeight: FontWeight.bold,
                                    color: PublicController.pc
                                        .toggleLoadingColor(),),),
                                Text(" ${rapidMatch.matchScore!.team2Score!.inngs1!.overs}",
                                  style:_textStyle.copyWith(
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

                    Row(
                      children: [
                        const VerticalDivider(
                          width: 2,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        SizedBox(
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(rapidMatch.matchInfo!.status != null?"${rapidMatch.matchInfo!.status}":"${rapidMatch.matchInfo!.state}",style:_textStyle.copyWith(
                            fontSize: dSize(.03),
                            fontWeight: FontWeight.bold,
                            color: PublicController.pc
                                .toggleLoadingColor(),),
                            textAlign: TextAlign.center,),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

            ],),
        ),),
    );
  }
}
