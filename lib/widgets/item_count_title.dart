import 'package:flutter/material.dart';
import 'package:github_client_app/constant/color_constant.dart';
import 'package:github_client_app/constant/text_size_constant.dart';

typedef OnClick = void Function();

///左边是文案，右边是全部
class ItemCountTitle extends StatelessWidget {
  final count;
  final OnClick onClick;
  final String title;
  final double fontSize;

  ItemCountTitle(this.title, {Key key, this.onClick, this.count, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            title,
            style: TextStyle(
                fontSize: fontSize == null
                    ? TextSizeConstant.BookAudioPartTabBar
                    : fontSize,
                fontWeight: FontWeight.bold,
                color: ColorConstant.colorDefaultTitle),
          )),
          Text(
            '全部 ${count == null ? 0 : count} > ',
            style: TextStyle(
                fontSize: 12, color: Colors.grey),
          )
        ],
      ),
      onTap: () {
        if (onClick != null) {
          onClick();
        }
      },
    );
  }
}

