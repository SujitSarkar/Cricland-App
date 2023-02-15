import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';

class InfoCardTile extends StatelessWidget {
  final String? series;
  final String? duration;
  final String? format;

  final Function() onTap;
  const InfoCardTile({
    Key? key,
    required this.onTap,
    this.series,
    this.duration,
    required this.format,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
        fontSize: dSize(.032), color: PublicController.pc.toggleTextColor());
    return Card(
      color: PublicController.pc.toggleCardBg(),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text("Series",
                    style:_textStyle.copyWith(
                      fontSize: dSize(.035),
                      fontWeight: FontWeight.bold,
                      color: PublicController.pc
                          .toggleLoadingColor(),),),
                ),
                Flexible(
                  flex: 4,
                  child: Text(series!,
                    style:_textStyle.copyWith(
                      fontSize: dSize(.03),
                      fontWeight: FontWeight.bold,
                      color: PublicController.pc
                          .toggleLoadingColor(),),),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text("Duration",
                    style:_textStyle.copyWith(
                      fontSize: dSize(.035),
                      fontWeight: FontWeight.bold,
                      color: PublicController.pc
                          .toggleLoadingColor(),),),
                ),
                Flexible(
                  flex: 4,
                  child: Text(duration!,
                    style:_textStyle.copyWith(
                      fontSize: dSize(.03),
                      fontWeight: FontWeight.bold,
                      color: PublicController.pc
                          .toggleLoadingColor(),),),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text("Format",
                    style:_textStyle.copyWith(
                      fontSize: dSize(.035),
                      fontWeight: FontWeight.bold,
                      color: PublicController.pc
                          .toggleLoadingColor(),),),
                ),
                Flexible(
                  flex: 4,
                  child: Text(format!,
                    style:_textStyle.copyWith(
                      fontSize: dSize(.03),
                      fontWeight: FontWeight.bold,
                      color: PublicController.pc
                          .toggleLoadingColor(),),),
                ),
              ],
            ),
            // ListTile(
            //   leading: Text("Series",
            //       style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
            //         fontSize: dSize(.04),
            //         color: PublicController.pc.toggleTextColor(),
            //       )),
            //   trailing: Text(series!,
            //       style: CLTextStyle().paragraphTextStyle.copyWith(
            //         fontSize: dSize(.04),
            //         color: PublicController.pc.toggleTextColor(),
            //       )),
            // ),
            // Divider(),
            // ListTile(
            //   leading: Text("Duration",
            //       style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
            //         fontSize: dSize(.04),
            //         color: PublicController.pc.toggleTextColor(),
            //       )),
            //   trailing: Text(duration!,
            //       style: CLTextStyle().paragraphTextStyle.copyWith(
            //         fontSize: dSize(.04),
            //         color: PublicController.pc.toggleTextColor(),
            //       )),
            // ),
            // Divider(),
            // ListTile(
            //   leading: Text("Format",
            //       style: CLTextStyle().paragraphHeadLineTextStyle.copyWith(
            //         fontSize: dSize(.04),
            //         color: PublicController.pc.toggleTextColor(),
            //       )),
            //   trailing: Text(format!,
            //       style: CLTextStyle().paragraphTextStyle.copyWith(
            //         fontSize: dSize(.04),
            //         color: PublicController.pc.toggleTextColor(),
            //       )),
            // ),
            // Divider(),
          ],
        ),
      ),
    );
  }
}
