import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';

import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderCardTile extends StatelessWidget {
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
  const SliderCardTile({
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: PublicController.pc.toggleCardBg(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: CLTextStyle.nameTextStyle.copyWith(
                        fontSize: dSize(.035),
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                    ApiEndpoints.imageMidPoint +
                                        leftCountryURL! +
                                        ApiEndpoints.imageLastPoint,
                                    headers: ApiEndpoints.headers,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                leftCountryName!,
                                style: CLTextStyle.nameTextStyle.copyWith(
                                  fontSize: dSize(.035),
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                leftCountryRuns!,
                                style: CLTextStyle.paragraphTextStyle.copyWith(
                                  fontSize: dSize(.035),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                leftCountryOvers!,
                                style: CLTextStyle.paragraphTextStyle.copyWith(
                                  fontSize: dSize(.025),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: dSize(.07)),
                        child: Text(
                          'VS',
                          style: TextStyle(
                            fontSize: dSize(.05),
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(rightCountryName!,
                                  style: CLTextStyle.nameTextStyle.copyWith(
                                    fontSize: dSize(.035),
                                    color:
                                        PublicController.pc.toggleTextColor(),
                                  )),
                              Text(
                                rightCountryRuns!,
                                style: CLTextStyle.paragraphTextStyle.copyWith(
                                  fontSize: dSize(.035),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                rightCountryOvers!,
                                style: CLTextStyle.paragraphTextStyle.copyWith(
                                  fontSize: dSize(.025),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                ApiEndpoints.imageMidPoint +
                                    rightCountryURL! +
                                    ApiEndpoints.imageLastPoint,
                                headers: ApiEndpoints.headers,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: Text(
                  wonStatus!,
                  style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
