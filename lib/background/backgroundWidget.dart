import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class BackgroundWidget extends StatelessWidget{
  String color;
  BackgroundWidget({this.color = '#040303'});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(hexStringToHexInt(color)),
    );
  }
}