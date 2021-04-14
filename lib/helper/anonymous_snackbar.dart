import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/button/underline_button.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';

Flushbar flush;

Flushbar showAnonymousSnackBar(String title, String msg){
  return flush = Flushbar<bool>(
    titleText: Text(
      title,
      style: getCustomFont(Color(hexStringToHexInt('#FFFFFF')), 18, 'PlayfairDisplay-Bold'),
    ),
    messageText: NormalText(
      text: msg,
    ),
    backgroundColor: Color(hexStringToHexInt('#040303')),
    borderColor: Color(hexStringToHexInt('#2F2323')),
    margin: EdgeInsets.only(
      top: setHeight(61),
      left: setWidth(7.5),
      right: setWidth(7.5),
    ),
    borderWidth: setWidth(1),
    borderRadius: setHeight(16),
    padding: EdgeInsets.only(
      top: setHeight(16),
      bottom: setHeight(16),
      right: setWidth(26),
      left: setWidth(26),
    ),
    forwardAnimationCurve: Curves.easeOut,
    reverseAnimationCurve: Curves.easeOut,
    animationDuration: Duration(milliseconds: 500),
    duration: Duration(seconds: 5),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    mainButton: Container(
      width: setWidth(78),
      height: setHeight(32),
      child: UnderlineButton(
        title: 'Sign Up Now',
        width: 80,
        fontSize: 11,
        onPressed: (){
          flush.dismiss(true);
        },
      ),
    ),
  );
}