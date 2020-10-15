import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ombre_widget_package/helper/gradient_border.dart';

import '../helper/utils.dart';

class SingleButton extends StatelessWidget{

  final VoidCallback onPressed;
  bool isLoading;
  bool isFill;
  String title;
  bool hasImg;
  String imgName;
  double height;
  double fontSize;
  String type;

  SingleButton({this.fontSize = 14, this.height = 57, this.isLoading = false, this.isFill = false, this.title, this.onPressed, this.hasImg = false, this.imgName = '', this.type = 'mobile'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(height),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil().setHeight(height))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(height)),
        child: CupertinoButton(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                isFill ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ScreenUtil().setHeight(height)),
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 0.17, 0.47, 0.69, 1.0],
                      colors: [
                        Color(hexStringToHexInt('#F89825')),
                        Color(hexStringToHexInt('#F26322')),
                        Color(hexStringToHexInt('#E5333B')),
                        Color(hexStringToHexInt('#C81D5E')),
                        Color(hexStringToHexInt('#A91E5E')),
                      ],
                    ),
                  ),
                  child: Center(
                    child: isLoading ? loadIndicator(isFill: isFill) : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        hasImg ? Padding(
                          padding: EdgeInsets.only(
                              right: setWidth(11)
                          ),
                          child: Image.asset(
                            'assets/images/$imgName.png',
                            height: setHeight(18),
                            width: setHeight(18),
                          ),
                        ) : Container(),
                        Text(title,
                          style: getCustomFont(Color(hexStringToHexInt('#ffffff')), fontSize, 'Poppins-Bold'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ) : type == 'mobile' ? UnicornOutlineButton(
                  strokeWidth: 2,
                  radius: ScreenUtil().setHeight(height),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.0, 0.17, 0.47, 0.69, 1.0],
                    colors: [
                      Color(hexStringToHexInt('#F89825')),
                      Color(hexStringToHexInt('#F26322')),
                      Color(hexStringToHexInt('#E5333B')),
                      Color(hexStringToHexInt('#C81D5E')),
                      Color(hexStringToHexInt('#A91E5E')),
                    ],
                  ),
                  child: Center(
                    child: isLoading ? loadIndicator(isFill: isFill) : Text(title,
                      style: getCustomFont(Color(hexStringToHexInt('#ffffff')), fontSize, 'Poppins-Bold'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ) : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ScreenUtil().setHeight(height)),
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 0.17, 0.47, 0.69, 1.0],
                      colors: [
                        Color(hexStringToHexInt('#F89825')),
                        Color(hexStringToHexInt('#F26322')),
                        Color(hexStringToHexInt('#E5333B')),
                        Color(hexStringToHexInt('#C81D5E')),
                        Color(hexStringToHexInt('#A91E5E')),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(setHeight(1)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(height)),
                        color: Color(hexStringToHexInt('#040303')),
                      ),
                      child: Center(
                        child: isLoading ? loadIndicator(isFill: isFill) : Text(title,
                          style: getCustomFont(Color(hexStringToHexInt('#ffffff')), fontSize, 'Poppins-Bold'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: isLoading ? null : onPressed
        ),
      ),
    );
  }

}