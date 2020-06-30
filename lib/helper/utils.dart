import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


init(BuildContext context){
  ScreenUtil.init(width: 360, height: 640, allowFontScaling: true);
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

bool isDigit(String s, int idx) => "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

TextStyle getCustomFont(Color color, double fontSize, String fontName, { TextDecoration decoration = TextDecoration.none}) {
  return new TextStyle(
      decoration: decoration,
      // set color of text
      color: color,
      // set the font family as defined in pubspec.yaml
      fontFamily: fontName,
      // set the font size
      fontSize: ScreenUtil().setSp(fontSize, allowFontScalingSelf: true)
  );
}

hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}

Widget loadIndicator({bool isFill = false}){
  return new Stack(
    children: [
      new Opacity(
        opacity: 0.3,
        child: ModalBarrier(dismissible: false, color: Colors.transparent),
      ),
      new Center(
        child: SpinKitCircle(color: isFill ? Colors.white : Colors.black, size: ScreenUtil().setHeight(20),),
      ),
    ],
  );
}

Widget loadIndicatorFullScreen({bool isFill = false}){
  return new Stack(
    children: [
      new Opacity(
        opacity: 0.5,
        child: ModalBarrier(dismissible: false, color: Colors.black45),
      ),
      new Center(
        child: SpinKitCircle(color: isFill ? Colors.white : Colors.black, size: ScreenUtil().setHeight(40),),
      ),
    ],
  );
}

double setHeight(double height){
  return ScreenUtil().setHeight(height);
}

double setWidth(double width){
  return ScreenUtil().setWidth(width);
}

Widget appBar({String title, bool hasBack = true, BuildContext context}){

  return AppBar(
    title: Text(title, style: getCustomFont(Colors.white, 18, 'PlayfairDisplay-Bold')),
    centerTitle: true,
    automaticallyImplyLeading: hasBack,
    leading: hasBack ? new IconButton(
      icon: new Icon(Platform.isAndroid ? Icons.arrow_back : CupertinoIcons.back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ) : null,
    backgroundColor: Color(hexStringToHexInt('#040303')),
  );
}

InputDecoration inputDecoration(String placeholder){
  return InputDecoration(
    labelText: '$placeholder',
    labelStyle: getCustomFont(Color(hexStringToHexInt('#4DFFFCF2')), 14, 'Poppins-Regular'),
    hasFloatingPlaceholder: false,
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
    ),
    contentPadding: EdgeInsets.only(
      top: setHeight(17),
      bottom: setHeight(17),
      left: setWidth(28),
      right: setWidth(28),
    ),
    counterText: "",
    focusedBorder:OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}
