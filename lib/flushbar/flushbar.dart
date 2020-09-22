import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/button/underline_button.dart';
import 'package:ombre_widget_package/helper/utils.dart';

Flushbar flush;

Flushbar showSnackBar({String title, String message, String buttonTitle = 'Leave a review', double buttonWidth = 85}){
  return flush = Flushbar<bool>(
    titleText: title == '' ? null : Text(
      title,
      style: getCustomFont(Color(hexStringToHexInt('#FFFFFF')), 18, 'PlayfairDisplay-Bold'),
    ),
    messageText: Text(
      message,
      style: getCustomFont(Color(hexStringToHexInt('#FFFFFF')), 11, 'Poppins-Regular'),
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
    mainButton: UnderlineButton(
      title: buttonTitle,
      fontSize: 11,
      width: buttonWidth,
      onPressed: (){
        flush.dismiss(true);
      },
    ),
  );
}
