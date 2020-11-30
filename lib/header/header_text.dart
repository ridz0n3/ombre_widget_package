import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class HeaderText extends StatelessWidget{
  final String title;
  double top;
  double left;
  double right;
  double fontSize;
  HeaderText({this.title, this.top = 32, this.left = 33, this.right = 33, this.fontSize = 29, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(top),
        left: ScreenUtil().setWidth(left),
        right: ScreenUtil().setWidth(right),
      ),
      child: Hero(
        tag: 'header',
        child: Container(
          child: Center(
            child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: getCustomFont(Color(hexStringToHexInt('#FDFFFC')), fontSize, 'PlayfairDisplay-Bold'),
            ),
          ),
        ),
      ),
    );
  }
}