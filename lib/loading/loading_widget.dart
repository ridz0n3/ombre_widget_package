import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class LoadingWidget extends StatelessWidget{

  final double height;
  LoadingWidget({this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            height: setHeight(height),
            child: Lottie.asset(
              'assets/animations/loading.json',
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }
}