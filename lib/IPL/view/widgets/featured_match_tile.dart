import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.purple),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
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
                    height: 40,
                    width: 40,
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
                    style: CLTextStyle().nameTextStyle.copyWith(
                      fontSize: dSize(.04),
                      color: PublicController.pc.toggleTextColor(),
                    ))
              ],
            ),
            Column(
              children: [
                Text("${seriesMatch.matchInfo!.matchDesc}",
                    textAlign: TextAlign.center,
                    style: CLTextStyle().nameTextStyle.copyWith(
                      fontSize: dSize(.03),
                      color: PublicController.pc.toggleTextColor(),
                    )),
                FittedBox(
                  child: SizedBox(
                    width: 150,
                    child: Text("${seriesMatch.matchInfo!.status}",
                        textAlign: TextAlign.center,
                        style: CLTextStyle().nameTextStyle.copyWith(
                          fontSize: dSize(.02),
                          color: PublicController.pc.toggleTextColor(),
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("${seriesMatch.matchInfo!.team2!.teamSName}",
                    style: CLTextStyle().nameTextStyle.copyWith(
                      fontSize: dSize(.04),
                      color: PublicController.pc.toggleTextColor(),
                    )),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 40,
                    width: 40,
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
      ),
    );
  }
}
