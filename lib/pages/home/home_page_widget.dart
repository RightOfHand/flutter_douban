
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_client_app/http/API.dart';
import 'package:github_client_app/http/HtppManager.dart';

class HomePage extends StatelessWidget{
  final String title;
  HomePage({Key key,this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Align(
          alignment: Alignment(0.0,0.0),
          child: RaisedButton(
            onPressed: (){
             var data= httpManager.netFetch(API.getTest(),null,null,null);
             Fluttertoast.showToast(msg: '被电击了',toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER);
            },
            child: Text('测试网络请求',
            style: TextStyle(color: Colors.black,fontSize: 50.0)),
          ),
      ),
    );
  }

}