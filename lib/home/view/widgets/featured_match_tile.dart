import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../public/widgets/decoration.dart';
import '../../model/monk/live_response_data.dart';

class FeaturedMatchTile extends StatelessWidget {
  final LiveResponseData liveObjectData;
  const FeaturedMatchTile({
    Key? key,
    required this.liveObjectData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20),
          decoration: BoxDecoration(
            color: PublicController.pc.toggleCardBg(),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: AllColor.hintColor,
              width: 2.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                liveObjectData.localTeamImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Text(liveObjectData.localTeamName,
                      style: AppTextStyle().boldBodyTextStyle)
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Text(liveObjectData.status,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppTextStyle().bodyTextStyle.copyWith(
                              color: PublicController.pc
                                  .togglePrimaryTextColor())),
                      Text(liveObjectData.note,
                          textAlign: TextAlign.center,
                          style: AppTextStyle().bodyTextStyle),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(liveObjectData.visitorTeamName,
                      style: AppTextStyle().boldBodyTextStyle),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              liveObjectData.visitorTeamImage,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            left: -5,
            bottom: 0,
            top: 0,
            child: Center(
                child: RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                          width: dSize(1),
                          decoration: StDecoration()
                              .sliverAppbarGradient
                              .copyWith(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Text(
                              liveObjectData.round,
                              style: AppTextStyle()
                                  .bodyTextStyle
                                  .copyWith(color: Colors.white),
                            ),
                          )),
                    ))))
      ],
    );
  }
}
