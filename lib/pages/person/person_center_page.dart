
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_client_app/constant/cache_key.dart';
import 'package:github_client_app/constant/constant.dart';
import 'package:github_client_app/widgets/divider_10.dart';
import 'package:github_client_app/widgets/heart_img_widget.dart';
import 'package:github_client_app/widgets/right_arrow_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

typedef VoidCallback =void Function();

class PersonCenterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                flexibleSpace: HeartImgWidget(Image.asset(Constant.ASSETS_IMG+'bg_person_center_default.webp')),
                expandedHeight: 200.0,
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0,top: 15.0,right: 10.0,bottom: 20.0),
                      child: Image.asset(
                        Constant.ASSETS_IMG+'ic_notify.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '提醒',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ),
                    RightArrowWidget(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Divider10Widget(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 10.0, bottom: 20.0),
                  child: Text(
                    '我的书影音',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  child: _VideoBookMusicBookWidget(),
                ),
              ),
              SliverToBoxAdapter(
                child: Divider10Widget(),
              ),
              _dataSelect(),

              _personItem('ic_me_journal.png', '我的发布',onClick: (){
                Fluttertoast.showToast(msg: 'onClick',toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER);
              }),

            ],

          ),
        ),
      ),
    );
  }

   _dataSelect(){
    return UseNetDataWidget();
   }

   _personItem(String imgAsset,String title,{VoidCallback onClick}){
    return SliverToBoxAdapter(
           child: GestureDetector(
             behavior: HitTestBehavior.translucent,
             child: Row(
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.all(10.0),
                   child: Image.asset(Constant.ASSETS_IMG+imgAsset,width: 25.0,height: 25.0),
                 ),
                 Expanded(
                   child: Text(title,style: TextStyle(fontSize: 15.0)),
                 ),
                 RightArrowWidget(),
               ],
             ),
             onTap: onClick,
           ),
    );
   }
}

TabController  _tabController;
List<String> tabTxt=['影视','图书','音乐'];
///影视、图书、音乐 TAB
class _VideoBookMusicBookWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoBookMusicBookWidgetState();
}

class _VideoBookMusicBookWidgetState extends State<_VideoBookMusicBookWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabTxt.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 130.0,
      child: DefaultTabController(
        length: tabTxt.length,
        child: Column(
          children: <Widget>[
            Align(
              child: _TabBarWidget(),
              alignment: Alignment.centerLeft,
            ),
            _tabView(),
          ],
        ),
      ),
    );
  }
  Widget _tabView() {
    return Expanded(
      child: TabBarView(
        children: [
          _tabBarItem('bg_videos_stack_default.png'),
          _tabBarItem('bg_books_stack_default.png'),
          _tabBarItem('bg_music_stack_default.png'),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget getTabViewItem(String img, String txt) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 7.0),
            child: Image.asset(
              Constant.ASSETS_IMG + img,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(txt)
      ],
    );
  }
  _tabBarItem(String img) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        getTabViewItem(img, '想看'),
        getTabViewItem(img, '在看'),
        getTabViewItem(img, '看过'),
      ],
    );
  }
}


class _TabBarWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBarWidgetState();
  }

}

class _TabBarWidgetState extends State<_TabBarWidget>{
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;
  List<Widget> tabWidgets;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectColor = Colors.black;
    unselectedColor = Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 18, color: selectColor);
    unselectedStyle = TextStyle(fontSize: 18, color: selectColor);
    tabWidgets = tabTxt
        .map((item) =>
        Text(
          item,
          style: TextStyle(fontSize: 15),
        ))
        .toList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_tabController != null) {
      _tabController.dispose();
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TabBar(
      tabs: tabWidgets,
      isScrollable: true,
      indicatorColor: selectColor,
      labelColor: selectColor,
      labelStyle: selectStyle,
      unselectedLabelColor: unselectedColor,
      unselectedLabelStyle: unselectedStyle,
      indicatorSize: TabBarIndicatorSize.label,
      controller: _tabController,
    );
  }


}

class UseNetDataWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UseNetDataWidgetState();
  }

}

class _UseNetDataWidgetState extends State<UseNetDataWidget>{
  bool mSelectNetData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();

  }
  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mSelectNetData = prefs.getBool(CacheKey.USE_NET_DATA) ?? true;
    });
  }

  _setData(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(CacheKey.USE_NET_DATA, value);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          children: <Widget>[
            Text('书影音数据是否来自网络', style: TextStyle(color: Colors.redAccent, fontSize: 17.0),),
            Expanded(
              child: Container(),
            ),
            CupertinoSwitch(
              value: mSelectNetData,
              onChanged: (bool value){
                mSelectNetData=value;
                _setData(value);
                var tmp;
                if(value){
                  tmp = '书影音数据 使用网络数据，重启APP后生效';
                }else{
                  tmp = '书影音数据 使用本地数据，重启APP后生效';
                }
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(title: Text('提示'),content: Text(tmp),actions: <Widget>[
                    FlatButton(child: Text('稍后我自己重启'),onPressed: (){
                      Navigator.of(context).pop();
                    }),
                    FlatButton(child: Text('现在重启'),onPressed: (){
                      RestartWidget.restartApp(context);
                      Navigator.of(context).pop();
                    },)
                  ],);
                });
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }

}