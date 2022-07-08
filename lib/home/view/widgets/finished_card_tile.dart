import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/constants.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishedCardTile extends StatelessWidget {
  const FinishedCardTile({
    Key? key,
    required this.title,
    this.trailingWidget,
    this.leftCountryURL,
    this.rightCountryURL,
    this.leftCountryName,
    this.rightCountryName,
    this.leftCountryRuns,
    this.rightCountryRuns,
    this.leftCountryOvers,
    this.rightCountryOvers,
    this.wonStatus,
    required this.onTap,
    required this.onStaticTap,
  }) : super(key: key);
  final String title;
  final String? trailingWidget;
  final String? leftCountryURL;
  final String? rightCountryURL;
  final String? leftCountryName;
  final String? rightCountryName;
  final String? leftCountryRuns;
  final String? rightCountryRuns;
  final String? leftCountryOvers;
  final String? rightCountryOvers;
  final String? wonStatus;
  final Function() onTap;
  final Function() onStaticTap;

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
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: dSize(.04),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                            API.baseUrl +
                                API.imageMidPoint +
                                leftCountryURL! +
                                API.imageLastPoint,
                            headers: headers,
                          )),
                        ),
                      ),
                      Text(
                        leftCountryName!,
                        style: TextStyle(
                            fontSize: dSize(.04),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor()),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: leftCountryRuns,
                              style: TextStyle(
                                  fontSize: dSize(.03),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor()),
                              children: <TextSpan>[
                                TextSpan(
                                  text: leftCountryOvers,
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
                  Column(
                    children: [
                      Text(
                        '  VS',
                        style: TextStyle(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: dSize(.3),
                        child: Text(
                          wonStatus!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: dSize(.04),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                            API.baseUrl +
                                API.imageMidPoint +
                                rightCountryURL! +
                                API.imageLastPoint,
                            headers: headers,
                          )),
                        ),
                      ),
                      Text(
                        rightCountryName!,
                        style: TextStyle(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: rightCountryRuns,
                              style: TextStyle(
                                  fontSize: dSize(.03),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor()),
                              children: <TextSpan>[
                                TextSpan(
                                  text: rightCountryOvers,
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
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2 More Matches",
                    style: TextStyle(
                        fontSize: dSize(.03),
                        fontWeight: FontWeight.w500,
                        color: PublicController.pc.toggleTextColor()),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: PublicController.pc.toggleTextColor(),
                    size: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
