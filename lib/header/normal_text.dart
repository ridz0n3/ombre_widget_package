import 'package:flutter/cupertino.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class NormalText extends StatelessWidget{

  final String text;
  double fontSize;
  String colorHex;
  AlignmentDirectional align;
  String fontFamily;
  NormalText({
    this.text,
    this.fontSize = 11,
    this.colorHex = '#FFFCF2',
    this.align = AlignmentDirectional.centerStart,
    this.fontFamily = 'Poppins-Regular'
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Text(
        text,
        style: getCustomFont(Color(hexStringToHexInt(colorHex)), fontSize, fontFamily),
      ),
    );
  }
}