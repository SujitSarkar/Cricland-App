import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/more/model/ranking_model.dart';
import 'package:cricland/more/view/icc_man_ranking/player_details/player_details.dart';
import 'package:cricland/public/variables/api_endpoint.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankingTile extends StatelessWidget {
  const RankingTile({Key? key, required this.model}) : super(key: key);
  final RankingModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Text('${model.rank}',
                      style: Style.titleStyle
                          .copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start)),
              Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(dSize(0.05)),
                        child: CachedNetworkImage(
                            imageUrl:
                                ApiEndpoint.imageUrl(model.faceImageId ?? ''),
                            httpHeaders: ApiEndpoint.header,
                            fit: BoxFit.fitWidth,
                            height: dSize(.1),
                            width: dSize(.1),
                            placeholder: (context, url) => Icon(Icons.image,
                                size: dSize(.01), color: Colors.grey)),
                      ),
                      SizedBox(width: dSize(.02)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(() => const PlayerDetailsPage(
                                      playerId: "6635",
                                    ));
                              },
                              child: Text('${model.name}',
                                  style: Style.titleStyle,
                                  textAlign: TextAlign.start)),
                          Text('${model.country}',
                              style: Style.titleStyle
                                  .copyWith(fontSize: dSize(.032)),
                              textAlign: TextAlign.start),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: Text('${model.rating}',
                style: Style.titleStyle.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center)),
      ],
    );
  }
}
