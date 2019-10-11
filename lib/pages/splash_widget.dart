
import 'package:flutter/material.dart';
import 'package:github_client_app/constant/constant.dart';
import 'package:github_client_app/pages/container_page.dart';
import 'package:github_client_app/util/screen_utils.dart';
import 'package:github_client_app/widgets/count_down_widget.dart';

class SplashWidget extends StatefulWidget{
  @override
  _SplashState createState() {
    // TODO: implement createState
    return _SplashState();
  }

}

class _SplashState extends State<SplashWidget>{

  var container= ContainerPage();
  bool showAd = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Offstage(
          child: container,
          offstage: showAd,
        ),
        Offstage(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
               Align(
                 alignment: Alignment(0.0,0.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     CircleAvatar(
                       radius: ScreenUtils.screenW(context)/3,
                       backgroundColor: Colors.white,
                       backgroundImage: AssetImage(Constant.ASSETS_IMG+'home.png'),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 20.0),
                       child: Text(
                           '生命不息，战斗不止',
                           style: TextStyle(fontSize: 15.0,color: Colors.black),
                       ),

                     )
                   ],
                 ),
               ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment(1.0,1.0),
                        child: Container(
                            child: Container(
                              margin: const EdgeInsets.only(right: 30.0,top: 20.0),
                              padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 2.0,bottom: 2.0),
                              child: CountDownWidget(
                                onCountDownFinishCallBack: (bool value){
                                  if(value){
                                    setState(() {
                                      showAd=false;
                                    });
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffEDEDED),
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              Constant.ASSETS_IMG+'ic_launcher.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                '模仿,豆瓣app',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold
                                ),

                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
            width: ScreenUtils.screenW(context),
            height: ScreenUtils.screenH(context),
          ),
          offstage: !showAd,
        ),
      ],
    );
  }

}