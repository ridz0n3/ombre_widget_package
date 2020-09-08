import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class CloseButtonWidget extends StatelessWidget{

  String colorHex;
  double size;
  final VoidCallback onPressed;
  CloseButtonWidget({this.colorHex = '#FFFCF2', this.onPressed, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: () => onPressed != null ? onPressed : Navigator.pop(context),
      child: Container(
        height: setHeight(size),
        width: setHeight(size),
        child: Icon(
          CupertinoIcons.clear_thick,
          size: setHeight(size),
          color: Color(hexStringToHexInt(colorHex)),
        ),
      ),
    );
  }
}