import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';

// Widget LiveCart(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     child: Card(
//       elevation: 5,
//       color: AllColor.lightCardColor,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Indian Premium League",
//                   style: CLTextStyle.CLSubHeaderSecondery,
//                 )),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(
//                   children: [
//                     Image.asset(
//                       'assets/indian_flag.png',
//                       scale: 4,
//                     ),
//                     Text('India'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     const Text(
//                       '  VS',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           FontAwesomeIcons.circleDot,
//                           size: 15,
//                           color: Colors.red,
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           "Live",
//                           style: TextStyle(
//                               color: Colors.red,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.asset(
//                       'assets/bd_flag.png',
//                       scale: 10,
//                     ),
//                     Text('Bangladesh')
//                   ],
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         text: '140-5',
//                         style: DefaultTextStyle.of(context)
//                             .style
//                             .copyWith(fontWeight: FontWeight.bold),
//                         children: const <TextSpan>[
//                           TextSpan(
//                               text: ' 16.3',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.normal, fontSize: 12)),
//                           // TextSpan(text: ' world!'),
//                         ],
//                       ),
//                     ),
//                     const Icon(
//                       Icons.sports_cricket_outlined,
//                       color: Colors.red,
//                     )
//                   ],
//                 ),
//                 const Text(
//                   "7 Runs need to be win",
//                   style: TextStyle(
//                       color: Colors.green, fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         text: '140-5',
//                         style: DefaultTextStyle.of(context)
//                             .style
//                             .copyWith(fontWeight: FontWeight.bold),
//                         children: const <TextSpan>[
//                           TextSpan(
//                             text: ' 16.3',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal, fontSize: 12),
//                           ),
//                           // TextSpan(text: ' world!'),
//                         ],
//                       ),
//                     ),
//                     const Icon(
//                       Icons.sports_cricket_outlined,
//                       color: Colors.red,
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

class LiveCardTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
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
                        Image.network(
                          leadingTeamUrl,
                          height: 50,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          leadingCountryName,
                          style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor()),
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: leadingRuns,
                                style: TextStyle(
                                    fontSize: dSize(.03),
                                    fontWeight: FontWeight.w500,
                                    color:
                                        PublicController.pc.toggleTextColor()),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: leadingOvers,
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
                        Image.network(
                          trailingTeamUrl,
                          height: 50,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          trailingCountryName,
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
                                text: trailingRuns,
                                style: TextStyle(
                                    fontSize: dSize(.03),
                                    fontWeight: FontWeight.w500,
                                    color:
                                        PublicController.pc.toggleTextColor()),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: trailingOvers,
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
                    needText,
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
}
