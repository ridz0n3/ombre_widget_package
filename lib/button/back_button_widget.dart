import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class BackButtonWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: setHeight(16),
        right: setWidth(8),
      ),
      child: CupertinoButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Container(
          height: setHeight(24),
          width: setHeight(24),
          child: Icon(Platform.isAndroid ? Icons.arrow_back : CupertinoIcons.back, color: Color(hexStringToHexInt('#FDFFFC')),),
        ),
      ),
    );
  }

}