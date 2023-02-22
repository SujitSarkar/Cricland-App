import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

import '../../../home/model/rapid_model/recent_match_model.dart';

class FeaturedMatchTile extends StatelessWidget {
  final RapidMatch seriesMatch;
  const FeaturedMatchTile({
    Key? key,
    required this.seriesMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 20),
      decoration: BoxDecoration(
        color: PublicController.pc.toggleCardBg(),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                          ApiEndpoints.imageMidPoint +
                              "${seriesMatch.matchInfo!.team1!.imageId}" +
                              ApiEndpoints.imageLastPoint,
                          headers: ApiEndpoints.headers,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Text("${seriesMatch.matchInfo!.team1!.teamSName}",
                style: AppTextStyle().bodyTextStyle)
            ],
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Text("${seriesMatch.matchInfo!.status}",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style:AppTextStyle().boldBodyTextStyle.copyWith(
                        color: PublicController.pc
                            .togglePrimaryTextColor())),
                  Text("${seriesMatch.matchInfo!.matchDesc}",
                      textAlign: TextAlign.center,
                      style: AppTextStyle().paragraphTextStyle),
                ],
              ),
            ),
          ),
          
          Row(
            children: [
              Text("${seriesMatch.matchInfo!.team2!.teamSName}",
                style:AppTextStyle().bodyTextStyle),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          ApiEndpoints.imageMidPoint +
                              "${seriesMatch.matchInfo!.team2!.imageId}" +
                              ApiEndpoints.imageLastPoint,
                          headers: ApiEndpoints.headers,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
