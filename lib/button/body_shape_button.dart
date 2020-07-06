import 'package:flutter/material.dart';
import 'package:ombre_widget_package/button/gradient_button.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class BodyShapeButton extends StatelessWidget{

  bool isSelected;
  final String gender;
  final String bodyShape;
  final VoidCallback onPressed;
  BodyShapeButton({this.gender, this.isSelected = false, this.onPressed, this.bodyShape});

  @override
  Widget build(BuildContext context) {
    return GradientBorderButton(
      onPressed: onPressed,
      isSelected: isSelected,
      child: Container(
        height: setHeight(117),
        width: setWidth(54),
        color: Color(hexStringToHexInt('#040303')),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(setHeight(2)),
            child: Image.asset(
              'assets/images/body_shape/$gender/$bodyShape',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}