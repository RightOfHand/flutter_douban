
import 'dart:async';

import 'package:flutter/material.dart';

class CountDownWidget extends StatefulWidget{

  final onCountDownFinishCallBack;
  CountDownWidget({Key key,@required this.onCountDownFinishCallBack}) :super(key:key);
  @override
  _CountDownWidgetState createState() {
    // TODO: implement createState
    return _CountDownWidgetState();
  }

}

class _CountDownWidgetState extends State<CountDownWidget>{

  var _seconds=6;
  Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 17.0),
    );
  }

  void _startTimer(){
    _timer=Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {});
      if(_seconds<=1){
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  void _cancelTimer(){
    _timer?.cancel();
  }

}