import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';
import 'package:shimmer/shimmer.dart';

class LoadingProductWidget extends StatelessWidget{

  final double imageHeight;
  bool isEnabled;
  LoadingProductWidget({this.imageHeight, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: setWidth(130),
      child: Padding(
        padding: EdgeInsets.only(
          right: setWidth(16),
        ),
        child: Stack(
          children: [
            Shimmer.fromColors(
              enabled: isEnabled,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: setHeight(imageHeight),
                      color: Colors.white,
                    ),
                    SizedBox(height: setHeight(8),),
                  ],
                ),
              ),
              baseColor: Color(hexStringToHexInt('#171111')),
              highlightColor: Color(hexStringToHexInt('#463434')),
            ),
            Opacity(
              opacity: 0.2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: setHeight(imageHeight),
                      color: Color(hexStringToHexInt('#463434')),
                    ),
                    SizedBox(height: setHeight(8),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}