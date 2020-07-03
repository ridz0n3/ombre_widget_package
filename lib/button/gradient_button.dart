import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class GradientBorderButton extends StatelessWidget{

  bool isSelected;
  final VoidCallback onPressed;
  final Widget child;
  GradientBorderButton({this.onPressed, this.child, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? null : Color(hexStringToHexInt('#040303')),
          borderRadius: BorderRadius.circular(setHeight(25)),
          gradient: isSelected ? LinearGradient(
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
        child: Padding(
          padding: EdgeInsets.all(setHeight(1)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(setHeight(25)),
            child: child,
          ),
        ),
      ),
    );
  }
}