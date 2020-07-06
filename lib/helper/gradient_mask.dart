import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class RadiantGradientMask extends StatelessWidget {
  final Widget child;
  String firstColor;
  String secondColor;

  RadiantGradientMask({this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
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
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}