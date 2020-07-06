import 'package:flutter/cupertino.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class NormalText extends StatelessWidget{

  final String text;
  double fontSize;
  String colorHex;
  AlignmentDirectional align;
  NormalText({this.text, this.fontSize = 11, this.colorHex = '#FFFCF2', this.align = AlignmentDirectional.centerStart});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Text(
        text,
        style: getCustomFont(Color(hexStringToHexInt(colorHex)), fontSize, 'Poppins-Regular'),
      ),
    );
  }
}