import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class HeaderText extends StatelessWidget{
  final String title;
  double top;
  double fontSize;
  HeaderText({this.title, this.top = 32, this.fontSize = 29});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(top),
        left: ScreenUtil().setWidth(33),
        right: ScreenUtil().setWidth(33),
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