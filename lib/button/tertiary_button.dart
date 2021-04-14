import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class TertiaryButton extends StatelessWidget{

  final String title;
  final bool isSelected;
  final VoidCallback onPressed;
  double fontSize;
  String colorHex;
  TertiaryButton({this.title, this.isSelected = true, this.onPressed, this.fontSize = 14, this.colorHex = '#ffffff'});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: onPressed == null ? 0.5 : 1,
      child: CupertinoButton(
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        child: Container(
          height: setHeight(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: NormalText(
                    text: title,
                    fontSize: fontSize,
                    colorHex: colorHex,
                    fontFamily: 'Poppins-Bold',
                    align: AlignmentDirectional.center,
                  ),
                ),
              ),
              SizedBox(height: setHeight(5),),
              Container(
                height: setHeight(1),
                color: isSelected ? Color(hexStringToHexInt('#F89825')) : Colors.transparent,
                child: NormalText(
                  text: title,
                  fontSize: fontSize,
                  colorHex: colorHex,
                  fontFamily: 'Poppins-Bold',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}