import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/bean/comments_entity.dart';
import 'package:github_client_app/bean/movie_detail_bean.dart';
import 'package:github_client_app/bean/movie_long_comments_entity.dart';
import 'package:github_client_app/constant/constant.dart';
import 'package:github_client_app/http/API.dart';
import 'package:github_client_app/http/HtppManager.dart';
import 'package:github_client_app/pages/detail/detail_title_widget.dart';
import 'package:github_client_app/pages/detail/long_comment_widget.dart';
import 'package:github_client_app/pages/detail/score_start.dart';
import 'package:github_client_app/util/palette_generator.dart';
import 'package:github_client_app/widgets/bottom_drag_widget.dart';
import 'dart:math' as math;

import '../../router.dart';

class MovieDetailPage extends StatefulWidget {
  final subjectId;

  MovieDetailPage(this.subjectId, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MovieDetailPageState(subjectId);
  }
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final subjectId;

  //默认主题色
  Color pickColor = Color(0xffffffff);
  CommentsEntity commentsEntity;
  MovieLongCommentsEntity movieLongCommentsEntity;
  MovieDetailBean _movieDetailBean;
  bool loading = true;

  var data;

  _MovieDetailPageState(this.subjectId);

  double get screenH =>
      MediaQuery
          .of(context)
          .size
          .height;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestAPI();
//    data=httpManager.netFetch(API.getMovieDetail(), subjectId, null, null);
    print('detail page subjectId:' + subjectId);
  }

  void requestAPI() async {
    Future(() {
      return httpManager.netFetch(
          API.getBase() + '/v2/movie/subject/$subjectId?apikey=0b2bdeda43b5688921839c8ecb20399b', null, null, null);
    }).then((result) {
      _movieDetailBean = MovieDetailBean.fromJson(result);
      return PaletteGenerator.fromImageProvider(
          NetworkImage(_movieDetailBean.images.large));
    }).then((paletteGenerator) {
      if (paletteGenerator != null && paletteGenerator.colors.isNotEmpty) {
        pickColor = paletteGenerator.colors.toList()[0];
      }
      return httpManager.netFetch(
          API.getBase() + '/v2/movie/subject/$subjectId/comments?apikey=0b2bdeda43b5688921839c8ecb20399b',
          null,
          null,
          null);
    }).then((result2) {
      commentsEntity = CommentsEntity.fromJson(result2);
    }).then((_) {
      return httpManager.netFetch(
          API.getBase() + '/v2/movie/subject/$subjectId/reviews?apikey=0b2bdeda43b5688921839c8ecb20399b',
          null,
          null,
          null);
    }).then((result3) {
      movieLongCommentsEntity = MovieLongCommentsEntity.fromJson(result3);

      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_movieDetailBean == null) {
      return Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }
    return Scaffold(
        backgroundColor: pickColor,
        body: Container(
            child: SafeArea(
                child: BottomDragWidget(
                  body: _getBody(),
                  dragContainer: DragContainer(
                    drawer: Container(
                      child: OverscrollNotificationWidget(
                        child: LongCommentWidget(
                          movieLongCommentsEntity: movieLongCommentsEntity,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 244, 248),
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0))),
                    ),
                    defaultShowHeight: screenH * 0.1,
                    height: screenH * 0.8,

                  ),
                ))));
  }

  Widget _getBody() {
    var allCount = _movieDetailBean.rating.details.d1 +
        _movieDetailBean.rating.details.d2 +
        _movieDetailBean.rating.details.d3 +
        _movieDetailBean.rating.details.d4 +
        _movieDetailBean.rating.details.d5;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          title: Text('电影'),
          centerTitle: true,
          pinned: true,
          backgroundColor: pickColor,
        ),
        SliverToBoxAdapter(
          child: getPadding(DetailTitleWidget(_movieDetailBean, pickColor)),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 15.0, bottom: 25.0),
            margin: padding(),
            child: ScoreStartWidget(
              score: _movieDetailBean.rating.average,
              p1: _movieDetailBean.rating.details.d1 / allCount,
              p2: _movieDetailBean.rating.details.d2 / allCount,
              p3: _movieDetailBean.rating.details.d3 / allCount,
              p4: _movieDetailBean.rating.details.d4 / allCount,
              p5: _movieDetailBean.rating.details.d5 / allCount,
            ),
          ),
        ),
        sliverTags(),
        sliverSummary(),
        sliverCasts(),
      ],
    );
  }

  ///所属频道
  SliverToBoxAdapter sliverTags() {
    return SliverToBoxAdapter(
      child: Container(
        height: 30.0,
        padding: padding(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _movieDetailBean.tags.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    '所属频道',
                    style: TextStyle(color: Colors.white70, fontSize: 13.0),
                  ),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                    color: Color(0x23000000),
                    borderRadius: BorderRadius.all(Radius.circular(14.0))
                ),
                child: Text(
                  '${_movieDetailBean.tags[index - 1]}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  ///剧情简介
  SliverToBoxAdapter sliverSummary() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 15.0),
              child: Text(
                '剧情简介',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              _movieDetailBean.summary,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0x44000000),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      ),
    );
  }

  ///演员条目
  SliverToBoxAdapter sliverCasts(){
    return SliverToBoxAdapter(
        child: getPadding(Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 25.0,bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('演员表',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )),
                  ),
                  Text(
                    '全部 ${_movieDetailBean.casts.length}>',
                    style: TextStyle(fontSize: 12.0, color: Colors.white70),
                  )
                ],
              ),
            ),
            Container(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:  math.min(9, _movieDetailBean.casts.length+1),
                itemBuilder: ((BuildContext context,int index){
                  if(index==0 && _movieDetailBean.directors.isNotEmpty){
                    Director director=_movieDetailBean.directors[0];
                    if(director.avatars==null){
                      return Container();
                    }
                    return getCast(director.id, director.avatars.large, director.name);
                  }else{
                    Cast cast=_movieDetailBean.casts[index-1];
                    if(cast.avatars==null){
                      return Container();
                    }
                    return getCast(cast.id, cast.avatars.large, cast.name);
                  }
                }),
              ),
            )
          ],
        )),
    );
  }

  ///演员封面
  Widget getCast(String id, String imgUrl, String name) {
    return Hero(
      tag: imgUrl,
      child:Material(
        color: Colors.transparent,
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5.0,right:14.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  child: Image.network(
                    imgUrl,
                    height:120.0,
                    width: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 13.0, color: Colors.white),
              ),
            ],
          ),

          onTap: () {
            Router.push(context, Router.personDetailPage,
                {'personImgUrl': imgUrl, 'id': id});
          },
        ),
      ),
    );
  }

  padding() {
    return EdgeInsets.only(
        left: Constant.MARGIN_LEFT, right: Constant.MARGIN_RIGHT);
  }

  getPadding(Widget body) {
    return Padding(
      padding: EdgeInsets.only(
          left: Constant.MARGIN_LEFT, right: Constant.MARGIN_RIGHT),
      child: body,
    );
  }
}
