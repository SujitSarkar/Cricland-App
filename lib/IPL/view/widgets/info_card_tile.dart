import 'package:cricland/home/model/custom_widget/constants.dart';
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
    return Card(
      color: PublicController.pc.toggleCardBg(),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Text("Series",
                  style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  )),
              title: Text(series!,
                  style: CLTextStyle.paragraphTextStyle.copyWith(
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  )),
            ),
            Divider(),
            ListTile(
              leading: Text("Duration",
                  style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  )),
              title: Text(duration!,
                  style: CLTextStyle.paragraphTextStyle.copyWith(
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  )),
            ),
            Divider(),
            ListTile(
              leading: Text("Format",
                  style: CLTextStyle.paragraphHeadLineTextStyle.copyWith(
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  )),
              trailing: Text(format!,
                  style: CLTextStyle.paragraphTextStyle.copyWith(
                    fontSize: dSize(.04),
                    color: PublicController.pc.toggleTextColor(),
                  )),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
