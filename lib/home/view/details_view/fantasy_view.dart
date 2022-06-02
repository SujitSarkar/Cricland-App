import 'package:cricland/home/view/widgets/fantasy_profile_card.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class FantasyView extends StatefulWidget {
  const FantasyView({Key? key}) : super(key: key);

  @override
  _FantasyViewState createState() => _FantasyViewState();
}

class _FantasyViewState extends State<FantasyView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Top Fantasy Points',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: dSize(.04),
                  color: PublicController.pc.toggleTextColor(),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '     *  Live',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: dSize(.04),
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("See All"),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 15,
                )
              ],
            )
          ],
        ),
        Container(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return MoreCard(
                    child: FantasyProfileCardTile(
                  title: '',
                  onTap: () {},
                ));
              }),
        ),
      ],
    );
  }
}
