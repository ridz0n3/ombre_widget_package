import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class MenuButtonWidget extends StatelessWidget{

  final VoidCallback onPressed;
  final String title;
  final String imageName;
  MenuButtonWidget({this.title, this.imageName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(0),
      child: Container(
        height: setHeight(56),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: setHeight(8),
                left: setWidth(38.5),
                right: setWidth(38.5),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    height: setHeight(16),
                    width: setWidth(17),
                    child: Image.asset('assets/images/menu/$imageName.png'),
                  ),
                  SizedBox(width: setWidth(11),),
                  NormalText(
                    text: title,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: setHeight(17),
                left: setWidth(24),
                right: setWidth(24),
              ),
              child: Container(
                height: setHeight(1),
                color: Color(hexStringToHexInt('#463434')),
              ),
            ),
            SizedBox(height: setHeight(8),)
          ],
        ),
      ),
    );
  }
}