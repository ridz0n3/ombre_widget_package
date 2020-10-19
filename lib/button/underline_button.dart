import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class UnderlineButton extends StatelessWidget{

  final String title;
  final double width;
  final VoidCallback onPressed;
  double fontSize;
  String colorHex;
  UnderlineButton({this.title, this.width, this.onPressed, this.fontSize = 14, this.colorHex = '#ffffff'});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        width: ScreenUtil().setWidth(width),
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                title,
                style: getCustomFont(Color(hexStringToHexInt(colorHex)), fontSize, 'Poppins-Bold'),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(5),),
            Container(
              height: ScreenUtil().setHeight(1),
              color: Color(hexStringToHexInt('#F89825')),
            )
          ],
        ),
      ),
    );
  }
}