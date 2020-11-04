import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ombre_widget_package/header/normal_text.dart';


init(BuildContext context){
  ScreenUtil.init(width: 360, height: 640, allowFontScaling: true);
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

bool isDigit(String s, int idx) => "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

TextStyle getCustomFont(Color color, double fontSize, String fontName, { TextDecoration decoration = TextDecoration.none}) {
  return new TextStyle(
    letterSpacing: fontName.contains('Poppins') ? 0.5 : 0,
    decoration: decoration,
      // set color of text
    color: color,
      // set the font family as defined in pubspec.yaml
    fontFamily: fontName,
      // set the font size
    fontSize: ScreenUtil().setSp(fontSize, allowFontScalingSelf: true),
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

InputDecoration inputDecoration(String placeholder, {double top = 17, double left = 28, String platform = 'mobile'}){
  return InputDecoration(
    labelText: '$placeholder',
    labelStyle: getCustomFont(Color(hexStringToHexInt(platform == 'web' ? '#040303' : '#4DFFFCF2')), platform == 'web' ? 11 : 14, 'Poppins-Regular'),
    hasFloatingPlaceholder: false,
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
    ),
    contentPadding: EdgeInsets.only(
      top: setHeight(top),
      bottom: setHeight(top),
      left: setWidth(left),
      right: setWidth(left),
    ),
    isDense: true,
    counterText: "",
    focusedBorder:OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}

InputDecoration inputFocusDecoration(String placeholder, String infoText, bool isError, {bool isObscure, VoidCallback onPressed, String platform = 'mobile'}){
  return InputDecoration(
    labelText: placeholder,
    labelStyle: getCustomFont(Color(hexStringToHexInt(platform == 'web' ? '#040303' : '#4DFFFCF2')).withOpacity(platform == 'web' ? 0.3 : 1), platform == 'web' ? 11 : 14, 'Poppins-Regular'),
    hasFloatingPlaceholder: false,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(setHeight(61))),
    ),
    counter: infoText != '' ? Padding(
      padding: EdgeInsets.only(
        top: setHeight(8),
        left: setHeight(24),
        right: setHeight(0),
      ),
      child: Container(
        child: NormalText(
          text: infoText,
          colorHex: isError ? '#E5333B' : '#FFFCF2',
          align: AlignmentDirectional.centerStart,
        ),
      ),
    ) : Container(),
    contentPadding: EdgeInsets.only(
      top: setHeight(21.5),
      bottom: setHeight(21.5),
      left: setWidth(30),
    ),
    fillColor: Color(hexStringToHexInt(platform == 'web' ? '#E8E8E8' : '#4D574242')),
    filled: true,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(hexStringToHexInt(platform == 'web' ? '#040303' : '#FFFCF2')), width: setWidth(1)),
      borderRadius: BorderRadius.all(Radius.circular(setHeight(61))),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: isError ? Color(hexStringToHexInt('#E5333B')) : Colors.transparent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(setHeight(61))),
    ),
    suffixIcon: isObscure == null ? null : Padding(
      padding: EdgeInsets.only(
        right: setWidth(18),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          !isObscure ? Icons.visibility_off : Icons.visibility,
          size: setWidth(20),
          color: Color(hexStringToHexInt(platform == 'web' ? '#040303' : '#FFFCF2')),
        ),
      ),
    ),
  );
}

InputDecoration biometricInputDecoration(String placeholder){
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
      left: setWidth(placeholder == 'in' ? 0 : 28),
      right: setWidth(placeholder == 'ft' ? 5 :28),
    ),
    counterText: "",
    focusedBorder:OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: BorderRadius.circular(5.0),
    ),
    alignLabelWithHint: true,
    hintText: '0',
    suffixText: '$placeholder',
    suffixStyle: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Bold'),
  );
}
