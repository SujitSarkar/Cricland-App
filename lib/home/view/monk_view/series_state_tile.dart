import 'package:flutter/material.dart';

import '../../../public/controller/public_controller.dart';
import '../../../public/variables/colors.dart';
import '../../../public/variables/config.dart';
import '../../../public/widgets/app_text_style.dart';

class SeriesStateTile extends StatelessWidget {
  const SeriesStateTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      decoration: BoxDecoration(
        color: PublicController.pc.toggleCardBg(),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/bd_flag.png",
                    height: dSize(.1),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("BD", style: AppTextStyle().boldBodyTextStyle),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "0",
                        style: AppTextStyle().largeTitleBoldStyle.copyWith(
                            fontSize: dSize(
                              .1,
                            ),
                            color: AllColor.purpleColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          "-",
                          style: AppTextStyle().largeTitleBoldStyle.copyWith(
                              fontSize: dSize(
                                .1,
                              ),
                              color: AllColor.goldenColor),
                        ),
                      ),
                      Text(
                        "0",
                        style: AppTextStyle().largeTitleBoldStyle.copyWith(
                            fontSize: dSize(
                              .1,
                            ),
                            color: AllColor.goldenColor),
                      ),
                    ],
                  ),
                  Text("0/1 Played", style: AppTextStyle().bodyTextStyle)
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/indian_flag.png",
                    height: dSize(.1),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("India", style: AppTextStyle().boldBodyTextStyle),
                ],
              ),
            ],
          ),
          const Divider(),
          Text("Test Series hasn't started yet!",
              style: AppTextStyle().bodyTextStyle),
        ],
      ),
    );
  }
}
