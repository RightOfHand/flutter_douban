

import 'package:flutter/material.dart';
import 'package:github_client_app/pages/group/group_page.dart';
import 'package:github_client_app/pages/home/home_page_widget.dart';
import 'package:github_client_app/pages/home/home_widget.dart';

import 'person/person_center_page.dart';

class ContainerPage extends StatefulWidget{
  ContainerPage({Key key}) : super (key: key);

  @override
  _HomeContainerState createState() {
    // TODO: implement createState
    return new _HomeContainerState();
  }}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}
class _HomeContainerState extends State<ContainerPage>{

  List<Widget> pages;
  final defaultItemColor= Color.fromARGB(255, 125, 125, 125);

  final itemNames=[
    _Item('首页', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    _Item('书影音', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    _Item('小组', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    _Item('市集', 'assets/images/ic_tab_shiji_active.png',
        'assets/images/ic_tab_shiji_normal.png'),
    _Item('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];

  List<BottomNavigationBarItem> itemList;

  int _selectIndex =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState _ContainerPageState');
    if(pages==null){
      pages=[
        HomeWidget(),
        HomePage(title: '书影集',),
        GroupPage(),
        HomePage(title: '市集',),
        PersonCenterPage(),
      ];
    }
    if(itemList==null){
      itemList=itemNames.map((item)=>BottomNavigationBarItem(
        icon: Image.asset(
          item.normalIcon,
          width: 30.0,
          height: 30.0,
        ),
        title: Text(
          item.name,
          style: TextStyle(fontSize: 10.0),
        ),
        activeIcon: Image.asset(item.activeIcon,width: 30.0,height: 30.0,)

      )).toList();
    }
  }

  Widget _getPageWidget(int index){
    return Offstage(
      offstage: _selectIndex !=index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('build _ContainerPageState');

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _getPageWidget(0),
          _getPageWidget(1),
          _getPageWidget(2),
          _getPageWidget(3),
          _getPageWidget(4),
        ],
      ),
      backgroundColor: Color.fromARGB(255,248,248,248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index){
          setState(() {
            _selectIndex=index;

          });
        },
        iconSize: 24,
        currentIndex: _selectIndex,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }


  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }


}