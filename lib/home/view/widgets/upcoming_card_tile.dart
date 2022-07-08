import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/constants.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpcomingCardTile extends StatelessWidget {
  const UpcomingCardTile({
    Key? key,
    required this.title,
    required this.leftCountryURL,
    required this.leftCountryName,
    required this.rightCountryURL,
    required this.rightCountryName,
    required this.startTime,
    required this.status,
    required this.onTap,
    this.trailingWidget,
  }) : super(key: key);

  final String title;
  final String? leftCountryURL;
  final String? rightCountryURL;
  final String? leftCountryName;
  final String? rightCountryName;
  final Widget? trailingWidget;
  final String? startTime;
  final String? status;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    print(status);
    Map<String, String> headers = <String, String>{
      'X-RapidAPI-Key': '536bde874cmsh538ffe828f4e822p1aec59jsn3e00016f7daf',
      'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com',
    };

    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(startTime!) * 1000);

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
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: dSize(.04),
                      fontWeight: FontWeight.w500,
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                  Icon(
                    Icons.notifications_active_outlined,
                    color: PublicController.pc.toggleTextColor(),
                  )
                ],
              ),
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
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        leftCountryName!,
                        style: TextStyle(
                            fontSize: dSize(.04),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor()),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '  VS',
                        style: TextStyle(
                            fontSize: dSize(.04),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        status!,
                        style: TextStyle(
                            fontSize: dSize(.035),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                                color: PublicController.pc.toggleTextColor(),
                                width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Start At : ",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: dSize(.035),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat('hh:mm a').format(dt).toString(),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: dSize(.03),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
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
                              ),
                              fit: BoxFit.cover),
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
                    ],
                  )
                ],
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
