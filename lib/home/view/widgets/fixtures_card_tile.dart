import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/constants.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FixturesCardTile extends StatelessWidget {
  const FixturesCardTile({
    Key? key,
    required this.onTap,
    this.leadingUrlOne,
    this.leadingUrlTwo,
    required this.title,
    this.teamOne,
    this.teamTwo,
    this.reachTitleOne,
    this.reachSubTitleOne,
    this.reachTitleTwo,
    this.reachSubTitleTwo,
    this.desc,
    this.date,
  }) : super(key: key);
  final String? title;
  final String? leadingUrlOne;
  final String? leadingUrlTwo;
  final String? teamOne;
  final String? teamTwo;
  final String? reachTitleOne;
  final String? reachSubTitleOne;
  final String? reachTitleTwo;
  final String? reachSubTitleTwo;
  final String? desc;
  final String? date;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    Map<String, String> headers = <String, String>{
      'X-RapidAPI-Key': '536bde874cmsh538ffe828f4e822p1aec59jsn3e00016f7daf',
      'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com',
    };
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: PublicController.pc.toggleCardBg(),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: title != null
                        ? Text(
                            title!,
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )
                        : null,
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                    ApiEndpoints.baseURL +
                                        ApiEndpoints.imageMidPoint +
                                        leadingUrlOne! +
                                        ApiEndpoints.imageLastPoint,
                                    headers: headers,
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    teamOne!,
                                    style: TextStyle(
                                        fontSize: dSize(.045),
                                        fontWeight: FontWeight.w500,
                                        color: PublicController.pc
                                            .toggleTextColor()),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: reachTitleOne,
                                      style: TextStyle(
                                          fontSize: dSize(.03),
                                          fontWeight: FontWeight.w500,
                                          color: PublicController.pc
                                              .toggleTextColor()),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: reachSubTitleOne,
                                          style: TextStyle(
                                              fontSize: dSize(.02),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor()),
                                        ),
                                        // TextSpan(text: ' world!'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                    ApiEndpoints.baseURL +
                                        ApiEndpoints.imageMidPoint +
                                        leadingUrlTwo! +
                                        ApiEndpoints.imageLastPoint,
                                    headers: headers,
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    teamTwo!,
                                    style: TextStyle(
                                        fontSize: dSize(.045),
                                        fontWeight: FontWeight.w500,
                                        color: PublicController.pc
                                            .toggleTextColor()),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: reachTitleTwo,
                                      style: TextStyle(
                                          fontSize: dSize(.03),
                                          fontWeight: FontWeight.w500,
                                          color: PublicController.pc
                                              .toggleTextColor()),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: reachSubTitleTwo,
                                          style: TextStyle(
                                              fontSize: dSize(.02),
                                              fontWeight: FontWeight.w500,
                                              color: PublicController.pc
                                                  .toggleTextColor()),
                                        ),
                                        // TextSpan(text: ' world!'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          desc!,
                          style: TextStyle(
                            fontSize: dSize(.04),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          date!,
                          style: TextStyle(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class LiveCard extends StatelessWidget {
//   const LiveCard({Key? key, required this.child}) : super(key: key);
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//           color: PublicController.pc.toggleCardBg(),
//           borderRadius: const BorderRadius.all(Radius.circular(8))),
//       child: child,
//     );
//   }
// }
