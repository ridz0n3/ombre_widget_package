import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


init(BuildContext context){
  ScreenUtil.init(width: 360, height: 640, allowFontScaling: true);
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

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
    title: Text(title, style: TextStyle(color: Colors.white)),
    centerTitle: true,
    automaticallyImplyLeading: hasBack,
    leading: hasBack ? new IconButton(
      icon: new Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ) : null,
    backgroundColor: Color(hexStringToHexInt('#040303')),
  );
}
