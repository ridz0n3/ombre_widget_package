import 'package:flutter/material.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class PasswordRule extends StatelessWidget{
  final String title;
  final bool isContain;
  PasswordRule({this.title, this.isContain});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: setHeight(10),
          width: setHeight(10),
          decoration: BoxDecoration(
            border: Border.all(width: setHeight(1), color: isContain ? Colors.transparent : Color(hexStringToHexInt('#FFFCF2'))),
            borderRadius: BorderRadius.circular(setHeight(10)),
            gradient: isContain ? LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.17, 0.47, 0.69, 1.0],
              colors: [
                Color(hexStringToHexInt('#F89825')),
                Color(hexStringToHexInt('#F26322')),
                Color(hexStringToHexInt('#E5333B')),
                Color(hexStringToHexInt('#C81D5E')),
                Color(hexStringToHexInt('#A91E5E')),
              ],
            ) : null,
          ),
        ),
        SizedBox(width: setWidth(7),),
        Expanded(
          child: Container(
            height: setHeight(21),
            child: NormalText(
              text: title,
            ),
          ),
        ),
      ],
    );
  }
}