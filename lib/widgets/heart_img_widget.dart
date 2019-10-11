

import 'dart:math';

import 'package:flutter/material.dart';

class  HeartImgWidget  extends StatefulWidget{
  final Image  img;

  HeartImgWidget(this.img,{Key key}) :super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HeartImgWidgetState();
  }

}

class _HeartImgWidgetState extends State<HeartImgWidget> with SingleTickerProviderStateMixin{

  AnimationController  animationController;
  Animation<double>  animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=new AnimationController( duration: const Duration(milliseconds: 1500),vsync: this);
    animation=new CurvedAnimation(parent: animationController, curve: Curves.easeIn)
      ..addStatusListener((status){
        if(status==AnimationStatus.completed){
          animationController.reverse();
        }else if(status== AnimationStatus.dismissed){
          animationController.forward();
        }
      });

    animationController.forward();

  }
  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return _AnimatedImg(widget.img,animation: animation);
  }

}

class _AnimatedImg extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.5, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 290.0, end: 300.0);
  final Image img;
  _AnimatedImg(this.img, {Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: img,
        ),
      ),
    );
  }
}