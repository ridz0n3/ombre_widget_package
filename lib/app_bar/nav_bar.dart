import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class NavBar extends StatelessWidget{

  final String title;
  bool hasBack;
  NavBar({this.title, this.hasBack = true});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: hasBack,
      title: Text(title, style: TextStyle(color: Colors.white)),
      leading: hasBack ? new IconButton(
        icon: new Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ) : null,
      backgroundColor: Color(hexStringToHexInt('#040303')),
    );
  }
}