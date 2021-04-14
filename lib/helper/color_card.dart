import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class ColorCard extends StatelessWidget{

  final String colorHex;
  final VoidCallback onPressed;
  final bool isSelected;

  ColorCard({this.colorHex, this.onPressed, this.isSelected});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onPressed,
      child: Container(
        color: Color(hexStringToHexInt(colorHex)),
        child: isSelected ? Center(
          child: Padding(
            padding: EdgeInsets.all(setHeight(0)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: Color(hexStringToHexInt('#80040303')),
                  size: setHeight(29),
                ),
              ),
            ),
          ),
        ) : Container(),

      ),
    );

  }

}