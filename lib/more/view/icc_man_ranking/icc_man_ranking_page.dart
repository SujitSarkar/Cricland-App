import 'package:cricland/more/view/icc_man_ranking/player_details/player_details.dart';
import 'package:cricland/public/controller/public_controller.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../public/variables/colors.dart';
import '../../../public/variables/config.dart';

class ICCManRankingPage extends StatefulWidget {
  const ICCManRankingPage({Key? key}) : super(key: key);

  @override
  State<ICCManRankingPage> createState() => _ICCManRankingPageState();
}

class _ICCManRankingPageState extends State<ICCManRankingPage> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  String _gameType=Variables.manGameType.first;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  final TextStyle _titleStyle = TextStyle(
      fontSize: dSize(.038),
      color: PublicController.pc.toggleTextColor());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
       body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: Text('ICC Men\'s Rankings',style: TextStyle(fontSize: dSize(.045))),
                  titleSpacing: -8.0,
                  floating: true,
                  pinned: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                  bottom: _tabBar(),
                ),
              ),
            ];
          },
          body: _bodyUI(),
        )
    ));
  }

  Widget _bodyUI()=>Column(
    children: [
      SizedBox(height: dSize(.19)),
      ///GameType TabBar
      Padding(
        padding: EdgeInsets.all(dSize(.04)),
        child: Row(
          children: Variables.manGameType.map((item) => Expanded(
              child: InkWell(
                onTap: ()=> setState(()=>_gameType=item),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: item==Variables.manGameType[0] || item==Variables.manGameType[1]
                      ?dSize(.03):0.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: item==_gameType
                          ? AllColor.primaryColor:PublicController.pc.isLight.value?Colors.grey:PublicController.pc.toggleCardBg(),
                          width: 0.5),
                      color: item==_gameType?AllColor.primaryColor:PublicController.pc.toggleCardBg(),
                      borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: dSize(.015),
                      horizontal: dSize(.04)),
                  child: Text(item,maxLines:1,style: TextStyle(
                      fontSize: dSize(.035),
                      fontWeight: FontWeight.w500,
                      color: item==_gameType
                          ? Colors.white:PublicController.pc.toggleTextColor()
                  ),),
                ),
              ))
          ).toList(),
        ),
      ),
      
      ///Data Title
     Expanded(child: Padding(
       padding: EdgeInsets.symmetric(horizontal: dSize(.04)),
       child: TabBarView(
         controller: _tabController,
         children: [
           _teamData(),
           _individualData(),
           _individualData(),
           _individualData()
         ],
       ),
     ))
    ],
  );

  Widget _teamData()=>Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1,child: Text('Rank',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.start)),
                Expanded(flex: 3,child: Text('Team',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.start)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Text('Matches',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center)),
                Expanded(child: Text('Points',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center)),
                Expanded(child: Text('Ratings',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center)),
              ],
            ),
          ),
        ],
      ),
      Expanded(
        child: ListView.separated(
          padding: EdgeInsets.only(top: dSize(.04)),
          physics: const BouncingScrollPhysics(),
          itemCount: 30,
          itemBuilder: (context, index)=>Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 1,child: Text('${index+1}',style: _titleStyle,textAlign: TextAlign.start)),
                    Expanded(
                        flex: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/bd_logo.png',height: dSize(.06),width: dSize(.06)),
                            SizedBox(width: dSize(.02)),
                            Expanded(child: Text('Bangladesh',style: _titleStyle,textAlign: TextAlign.start)),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Text('200',style: _titleStyle,textAlign: TextAlign.center)),
                    Expanded(child: Text('654',style: _titleStyle,textAlign: TextAlign.center)),
                    Expanded(child: Text('4.8',style: _titleStyle,textAlign: TextAlign.center)),
                  ],
                ),
              ),
            ],
          ),
          separatorBuilder: (context,index)=>Divider(height: dSize(.12)),
        ),
      )
    ],
  );

  Widget _individualData()=>Column(
    children: [
      Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1,child: Text('Rank',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.start)),
                Expanded(flex: 3,child: Text('Player',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.start)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('Ratings',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center)),
        ],
      ),
      Expanded(
        child: ListView.separated(
          padding: EdgeInsets.only(top: dSize(.04)),
          physics: const BouncingScrollPhysics(),
          itemCount: 30,
          itemBuilder: (context, index)=>Row(
            children: [
              Expanded(
                flex:4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 1,child: Text('${index+1}',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.start)),
                    Expanded(
                        flex: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/bd_logo.png',height: dSize(.1),width: dSize(.1)),
                            SizedBox(width: dSize(.02)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(()=>const PlayerDetailsPage());
                                  },
                                  child: Text('Sakib Al Hasan',style: _titleStyle,textAlign: TextAlign.start)),
                                Text('Bangladesh',style: _titleStyle.copyWith(fontSize: dSize(.032)),textAlign: TextAlign.start),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded( flex:1,child: Text('476',style: _titleStyle.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center)),
            ],
          ),
          separatorBuilder: (context,index)=>Divider(height: dSize(.12)),
        ),
      )
    ],
  );

  PreferredSize _tabBar()=>PreferredSize(
    preferredSize: Size.fromHeight(dSize(.1)),
    child: TabBar(
      onTap: (covariant) async {
        setState(() => _tabController.index = covariant);
      },
      isScrollable: true,
      controller: _tabController,
      labelColor: PublicController.pc.toggleLoadingColor(),
      indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dSize(.02)),
              topRight: Radius.circular(dSize(.02))
          ),
          color: PublicController.pc.toggleTabColor()),
      unselectedLabelColor: Colors.grey.shade400,
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: dSize(.045)
      ),
      labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: dSize(.045)
      ),
      indicatorSize: TabBarIndicatorSize.label,
      physics: const BouncingScrollPhysics(),
      tabs: Variables.manCategoryList.map<Widget>((String item)=>
          Padding(
            padding: EdgeInsets.symmetric(vertical: dSize(.01),horizontal: dSize(.02)),
            child: Text(item),
          )).toList(),
    ),
  );

}
