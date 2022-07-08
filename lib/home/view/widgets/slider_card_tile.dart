import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/constants.dart';
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
    Map<String, String> headers = <String, String>{
      'X-RapidAPI-Key': '536bde874cmsh538ffe828f4e822p1aec59jsn3e00016f7daf',
      'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com',
    };
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
                      style: TextStyle(
                        fontSize: dSize(.035),
                        fontWeight: FontWeight.w500,
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    API.baseUrl +
                                        API.imageMidPoint +
                                        leftCountryURL! +
                                        API.imageLastPoint,
                                    headers: headers,
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
                                style: TextStyle(
                                  fontSize: dSize(.035),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                leftCountryRuns!,
                                style: TextStyle(
                                  fontSize: dSize(.035),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                leftCountryOvers!,
                                style: TextStyle(
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
                              Text(
                                rightCountryName!,
                                style: TextStyle(
                                  fontSize: dSize(.035),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                rightCountryRuns!,
                                style: TextStyle(
                                  fontSize: dSize(.035),
                                  fontWeight: FontWeight.w500,
                                  color: PublicController.pc.toggleTextColor(),
                                ),
                              ),
                              Text(
                                rightCountryOvers!,
                                style: TextStyle(
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
                                API.baseUrl +
                                    API.imageMidPoint +
                                    rightCountryURL! +
                                    API.imageLastPoint,
                                headers: headers,
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
              Text(
                wonStatus!,
                style: TextStyle(
                  fontSize: dSize(.04),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: GestureDetector(
                  onTap: onStaticTap,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                      child: Text(
                        "Live Statistic",
                        style: TextStyle(
                          fontSize: dSize(.035),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
