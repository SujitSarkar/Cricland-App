import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
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
                    style: CLTextStyle.nameTextStyle.copyWith(
                      fontSize: dSize(.04),
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
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                ApiEndpoints.imageMidPoint +
                                    leftCountryURL! +
                                    ApiEndpoints.imageLastPoint,
                                headers: ApiEndpoints.headers,
                              ),
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.low),
                        ),
                      ),
                      Text(
                        leftCountryName!,
                        style: CLTextStyle.nameTextStyle.copyWith(
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: leftCountryRuns,
                              style: CLTextStyle.paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: leftCountryOvers,
                                  style:
                                      CLTextStyle.paragraphTextStyle.copyWith(
                                    fontSize: dSize(.02),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
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
                          style: CLTextStyle.paragraphTextStyle.copyWith(
                            fontSize: dSize(.03),
                            color: PublicController.pc.toggleTextColor(),
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
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                ApiEndpoints.imageMidPoint +
                                    rightCountryURL! +
                                    ApiEndpoints.imageLastPoint,
                                headers: ApiEndpoints.headers,
                              ),
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.low),
                        ),
                      ),
                      Text(
                        rightCountryName!,
                        style: CLTextStyle.nameTextStyle.copyWith(
                          fontSize: dSize(.04),
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: rightCountryRuns,
                              style: CLTextStyle.paragraphTextStyle.copyWith(
                                fontSize: dSize(.03),
                                color: PublicController.pc.toggleTextColor(),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: rightCountryOvers,
                                  style:
                                      CLTextStyle.paragraphTextStyle.copyWith(
                                    fontSize: dSize(.02),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  ),
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
                    style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                      fontSize: dSize(.03),
                      color: PublicController.pc.toggleTextColor(),
                    ),
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
