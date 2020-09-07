import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class CloseButtonWidget extends StatelessWidget{

  String colorHex;
  final VoidCallback onPressed;
  CloseButtonWidget({this.colorHex = '#FFFCF2', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: () => onPressed != null ? onPressed : Navigator.pop(context),
      child: Container(
        height: setHeight(24),
        width: setHeight(24),
        child: Icon(
          CupertinoIcons.clear_thick,
          size: setHeight(24),
          color: Color(hexStringToHexInt(colorHex)),
        ),
      ),
    );
  }
}