import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/more/model/team_ranking_model.dart';
import 'package:cricland/public/variables/api_endpoint.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/variables/style.dart';
import 'package:flutter/material.dart';

class TeamRankingTile extends StatelessWidget {
  const TeamRankingTile({Key? key, required this.model}) : super(key: key);
  final TeamRankingModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Text('${model.rank}',
                      style: Style.titleStyle, textAlign: TextAlign.start)),
              Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                          imageUrl: ApiEndpoint.imageUrl(model.imageId!),
                          httpHeaders: ApiEndpoint.header,
                          fit: BoxFit.fill,
                          height: dSize(.05),
                          width: dSize(.07),
                          placeholder: (context, url) => Icon(Icons.image,
                              size: dSize(.06), color: Colors.grey)),
                      SizedBox(width: dSize(.02)),
                      Expanded(
                          child: Text('${model.name}',
                              style: Style.titleStyle,
                              textAlign: TextAlign.start)),
                    ],
                  )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Text('${model.matches}',
                      style: Style.titleStyle, textAlign: TextAlign.center)),
              Expanded(
                  child: Text('${model.points}',
                      style: Style.titleStyle, textAlign: TextAlign.center)),
              Expanded(
                child: Text('${model.rating}',
                    style: Style.titleStyle, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
