import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/home/view/widgets/finished_card_tile.dart';
import 'package:cricland/home/view/widgets/live_cart_tile.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class FinishedTabScreen extends StatefulWidget {
  const FinishedTabScreen({Key? key}) : super(key: key);

  @override
  _FinishedTabScreenState createState() => _FinishedTabScreenState();
}

class _FinishedTabScreenState extends State<FinishedTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            "Yesterday",
            style: TextStyle(
                fontSize: dSize(.045),
                fontWeight: FontWeight.w500,
                color: PublicController.pc.toggleTextColor()),
          ),
          SizedBox(
            height: 12,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return FinishedCardTile(
                onTap: () {},
                title: '',
              );
              //LiveCart(context);
            },
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            tileColor: PublicController.pc.toggleCardBg(),
            title: Text(
              "All Finished Matches",
              style: TextStyle(
                  fontSize: dSize(.045),
                  fontWeight: FontWeight.w500,
                  color: PublicController.pc.toggleTextColor()),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: PublicController.pc.toggleTextColor(),
            ),
          )
        ],
      ),
    );
  }
}
