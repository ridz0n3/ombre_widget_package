import 'package:flutter/cupertino.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class LogoImg extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/ombreLogo.png',
        height: setHeight(55.16),
        width: setWidth(65.58),
      ),
    );
  }
}