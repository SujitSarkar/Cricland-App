import 'package:cricland/home/view/details_view/League_details_screen.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

import '../../../public/widgets/app_text_style.dart';
import '../../model/monk/live_response_data.dart';

class MonkLiveTile extends StatefulWidget {
  final ScrollController scrollController;
  final LiveResponseData liveObjectData;
  final int liveIndex;
  final Function() onTap;
  const MonkLiveTile({
    Key? key,
    required this.liveObjectData,
    required this.liveIndex,
    required this.scrollController,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MonkLiveTile> createState() => _MonkLiveTileState();
}

class _MonkLiveTileState extends State<MonkLiveTile> {
  int? selectedIndex;
  double containerHeight = 160;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LeagueDetailsScreen(
                        liveObjectData: widget.liveObjectData,
                        scrollController: widget.scrollController,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.network(
                      widget.liveObjectData.leagueImage,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FittedBox(
                      child: Text(
                        widget.liveObjectData.leagueName,
                        style: AppTextStyle().titleTextBoldStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = widget.liveIndex;
                        if (containerHeight == 150) {
                          containerHeight = 0;
                        } else {
                          containerHeight = 150;
                        }
                      });

                      print(selectedIndex);
                    },
                    icon: Icon(selectedIndex == widget.liveIndex
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined),
                  ),
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(microseconds: 1000),
              height: selectedIndex == widget.liveIndex ? containerHeight : 160,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.liveObjectData.venueName,
                        style: AppTextStyle().bodyTextStyle,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    widget.liveObjectData.localTeamImage,
                                    height: 30,
                                    width: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      widget.liveObjectData.localTeamName,
                                      style: AppTextStyle().boldBodyTextStyle,
                                    ),
                                  ),
                                  Text(
                                      "${widget.liveObjectData.localTeamRun}-${widget.liveObjectData.localTeamWicket}",
                                      style: AppTextStyle().boldBodyTextStyle),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("${widget.liveObjectData.localTeamOver}",
                                      style: AppTextStyle().bodyTextStyle)
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Image.network(
                                    widget.liveObjectData.visitorTeamImage,
                                    height: 30,
                                    width: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      widget.liveObjectData.visitorTeamName,
                                      style: AppTextStyle().boldBodyTextStyle,
                                    ),
                                  ),
                                  Text(
                                      "${widget.liveObjectData.visitorTeamRun}-${widget.liveObjectData.visitorTeamWicket}",
                                      style: AppTextStyle().boldBodyTextStyle),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      "${widget.liveObjectData.visitorTeamOver}",
                                      style: AppTextStyle().bodyTextStyle)
                                ],
                              )
                            ],
                          ),
                          widget.liveObjectData.status != "NS" &&
                                  widget.liveObjectData.status != "Finished"
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .do_not_disturb_on_total_silence_outlined,
                                      color: AllColor.googleColor,
                                      size: dSize(.03),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: dSize(.01),
                                      ),
                                      child: Text(
                                        widget.liveObjectData.live,
                                        style: AppTextStyle()
                                            .bodyTextStyle
                                            .copyWith(
                                              color: AllColor.googleColor,
                                            ),
                                      ),
                                    )
                                  ],
                                )
                              : Container(
                                  width: dSize(.2),
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    widget.liveObjectData.status,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          widget.liveObjectData.note,
                          style: AppTextStyle()
                              .bodyTextStyle
                              .copyWith(color: AllColor.goldenColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
