import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ombre_widget_package/button/back_button_widget.dart';
import 'package:ombre_widget_package/button/close_button_widget.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class AppBarWidget extends StatelessWidget{

  final List<Widget> children;
  final String title;
  bool hasClose;
  Color bgColor;
  AppBarWidget({this.children, this.title, this.hasClose = false, this.bgColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return children != null ? Container(
      color: bgColor,
      height: setHeight(65),
      child: Row(
        children: children,
      ),
    ) :
    Container(
      color: bgColor,
      height: setHeight(65),
      child: Stack(
        children: <Widget>[
          hasClose ? CloseButtonWidget(size: 11.5) : BackButtonWidget(),
          Padding(
            padding: EdgeInsets.only(
              top: setHeight(16),
            ),
            child: NormalText(
              text: title,
              fontSize: 18,
              fontFamily: 'PlayfairDisplay-Bold',
              textAlign: TextAlign.center,
              align: AlignmentDirectional.center,
            ),
          ),
        ],
      ),
    );
  }
}