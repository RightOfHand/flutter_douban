

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/bean/celebrity_entity_entity.dart';
import 'package:github_client_app/bean/celebrity_work_entity_entity.dart';
import 'package:github_client_app/http/API.dart';
import 'package:github_client_app/http/HtppManager.dart';
import 'package:github_client_app/router.dart';
import 'package:github_client_app/widgets/image/radius_img.dart';
import 'package:github_client_app/widgets/item_count_title.dart';
import 'package:github_client_app/widgets/loading_widget.dart';
import 'package:github_client_app/widgets/rating_bar.dart';
import 'package:github_client_app/widgets/subject_mark_image_widget.dart';
import 'package:github_client_app/widgets/title_bar.dart' as title;

class PersonDetailPage extends StatefulWidget{

  final String id;
  final String personImgUrl;

  const PersonDetailPage(this.personImgUrl, this.id, {Key key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonDetailPageState(id);
  }

}

class _PersonDetailPageState extends State<PersonDetailPage> {
  CelebrityEntityEntity celebrityEntity;

  CelebrityWorkEntityEntity celebrityWorkEntity;
  double itemW;
  double itemH;
  double photoH;
  double titleSize = 16.0;
  bool loading = true;

  final String id;
  _PersonDetailPageState(this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestApi();

  }


  void  requestApi() async{
    var result= await httpManager.netFetch(API.DB_BASE_URL+'/v2/movie/celebrity/$id/works?apikey=0b2bdeda43b5688921839c8ecb20399b', null, null, null);


    var resultTwo=await httpManager.netFetch(API.DB_BASE_URL+'/v2/movie/celebrity/$id?apikey=0b2bdeda43b5688921839c8ecb20399b', null, null, null);


    setState(() {
      loading=false;
      celebrityWorkEntity=CelebrityWorkEntityEntity.fromJson(result);
      celebrityEntity=CelebrityEntityEntity.fromJson(resultTwo);
    });
  }
  @override
  Widget build(BuildContext context) {
    itemW=MediaQuery.of(context).size.width/4;
    itemH=itemW/0.5;
    photoH=MediaQuery.of(context).size.width/3;
    // TODO: implement build
    return title.TitleBar(
      title: '人物',
      body: LoadingWidget.containerLoadingBody(
        _getBody(),
        loading: loading,
      ),
    );
  }

  _getBody(){
     if(celebrityEntity==null){
       return _PersonPhoto(
         photoUrl: widget.personImgUrl,
       );
     }else{
       return CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _PersonPhoto(photoUrl: widget.personImgUrl),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            celebrityEntity.name,
                            style: TextStyle(
                                fontSize: 19.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            celebrityEntity.akaEn[0],
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0,bottom: 7.0),
                  child: Text(
                    '简介',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: titleSize
                    ),
                  ),
                ),
                Text(
                  celebrityEntity.summary,
                  softWrap: true,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
              child: ItemCountTitle(
                '影视',
                count: celebrityWorkEntity.works.length,
                fontSize: titleSize,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: itemH,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  CelebrityWorkEntityWorksSubject bean =
                      celebrityWorkEntity.works[index].subject;
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: _getItem(bean),
                  );
                },
                itemCount: celebrityWorkEntity.works.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ItemCountTitle(
              '相册',
              count: celebrityEntity.photos.length,
              fontSize: titleSize,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: photoH,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 15.0, right: 3.0),
                    child: Image.network(
                      celebrityEntity.photos[index].image,
                      height: photoH,
                      fit: BoxFit.contain,
                    ),
                  );
                },
                itemCount: celebrityEntity.photos.length,
              ),
            ),
          )
        ],
       );
     }
  }

  Widget _getItem(CelebrityWorkEntityWorksSubject bean){
    if (bean == null || bean.images.large == null) {
      return Container();
    }
    return GestureDetector(
      child: Container(
        width: itemW,
        height: itemH,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SubjectMarkImageWidget(
                bean.images.large,
                width: itemW,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                width: double.infinity,
                child: Text(
                  bean.title,

                  ///文本只显示一行
                  softWrap: false,

                  ///多出的文本渐隐方式
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            RateBar(
              bean.rating.average,
              size: 12.0,
            )

          ],
        ),
      ),

      onTap: (){
        Router.push(context, Router.detailPage, bean.id);
      },
    );
  }
}

class _PersonPhoto extends StatelessWidget {
  const _PersonPhoto({Key key, this.photoUrl}) : super(key: key);
  final String photoUrl;

  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 5;
    return SizedBox(
      width: w,
      child: Hero(
        tag: photoUrl,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: RadiusImg.get(photoUrl, w, imgH: w / 0.8, elevation: 3.0),
          ),
        ),
      ),
    );
  }
}