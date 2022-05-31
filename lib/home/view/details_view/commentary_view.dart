import 'package:cricland/home/view/widgets/commentary_profile_card_tile.dart';
import 'package:cricland/more/view/widgets/card_tile.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentaryView extends StatefulWidget {
  const CommentaryView({Key? key}) : super(key: key);

  @override
  _CommentaryViewState createState() => _CommentaryViewState();
}

class _CommentaryViewState extends State<CommentaryView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MoreCard(
                child: CommentaryProfileCardTile(
                  title: 'DDDD',
                  onTap: () {},
                ),
              ),
              MoreCard(
                child: CommentaryProfileCardTile(
                  title: 'DDDD',
                  onTap: () {},
                ),
              ),
              MoreCard(
                child: CommentaryProfileCardTile(
                  title: 'DDDD',
                  onTap: () {},
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Over 11:",
                style: TextStyle(
                    fontSize: dSize(.04),
                    fontWeight: FontWeight.w500,
                    color: PublicController.pc.toggleTextColor()),
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey)),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Center(child: Text('wd')),
                              ),
                            ),
                          );
                        }),
                  ),
                  Text(
                    "=2",
                    style: TextStyle(
                        fontSize: dSize(.04),
                        fontWeight: FontWeight.w500,
                        color: PublicController.pc.toggleTextColor()),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Text("Commentary View"),
          ),
        ],
      ),
    );
  }
}
