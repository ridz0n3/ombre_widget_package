import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class HeaderText extends StatelessWidget{
  final String title;
  double top;
  HeaderText({this.title, this.top = 32});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(top),
        left: ScreenUtil().setWidth(33),
        right: ScreenUtil().setWidth(33),
      ),
      child: Hero(
        tag: 'subheader',
        child: Container(
          child: Center(
            child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: getCustomFont(Color(hexStringToHexInt('#FDFFFC')), 29, 'PlayfairDisplay-Bold'),
            ),
          ),
        ),
      ),
    );
  }
}