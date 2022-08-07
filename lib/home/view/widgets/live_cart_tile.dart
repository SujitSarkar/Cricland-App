import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricland/home/constants.dart';
import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as http;
import '../../controller/home_controller.dart';

class LiveCardTile extends StatefulWidget {
  const LiveCardTile({
    Key? key,
    required this.title,
    required this.leadingTeamUrl,
    required this.trailingTeamUrl,
    required this.leadingCountryName,
    required this.trailingCountryName,
    required this.leadingRuns,
    required this.trailingRuns,
    required this.leadingOvers,
    required this.trailingOvers,
    required this.needText,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String leadingTeamUrl;
  final String trailingTeamUrl;
  final String leadingCountryName;
  final String trailingCountryName;
  final String leadingRuns;
  final String trailingRuns;
  final String leadingOvers;
  final String trailingOvers;
  final String needText;
  final Function() onTap;

  @override
  State<LiveCardTile> createState() => _LiveCardTileState();
}

class _LiveCardTileState extends State<LiveCardTile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return GestureDetector(
        onTap: widget.onTap,
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
                      widget.title,
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
                              ApiEndpoints.baseURL +
                                  ApiEndpoints.imageMidPoint +
                                  widget.leadingTeamUrl +
                                  ApiEndpoints.imageLastPoint,
                              headers: ApiEndpoints.headers,
                            )),
                          ),
                        ),
                        Text(
                          widget.leadingCountryName,
                          style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor()),
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: widget.leadingRuns,
                                style: TextStyle(
                                    fontSize: dSize(.03),
                                    fontWeight: FontWeight.w500,
                                    color:
                                        PublicController.pc.toggleTextColor()),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: widget.leadingOvers,
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
                            const Icon(
                              Icons.sports_cricket_outlined,
                              color: Colors.red,
                            )
                          ],
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
                        Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.circleDot,
                              size: 10,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Live",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
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
                              ApiEndpoints.baseURL +
                                  ApiEndpoints.imageMidPoint +
                                  widget.trailingTeamUrl +
                                  ApiEndpoints.imageLastPoint,
                              headers: ApiEndpoints.headers,
                            )),
                          ),
                        ),
                        Text(
                          widget.trailingCountryName,
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
                                text: widget.trailingRuns,
                                style: TextStyle(
                                    fontSize: dSize(.03),
                                    fontWeight: FontWeight.w500,
                                    color:
                                        PublicController.pc.toggleTextColor()),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: widget.trailingOvers,
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
                Center(
                  child: Text(
                    widget.needText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<String> function() async {
    return 'abc';
  }
}
