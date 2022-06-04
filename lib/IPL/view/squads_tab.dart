import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/material.dart';

class SquadsTab extends StatefulWidget {
  const SquadsTab({Key? key}) : super(key: key);

  @override
  _SquadsTabState createState() => _SquadsTabState();
}

class _SquadsTabState extends State<SquadsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                      horizontalTitleGap: 2.0,
                      leading: Image.asset('assets/t20.png'),
                      trailing: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: PublicController.pc.toggleTextColor(),
                        size: 20,
                      ),
                      title: Text(
                        "Mumbai Indians",
                        style: TextStyle(
                          fontSize: dSize(.04),
                          fontWeight: FontWeight.w500,
                          color: PublicController.pc.toggleTextColor(),
                        ),
                      )),
                  Divider(),
                ],
              );
            }),
        Container(
          child: Text(
            "Squads",
            style: TextStyle(
              fontSize: dSize(.04),
              fontWeight: FontWeight.w500,
              color: PublicController.pc.toggleTextColor(),
            ),
          ),
        ),
      ],
    );
  }
}
