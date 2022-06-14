import 'package:cricland/home/view/widgets/projection_card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_sheet_view_card_tile.dart';

class ProgressBottomSheet extends StatefulWidget {
  const ProgressBottomSheet({Key? key}) : super(key: key);

  @override
  _ProgressBottomSheetState createState() => _ProgressBottomSheetState();
}

class _ProgressBottomSheetState extends State<ProgressBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PublicController.pc.toggleCardBg(),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 40,
                child: Divider(
                  height: 2,
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Real-time Win Probability",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.04),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                  Text(
                    "Close",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.035),
                      color: PublicController.pc.toggleTextColor(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 2,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Select a view of your choice",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.045),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              BottomSheetView(
                title: '',
                onTap: () {},
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Realtime Score Projection",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
              ),
              ProjectionCardTile(
                onTap: () {},
                title: 'Mid Ov Score Projection',
                leading: "Ov Runs",
              ),
              SizedBox(
                height: 10,
              ),
              ProjectionCardTile(
                onTap: () {},
                title: 'Full Match Score Projection',
                leading: "50 Ov Runs",
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
