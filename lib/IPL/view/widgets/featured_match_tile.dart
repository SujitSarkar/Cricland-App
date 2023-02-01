import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

class FeaturedMatchTile extends StatelessWidget {
  final String leadingUrlOne;
  final String leadingUrlTwo;
  final String teamOne;
  final String teamTwo;
  final String wonTeam;
  final String state;
  final Function() onTap;
  const FeaturedMatchTile({
    Key? key,
    required this.onTap,
    required this.leadingUrlOne,
    required this.leadingUrlTwo,
    required this.teamOne,
    required this.teamTwo,
    required this.wonTeam,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
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
                                      leadingUrlOne +
                                      ApiEndpoints.imageLastPoint,
                                  headers: ApiEndpoints.headers,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Text(teamOne,
                          style: CLTextStyle().nameTextStyle.copyWith(
                            fontSize: dSize(.04),
                            color: PublicController.pc.toggleTextColor(),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 100,
                        child: Text(wonTeam,
                            textAlign: TextAlign.center,
                            style: CLTextStyle().nameTextStyle.copyWith(
                              fontSize: dSize(.03),
                              color: PublicController.pc.toggleTextColor(),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(teamTwo,
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
                                      leadingUrlTwo +
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
            Positioned(
                top: -10,
                left: MediaQuery.of(context).size.width * .3,
                right: MediaQuery.of(context).size.width * .3,
                child: Container(
                  height: 20,
                  width: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.pink,
                  ),
                  child: Center(
                    child: Text(state,
                        style: CLTextStyle().nameTextStyle.copyWith(
                          fontSize: dSize(.03),
                          color: PublicController.pc.toggleCardBg(),
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
