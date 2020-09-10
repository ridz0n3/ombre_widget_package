import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ombre_widget_package/background/backgroundWidget.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackgroundWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  height: setHeight(130),
                  child: Lottie.asset(
                    'assets/animations/SplashScreenMain.json',
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    repeat: false,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}