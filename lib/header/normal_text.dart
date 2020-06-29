import 'package:flutter/cupertino.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class NormalText extends StatelessWidget{

  final String text;
  double fontSize;
  String colorHex;
  NormalText({this.text, this.fontSize = 11, this.colorHex = '#FFFCF2'});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getCustomFont(Color(hexStringToHexInt(colorHex)), fontSize, 'Poppins-Regular'),
    );
  }
}