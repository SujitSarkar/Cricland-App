import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../public/controller/api_endpoints.dart';
import '../../../public/variables/config.dart';
import '../../model/rapid_model/recent_match_model.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
class HomeCardTile extends StatefulWidget {
  final RapidMatch rapidMatch;
  final bool isExpanded;
  const HomeCardTile({Key? key,required this.rapidMatch, this.isExpanded=true}) : super(key: key);

  @override
  State<HomeCardTile> createState() => _HomeCardTileState();
}

class _HomeCardTileState extends State<HomeCardTile> {
  int? selectedIndex;
  double containerHeight=160;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${widget.rapidMatch.matchInfo!.seriesName}"),
            IconButton(onPressed: (){
              setState(() {


                // containerHeight==150?containerHeight=0: containerHeight==150;
              });
            }, icon: Icon(widget.isExpanded?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined),)

          ],
        ),
        AnimatedContainer(
          duration: const Duration(microseconds: 100),
          height: widget.isExpanded?150:0,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Row(
                      children:  [
                        Text("${widget.rapidMatch.matchInfo!.matchDesc} ",style: CLTextStyle().subTitleTextStyle,),
                        Text("${widget.rapidMatch.matchInfo!.venueInfo!.ground}, ${widget.rapidMatch.matchInfo!.venueInfo!.city}",style: CLTextStyle().subTitleTextStyle,)
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
                                                "${widget.rapidMatch.matchInfo!.team1!.imageId}" +
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
                                  Text("${widget.rapidMatch.matchInfo!.team1!.teamSName} "),
                                  widget.rapidMatch.matchScore != null?   Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("${widget.rapidMatch.matchScore!.team1Score!.inngs1!.runs}-${widget.rapidMatch.matchScore!.team1Score!.inngs1!.wickets}"),
                                      Text(" ${widget.rapidMatch.matchScore!.team1Score!.inngs1!.overs}",style: CLTextStyle().subTitleTextStyle,),
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
                                              "${widget.rapidMatch.matchInfo!.team2!.imageId}" +
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
                                Text("${widget.rapidMatch.matchInfo!.team2!.teamSName}"),
                             widget.rapidMatch.matchScore != null?   Row(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                 Text(" ${widget.rapidMatch.matchScore!.team2Score!.inngs1!.runs}-${widget.rapidMatch.matchScore!.team2Score!.inngs1!.wickets}"),
                                 Text(" ${widget.rapidMatch.matchScore!.team2Score!.inngs1!.overs}",style: CLTextStyle().subTitleTextStyle,),
                               ],
                             ):const SizedBox()
                              ],
                              ),
                          ],
                        ),

                        Row(
                          children: [
                            const VerticalDivider(
                              width: 5,
                              color: Colors.grey,
                              thickness: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Column(
                                children:  [
                                  widget.rapidMatch.matchInfo!.state=="Live"?   Icon(Icons.do_not_disturb_on_total_silence,color: Colors.red,):SizedBox(),
                                  Text("${widget.rapidMatch.matchInfo!.state}"),
                                   Text("Start at:",style: CLTextStyle().subTitleTextStyle,),
                                  Text(  DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.rapidMatch.matchInfo!.startDate!) * 1000)).toString(),),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: dSize(.03),
                  ),
                  Text("${widget.rapidMatch.matchInfo!.stateTitle}"),
                ],),
            ),),
        )
      ],
    );
  }
}
