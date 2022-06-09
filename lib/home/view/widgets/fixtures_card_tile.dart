import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    this.wonTeam,
    this.byWon,
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
  final String? wonTeam;
  final String? byWon;
  final Function() onTap;

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
                              leadingUrlOne != null
                                  ? Image.asset(
                                      leadingUrlOne!,
                                      scale: 6,
                                    )
                                  : Image.asset(
                                      'assets/bd_flag.png',
                                      scale: 6,
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
                              Image.asset(
                                leadingUrlTwo!,
                                scale: 16,
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
                          wonTeam!,
                          style: TextStyle(
                            fontSize: dSize(.04),
                            fontWeight: FontWeight.w500,
                            color: PublicController.pc.toggleTextColor(),
                          ),
                        ),
                        Text(
                          byWon!,
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
