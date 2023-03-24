import 'package:cricland/home/controller/home_controller.dart';
import 'package:cricland/public/widgets/app_text_style.dart';
import 'package:cricland/public/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cricland/public/controller/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:cricland/public/controller/api_service.dart';
import '../../../model/monk/monk_league_model.dart';
import '../../../model/monk/monk_live_model.dart';
import '../../../model/monk/monk_team_model.dart';
import '../../../model/monk/monk_vanue_model.dart';

class LiveTabScreen extends StatefulWidget {
  final  ScrollController scrollController;
  const LiveTabScreen({Key? key,required this.scrollController}) : super(key: key);

  @override
  _LiveTabScreenState createState() => _LiveTabScreenState();
}

class _LiveTabScreenState extends State<LiveTabScreen> {
  int? selectedIndex;
  double containerHeight = 150;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            print(notification.metrics.pixels);

            if(notification.metrics.pixels>50){
              homeController.setScroll(true.obs);
            }else{
              homeController.setScroll(false.obs);
            }
            return true;
          },
          child: SingleChildScrollView(
            controller: widget.scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                FutureBuilder(
                    future: homeController.getLive(),
                    builder:
                        (context, AsyncSnapshot<List<MonkLive>> liveSnapshot) {
                      if (liveSnapshot.hasData) {
                        return liveSnapshot.data!.isEmpty
                            ? Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                  child:
                                      Text("There are currently no live matches",style: AppTextStyle().bodyTextStyle,)),
                            )
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: liveSnapshot.data!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  print( "ID : ${liveSnapshot.data![index].id}");
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        FutureBuilder(
                                            future: homeController.getVenue(
                                                liveSnapshot
                                                    .data![index].league_id
                                                    .toString()),
                                            builder: (context,
                                                AsyncSnapshot<MonkVanue>
                                                    venueSnapshot) {
                                              if (venueSnapshot.hasData) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.network(
                                                          venueSnapshot
                                                              .data!.image_path!,
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                        Text(
                                                            "${venueSnapshot.data!.name}, ${venueSnapshot.data!.city}"),
                                                      ],
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          selectedIndex = index;

                                                          // containerHeight==150?containerHeight=0: containerHeight==150;
                                                        });
                                                      },
                                                      icon: Icon(selectedIndex ==
                                                              index
                                                          ? Icons
                                                              .keyboard_arrow_up_outlined
                                                          : Icons
                                                              .keyboard_arrow_down_outlined),
                                                    )
                                                  ],
                                                );
                                              } else {
                                                return const LoadingWidget();
                                              }
                                            }),
                                        AnimatedContainer(
                                          duration:
                                              const Duration(microseconds: 100),
                                          height: selectedIndex == index
                                              ? containerHeight
                                              : 0,
                                          child: Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            // FutureBuilder(
                                                            //     future: homeController
                                                            //         .getTeam(liveSnapshot
                                                            //             .data![
                                                            //                 index]
                                                            //             .localteam_id
                                                            //             .toString()),
                                                            //     builder: (context,
                                                            //         AsyncSnapshot<
                                                            //                 MonkTeam>
                                                            //             LTsnapshot) {
                                                            //       if (LTsnapshot
                                                            //           .hasData) {
                                                            //         return Row(
                                                            //           children: [
                                                            //             Image
                                                            //                 .network(
                                                            //               LTsnapshot
                                                            //                   .data!
                                                            //                   .name!,
                                                            //               height:
                                                            //                   30,
                                                            //               width:
                                                            //                   30,
                                                            //             ),
                                                            //             Text(
                                                            //                 "${LTsnapshot.data!.code} 102-6 15.1",style: AppTextStyle().bodyTextStyle),
                                                            //             Text(
                                                            //                 "${liveSnapshot.data![index].localteam_dl_data!.score}-${liveSnapshot.data![index].localteam_dl_data!.wickets_out} ${liveSnapshot.data![index].localteam_dl_data!.overs}",
                                                            //             style: AppTextStyle().bodyTextStyle)
                                                            //           ],
                                                            //         );
                                                            //       } else {
                                                            //         return const LoadingWidget();
                                                            //       }
                                                            //     }),
                                                            FutureBuilder(
                                                                future: homeController
                                                                    .getTeam(liveSnapshot
                                                                        .data![
                                                                            index]
                                                                        .visitorteam_id
                                                                        .toString()),
                                                                builder: (context,
                                                                    AsyncSnapshot<
                                                                            MonkTeam>
                                                                        VTsnapshot) {
                                                                  if (VTsnapshot
                                                                      .hasData) {
                                                                    return Row(
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          VTsnapshot
                                                                              .data!
                                                                              .name!,
                                                                          height:
                                                                              30,
                                                                          width:
                                                                              30,
                                                                        ),
                                                                        Text(
                                                                            "${VTsnapshot.data!.code} 102-6 15.1",style: AppTextStyle().bodyTextStyle),
                                                                        Text(
                                                                            "${liveSnapshot.data![index].localteam_dl_data!.score}-${liveSnapshot.data![index].localteam_dl_data!.wickets_out} ${liveSnapshot.data![index].localteam_dl_data!.overs}",
                                                                        style: AppTextStyle().bodyTextStyle)
                                                                      ],
                                                                    );
                                                                  } else {
                                                                    return const LoadingWidget();
                                                                  }
                                                                }),
                                                          ],
                                                        ),
                                                        const VerticalDivider(
                                                            width: 5,
                                                            color: Colors.red,
                                                            thickness: 2),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(18.0),
                                                          child: Column(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .do_not_disturb_on_total_silence,
                                                                color: Colors.red,
                                                              ),
                                                              Text("Live",style: AppTextStyle().bodyTextStyle),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                      "${liveSnapshot.data![index].note}"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                      } else {
                        return const LoadingWidget();
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
