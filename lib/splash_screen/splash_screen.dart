import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie_flutter/lottie_flutter.dart';
import 'package:ombre_widget_package/background/backgroundWidget.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  AnimationController _controller;
  LottieComposition _composition;

  @override
  void initState() {
    super.initState();
    prepareAnimation("assets/animations/SplashScreenMain.json");
    _controller = new AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

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
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: setHeight(240),
                        height: setHeight(240),
                        child: Lottie(
                          composition: _composition,
                          size: Size(
                            setHeight(240),
                            setHeight(340),
                          ),
                          controller: _controller,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: setHeight(20),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  prepareAnimation(String assetName) async{

    loadAsset(assetName).then((LottieComposition composition) {
      setState(() {
        _composition = composition;
        _controller.forward();
      });
    });

  }

  Future<LottieComposition> loadAsset(String assetName) async {
    return await rootBundle
        .loadString(assetName)
        .then<Map<String, dynamic>>((String data) => json.decode(data))
        .then((Map<String, dynamic> map) => new LottieComposition.fromMap(map));
  }
}