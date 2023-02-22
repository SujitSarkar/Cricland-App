import 'package:cricland/more/model/package_model.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PremiumTile extends StatelessWidget {
  PremiumTile({Key? key, required this.model}) : super(key: key);
  final PackageModel model;

  double price = 0.0;
  double discountPercent = 0.0;

  @override
  Widget build(BuildContext context) {
    if (model.discountAmount != null) {
      price = model.packagePrice! - model.discountAmount!;
      discountPercent = (100 / (model.packagePrice! / model.discountAmount!));
    } else {
      price = model.packagePrice!;
    }
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: dSize(.04), vertical: dSize(.07)),
      decoration: BoxDecoration(
        color: Color(int.parse(model.colorCode!)).withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (model.discountAmount != null)
                Text('\$ ${model.packagePrice!}',
                    style: TextStyle(
                        color: PublicController.pc.toggleTextColor(),
                        fontSize: dSize(.045),
                        decoration: TextDecoration.lineThrough)),
              if (model.discountAmount != null)
                Container(
                  margin: EdgeInsets.only(left: dSize(.02)),
                  padding: EdgeInsets.symmetric(
                      horizontal: dSize(.015), vertical: dSize(.005)),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(int.parse(model.colorCode!)), width: 0.4),
                    borderRadius: BorderRadius.all(Radius.circular(dSize(.05))),
                  ),
                  child: Text('You save ${discountPercent.round()}%',
                      style: AppTextStyle().paragraphTextStyle.copyWith(
                          color: Color(int.parse(model.colorCode!)))),
                ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: dSize(.015), vertical: dSize(.005)),
                decoration: BoxDecoration(
                  color: Color(int.parse(model.colorCode!)),
                  borderRadius: BorderRadius.all(Radius.circular(dSize(.01))),
                ),
                child: Text('${model.packageName}',
                    style: AppTextStyle().paragraphTextStyle.copyWith(
                        color: AllColor.darkTextColor)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ $price',
                  style: TextStyle(
                      color: PublicController.pc.toggleTextColor(),
                      fontSize: dSize(.06),
                      fontWeight: FontWeight.bold)),
              Text('${model.packageDuration} Months',
                  style: TextStyle(
                      color: PublicController.pc.toggleTextColor(),
                      fontSize: dSize(.06),
                      fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
