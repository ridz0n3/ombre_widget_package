import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/linear_percent_indicator.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class ProgressBar extends StatelessWidget{

  final double percent;
  final String iconName;
  final String percentageStr;
  String platform;
  ProgressBar({this.percent, this.iconName, this.percentageStr, this.platform = 'mobile'});

  @override
  Widget build(BuildContext context) {

    return LinearPercentIndicator(
      animation: true,
      animationDuration: 2500,
      percent: percent,
      linearStrokeCap: LinearStrokeCap.roundAll,
      linearGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0, 0.17, 0.47, 0.69, 1.0],
        colors: [
          Color(hexStringToHexInt('#F89825')),
          Color(hexStringToHexInt('#F26322')),
          Color(hexStringToHexInt('#E5333B')),
          Color(hexStringToHexInt('#C81D5E')),
          Color(hexStringToHexInt('#A91E5E')),
        ],
      ),
      iconName: iconName,
      percentageStr: percentageStr,
      platform: platform,
    );
  }
}