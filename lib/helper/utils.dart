import 'package:flutter/material.dart';

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

TextStyle getCustomFont(Color color, double fontSize, String fontName, { TextDecoration decoration = TextDecoration.none, String style = '' }) {
  return new TextStyle(
      decoration: decoration,
      // set color of text
      color: color,
      // set the font family as defined in pubspec.yaml
      fontFamily: fontName,
      // set the font weight
      fontWeight: style == 'bold' ? FontWeight.w500 : FontWeight.w200,
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