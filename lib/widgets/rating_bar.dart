
import 'dart:ui';

import 'package:flutter/material.dart';

class RateBar extends StatelessWidget{

  var stars;
  final double  size;
  final double fontSize;
  final color=Color.fromARGB(255,255,270,71);

  RateBar(this.stars,{Key key,this.size=18.0,this.fontSize=13.0}):super(key:key);
  @override
  Widget build(BuildContext context) {
    stars=stars*1.0;
    List<Widget> starList=[];
    //实心星星
    var starNumber=stars ~/2;
    //半心
    var starHalf=0;

    if(stars.toString().contains('.')){
      int tmp=int.parse((stars.toString().split('.')[1]));
      if(tmp>=5){
        starHalf=1;
      }
    }

    //空心星星
    var starEmpty = 5 - starNumber - starHalf;
    for (var i = 0; i < starNumber; i++) {
      starList.add(Icon(
        Icons.star,
        color: color,
        size: size,
      ));
    }
    if (starHalf > 0) {
      starList.add(Icon(
        Icons.star_half,
        color: color,
        size: size,
      ));
    }
    for (var i = 0; i < starEmpty; i++) {
      starList.add(Icon(
        Icons.star_border,
        color: Colors.grey,
        size: size,
      ));
    }
    starList.add(Text(
      '$stars',
      style: TextStyle(color: Colors.grey, fontSize: fontSize),
    ));
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: starList,
      ),
    );
  }

}