import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: PublicController.pc.toggleCardBg(),
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
                    fontSize: dSize(.035),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3),
                    child: Text(
                      trailingWidget!,
                      style: TextStyle(
                        fontSize: dSize(.025),
                        fontWeight: FontWeight.w500,
                        color: PublicController.pc.toggleTextColor(),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                height: 1,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      leftCountryURL!,
                      height: dSize(.1),
                      width: dSize(.1),
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 5,
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
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'VS',
                      style: TextStyle(
                        fontSize: dSize(.03),
                        color: PublicController.pc.toggleCardBg(),
                      ),
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
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      rightCountryURL!,
                      height: dSize(.1),
                      width: dSize(.1),
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              wonStatus!,
              style: TextStyle(
                fontSize: dSize(.03),
                fontWeight: FontWeight.w500,
                color: PublicController.pc.toggleTextColor(),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: onTap,
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
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
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
            )
          ],
        ),
      ),
    );
  }
}
