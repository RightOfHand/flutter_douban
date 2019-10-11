import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_client_app/constant/constant.dart';
import 'package:github_client_app/http/API.dart';
import 'package:github_client_app/http/HtppManager.dart';
import 'package:github_client_app/http/mock_request.dart';
import 'package:github_client_app/models/subject_entity.dart';
import 'package:github_client_app/router.dart';
import 'package:github_client_app/widgets/image/radius_img.dart';
import 'package:github_client_app/widgets/loading_widget.dart';
import 'package:github_client_app/widgets/search_text_field_widget.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String hint = '搜索书影音 小组 日记 用户等';
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchTextFieldWidget(
              margin: EdgeInsets.all(Constant.MARGIN_RIGHT),
              hintText: hint,
              onTab: () {},
            ),
            Expanded(
              child: _GroupWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class _GroupWidget extends StatefulWidget {
  @override
  _GroupWidgetState createState() {
    // TODO: implement createState
    return _GroupWidgetState();
  }
}

class _GroupWidgetState extends State<_GroupWidget> {
  List<Subject> list;
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    requestApi();

    Future(() {
      return httpManager.netFetch(API.getHotMovie(), null, null, null);
    }).then((result) {
      if (result != null) {
        var resultList = result['subjects'];
        setState(() {
          list =
              resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
          loading = false;
        });
      }
    });
  }

  void requestApi() async {
    var _request = MockRequest();
    var result = await _request.get(API.IN_THEATERS);
    var resultList = result['subjects'];
    list = resultList.map<Subject>((item) => Subject.fromMap(item)).toList();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoadingWidget.containerLoadingBody(_getBody(), loading: loading);
  }

  Widget _getBody() {
    if (list == null) {
      return Container(
        child: Image.asset(Constant.ASSETS_IMG + 'ic_group_top.png'),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Image.asset(Constant.ASSETS_IMG + 'ic_group_top.png');
        }
        Subject bean = list[index - 1];
        return Padding(
          padding: const EdgeInsets.only(
              right: Constant.MARGIN_RIGHT, left: 6.0, top: 13.0),
          child: _getItem(bean, index),
        );
      },
      itemCount: list.length + 1,
    );
  }

  Widget _getItem(Subject bean, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: <Widget>[
          RadiusImg.get(bean.images.small, 50.0, radius: 3.0),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    bean.title,
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Text(bean.pubdates != null ? bean.pubdates[0] : '上映时间',
                      style: TextStyle(fontSize: 13.0))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              '${bean.collect_count}人',
              style: TextStyle(fontSize: 13.0),
            ),
          ),
          GestureDetector(
            child: Image.asset(
              Constant.ASSETS_IMG +
                  (list[index].tag
                      ? 'ic_group_checked_anonymous.png'
                      : 'ic_group_check_anonymous.png'),
              width: 25.0,
              height: 25.0,
            ),
            onTap: () {
              setState(() {
                list[index].tag = !list[index].tag;
              });
            },
          )
        ],
      ),
      onTap: () {
        Router.push(context, Router.detailPage, bean.id);
      },
    );
  }
}
