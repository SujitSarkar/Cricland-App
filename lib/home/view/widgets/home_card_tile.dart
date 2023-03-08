import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/view/details_view/home_details/home_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../IPL/view/series_screen.dart';
import '../../../public/controller/api_endpoints.dart';
import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';
import '../../model/rapid_model/recent_match_model.dart';
import 'package:cricland/public/widgets/app_text_style.dart';

class HomeCardTile extends StatefulWidget {
  final RapidMatch rapidMatch;

  const HomeCardTile({Key? key, required this.rapidMatch}) : super(key: key);

  @override
  State<HomeCardTile> createState() => _HomeCardTileState();
}

class _HomeCardTileState extends State<HomeCardTile> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const IPLPage()));
              },
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
                                "${widget.rapidMatch.matchInfo!.seriesId}" +
                                ApiEndpoints.imageLastPoint,
                            headers: ApiEndpoints.headers,
                          ),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.low),
                    ),
                  ),
                  SizedBox(width: 10,),
                  FittedBox(
                      child: Text("${widget.rapidMatch.matchInfo!.seriesName}",
                          style: AppTextStyle().boldBodyTextStyle)),
                ],
              ),
            ),
            FittedBox(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: Icon(isExpanded
                    ? Icons.keyboard_arrow_up_outlined
                    : Icons.keyboard_arrow_down_outlined,color: PublicController.pc.toggleLoadingColor()),
              ),
            )
          ],
        ),
        AnimatedContainer(
          duration: const Duration(microseconds: 100),
          height: isExpanded ? 150 : 0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeDetailsScreen(
                    rapidMatch: widget.rapidMatch,
                  ),
                ),
              );
            },
            child: Card(
              color: PublicController.pc.toggleCardBg(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: Text("${widget.rapidMatch.matchInfo!.matchDesc} ${widget.rapidMatch.matchInfo!.venueInfo!.ground}, ${widget.rapidMatch.matchInfo!.venueInfo!.city} ",
                              style: AppTextStyle().paragraphTextStyle.copyWith(
                                  color:
                                  PublicController.pc.toggleLoadingColor())),
                        ),const RotationTransition(
                            turns: AlwaysStoppedAnimation(45/360),
                            child: Icon(Icons.push_pin,color: Colors.grey,))

                      ],
                    ),
                    SizedBox(
                      height: dSize(.03),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
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
                                                    "${widget.rapidMatch.matchInfo!.team1!.imageId}" +
                                                    ApiEndpoints.imageLastPoint,
                                                headers: ApiEndpoints.headers,
                                              ),
                                              fit: BoxFit.fill,
                                              filterQuality: FilterQuality.low),
                                        ),
                                      ),
                                      SizedBox(width: dSize(.02)),
                                      Text(
                                          "${widget.rapidMatch.matchInfo!.team1!.teamSName} ",
                                          style: AppTextStyle()
                                              .bodyTextStyle
                                              .copyWith(
                                                  color: PublicController.pc
                                                      .toggleLoadingColor())),
                                      widget.rapidMatch.matchScore != null
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                    "${widget.rapidMatch.matchScore!.team1Score!.inngs1!.runs}-${widget.rapidMatch.matchScore!.team1Score!.inngs1!.wickets}",
                                                    style: AppTextStyle()
                                                        .bodyTextStyle
                                                        .copyWith(
                                                            color: PublicController
                                                                .pc
                                                                .toggleLoadingColor())),
                                                Text(
                                                    " ${widget.rapidMatch.matchScore!.team1Score!.inngs1!.overs}",
                                                    style: AppTextStyle()
                                                        .paragraphTextStyle
                                                        .copyWith(
                                                            color: PublicController
                                                                .pc
                                                                .toggleLoadingColor())),
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
                                                  "${widget.rapidMatch.matchInfo!.team2!.imageId}" +
                                                  ApiEndpoints.imageLastPoint,
                                              headers: ApiEndpoints.headers,
                                            ),
                                            fit: BoxFit.fill,
                                            filterQuality: FilterQuality.low),
                                      ),
                                    ),
                                    SizedBox(width: dSize(.02)),
                                    Text(
                                        "${widget.rapidMatch.matchInfo!.team2!.teamSName}",
                                        style: AppTextStyle()
                                            .bodyTextStyle
                                            .copyWith(
                                                color: PublicController.pc
                                                    .toggleLoadingColor())),
                                    widget.rapidMatch.matchScore != null
                                        ? Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  " ${widget.rapidMatch.matchScore!.team2Score!.inngs1!.runs}-${widget.rapidMatch.matchScore!.team2Score!.inngs1!.wickets}",
                                                  style: AppTextStyle()
                                                      .bodyTextStyle
                                                      .copyWith(
                                                          color: PublicController
                                                              .pc
                                                              .toggleLoadingColor())),
                                              Text(
                                                  " ${widget.rapidMatch.matchScore!.team2Score!.inngs1!.overs}",
                                                  style: AppTextStyle()
                                                      .paragraphTextStyle
                                                      .copyWith(
                                                          color: PublicController
                                                              .pc
                                                              .toggleLoadingColor())),
                                            ],
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            width: 1,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Flexible(
                            flex: 2,
                            child: FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Column(
                                      children: [
                                        widget.rapidMatch.matchInfo!.state == "Live"
                                            ? const Icon(
                                                Icons
                                                    .do_not_disturb_on_total_silence,
                                                color: Colors.red,
                                              )
                                            :

                                        widget.rapidMatch.matchInfo!.state == "Upcoming"
                                            ?   Column(
                                          children: [
                                            Text("Starting at:",
                                                style: AppTextStyle()
                                                    .paragraphTextStyle
                                                    .copyWith(
                                                        color: PublicController.pc
                                                            .toggleLoadingColor())),
                                            Text(
                                                DateFormat('hh:mm a')
                                                    .format(DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                    int.parse(widget
                                                        .rapidMatch
                                                        .matchInfo!
                                                        .startDate!) *
                                                        1000))
                                                    .toString(),
                                                style: AppTextStyle()
                                                    .bodyTextStyle
                                                    .copyWith(
                                                    color: PublicController.pc
                                                        .toggleLoadingColor())),
                                          ],
                                        ):Container(
                                          width:dSize(.4),
                                          child: Text(
                                              "${widget.rapidMatch.matchInfo!.status}",
                                              style: AppTextStyle()
                                                  .bodyTextStyle
                                                  .copyWith(
                                                  color: PublicController.pc
                                                      .toggleLoadingColor())),
                                        ),

                                      ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: dSize(.03),
                    ),
                    Text("${widget.rapidMatch.matchInfo!.stateTitle}",
                        style: AppTextStyle().bodyTextStyle.copyWith(
                            color: PublicController.pc.toggleLoadingColor())),
                  ],
                ),
              ),
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
