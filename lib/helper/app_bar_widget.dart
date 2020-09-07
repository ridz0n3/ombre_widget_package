import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class AppBarWidget extends StatelessWidget{

  final List<Widget> children;
  AppBarWidget({this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeight(Platform.isAndroid ? 65 : 75),
      child: Row(
        children: children,
      ),
    );
  }
}