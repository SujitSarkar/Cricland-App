import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

class FeaturedMatchTile extends StatelessWidget {
  const FeaturedMatchTile({
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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.purple),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/t20.png',
                            height: 30,
                            width: 30,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            "GT",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "GT Won",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                          Text(
                            "by 7 wickets",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "RCB",
                            style: TextStyle(
                              fontSize: dSize(.04),
                              fontWeight: FontWeight.w500,
                              color: PublicController.pc.toggleTextColor(),
                            ),
                          ),
                          Image.asset(
                            'assets/t20.png',
                            height: 30,
                            width: 30,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: 30,
                left: -30,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(270 / 360),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.pink),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          Text(
                            "Final",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
