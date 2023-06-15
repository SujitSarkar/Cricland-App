import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../public/controller/public_controller.dart';
import '../../../public/variables/config.dart';

class MatchCardTile extends StatelessWidget {
  const MatchCardTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
            elevation: 0.0,
            color: PublicController.pc.toggleCardBg(),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Row(
                          children: [
                            Text("matchDesc ",
                                style: AppTextStyle().boldBodyTextStyle),
                            Text("city",
                                style: AppTextStyle().boldBodyTextStyle)
                          ],
                        ),
                      ),
                      SizedBox(height: dSize(.03)),
                      IntrinsicHeight(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(children: [
                                        Container(
                                            height: dSize(.05),
                                            width: dSize(.05),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/bd_logo.png"),
                                                  fit: BoxFit.fill,
                                                  filterQuality:
                                                      FilterQuality.low),
                                            )),
                                        SizedBox(width: dSize(.02)),
                                        Text("teamSName "),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text("runs-wickets",
                                                  style: AppTextStyle()
                                                      .boldBodyTextStyle),
                                              Text("overs",
                                                  style: AppTextStyle()
                                                      .paragraphTextStyle),
                                            ])
                                      ])),
                                  Row(children: [
                                    Container(
                                        height: dSize(.05),
                                        width: dSize(.05),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/indian_flag.png"),
                                              fit: BoxFit.fill,
                                              filterQuality: FilterQuality.low),
                                        )),
                                    SizedBox(width: dSize(.02)),
                                    Text("teamSName",
                                        style:
                                            AppTextStyle().boldBodyTextStyle),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(" runs-.wickets",
                                              style: AppTextStyle()
                                                  .boldBodyTextStyle),
                                          Text(" overs",
                                              style: AppTextStyle()
                                                  .paragraphTextStyle),
                                        ])
                                  ])
                                ]),
                            Row(children: [
                              const VerticalDivider(
                                width: 2,
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              SizedBox(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Text(
                                  "status",
                                  style: AppTextStyle().paragraphTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ])
                          ]))
                    ]))));
  }
}
