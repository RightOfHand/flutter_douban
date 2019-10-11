import 'dart:math';

import 'package:flutter/material.dart';
import 'package:github_client_app/constant/constant.dart';
import 'package:github_client_app/http/API.dart';
import 'package:github_client_app/http/HtppManager.dart';
import 'package:github_client_app/http/mock_request.dart';
import 'package:github_client_app/models/subject_entity.dart';
import 'package:github_client_app/pages/home/home_page_widget.dart';
import 'package:github_client_app/widgets/image/radius_img.dart';
import 'package:github_client_app/widgets/search_text_field_widget.dart';
import 'package:github_client_app/pages/home/home_app_bar.dart' as myapp;
import 'package:flutter/services.dart' show rootBundle;

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getWidget();
  }
}

var _tabs = ['动态', '推荐'];

DefaultTabController getWidget() {
  return DefaultTabController(
    initialIndex: 1,
    length: _tabs.length,
    child: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            child: myapp.SliverAppBar(
              pinned: true,
              expandedHeight: 120.0,
              primary: true,
              titleSpacing: 0.0,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  color: Colors.green,
                  child: SearchTextFieldWidget(
                    hintText: '影视作品中你难忘的离别',
                    margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                    onTab: () {
//                      Router.push(context, Router.searchPage, '影视作品中你难忘的离别');
                    },
                  ),
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
              bottomTextString: _tabs,
              bottom: TabBar(
                // These are the widgets to put in each tab in the tab bar.
                tabs: _tabs
                    .map((String name) => Container(
                          child: Text(
                            name,
                          ),
                          padding: const EdgeInsets.only(bottom: 5.0),
                        ))
                    .toList(),
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        // These are the contents of the tab views, below the tabs.
        children: _tabs.map((String name) {
          return SliverContainer(
            name: name,
          );
        }).toList(),
      ),
    ),
  );
}

class SliverContainer extends StatefulWidget {
  final String name;

  SliverContainer({Key key, @required this.name}) : super(key: key);

  @override
  _SliverContainerState createState() {
    // TODO: implement createState
    return _SliverContainerState();
  }
}

class _SliverContainerState extends State<SliverContainer> {
  List<Subject> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state ${widget.name}');
    if (list == null || list.isEmpty) {
      if (_tabs[0] == widget.name) {
        requestApi();
      } else {
        requestApi();
      }
    }
  }

  void requestApi() async {
//    var result=await httpManager.netFetch(API.getHomeTop(), null, null, null);

    var _request = MockRequest();
    var result = await _request.get(API.TOP_250);
    var resultList = result['subjects'];
    list = resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getContentSilver(context, list);
  }

  getContentSilver(BuildContext context, List<Subject> list) {
    if (widget.name == _tabs[0]) {
      return _loginContainer(context);
    }
    print('getContentSliver');

    if (list == null || list.length == 0) {
      return Text('暂无数据');
    }

    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context){
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            key: PageStorageKey<String>(widget.name),
            slivers: <Widget>[
             SliverOverlapInjector(
               handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
             ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      ((BuildContext context, int index) {
                        return getCommonItem(list, index);
                      }), childCount: list.length)),
            ],
          );
        },
      ),
    );
  }
  double singleLineImgHeight = 180.0;
  double contentVideoHeight = 350.0;
  getCommonItem(List<Subject> items, int index) {
    Subject item = items[index];
    bool showVideo = index == 1 || index == 3;
    return Container(
      height: singleLineImgHeight,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.only(
          left: Constant.MARGIN_LEFT,
          right: Constant.MARGIN_RIGHT,
          top: Constant.MARGIN_RIGHT,
          bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(item.casts[0].avatars.medium),
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(item.title),
              ),
              Expanded(
                child: Align(
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                    size: 18.0,
                  ),
                  alignment: Alignment.centerRight,
                ),
              )
            ],
          ),
          Expanded(
              child: Container(
                child: getItemCenterImg(item),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  Constant.ASSETS_IMG + 'ic_vote.png',
                  width: 25.0,
                  height: 25.0,
                ),
                Image.asset(
                  Constant.ASSETS_IMG +
                      'ic_notification_tv_calendar_comments.png',
                  width: 20.0,
                  height: 20.0,
                ),
                Image.asset(
                  Constant.ASSETS_IMG + 'ic_status_detail_reshare_icon.png',
                  width: 25.0,
                  height: 25.0,
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
  getItemCenterImg(Subject item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: RadiusImg.get(item.images.large, null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0)),
              )),
        ),
        Expanded(
          child: RadiusImg.get(item.casts[1].avatars.medium, null, radius: 0.0),
        ),
        Expanded(
          child: RadiusImg.get(item.casts[2].avatars.medium, null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)))),
        )
      ],
    );
  }

//  getContentVideo(int index) {
//    if(!mounted){
//      return Container();
//    }
//    return VideoWidget(
//      index == 1 ? Constant.URL_MP4_DEMO_0 :  Constant.URL_MP4_DEMO_1,
//      showProgressBar: false,
//    );
//  }
}

_loginContainer(BuildContext context){
  return Align(
    alignment: Alignment(0.0,0.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
           Image.asset(
             Constant.ASSETS_IMG + 'ic_new_empty_view_default.png',
             width: 120.0,
           ),
           Padding(
             padding:  const EdgeInsets.only(top: 15.0,bottom: 25.0),
             child: Text(
               '登录后查看关注人动态',
               style: TextStyle(fontSize: 16.0,color: Colors.grey),
             ),
           ),
           GestureDetector(
             child: Container(
               child: Text(
                 '去登录',
                 style: TextStyle(fontSize: 16.0, color: Colors.green),
               ),
               padding: const EdgeInsets.only(
                   left: 35.0, right: 35.0, top: 8.0, bottom: 8.0),
               decoration: BoxDecoration(
                   border: Border.all(color: Colors.green),
                   borderRadius: const BorderRadius.all(Radius.circular(6.0))),
             ),
             onTap: () {
//               Router.push(context, Router.searchPage, '搜索笨啦灯');
             },
             ),

      ],
    ),
  );
}
