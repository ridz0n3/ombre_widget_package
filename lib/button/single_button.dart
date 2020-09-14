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

  SingleButton({this.isLoading = false, this.isFill = false, this.title, this.onPressed, this.hasImg = false, this.imgName = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(57),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil().setHeight(64))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(64)),
        child: CupertinoButton(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                isFill ? Container(
                  decoration: BoxDecoration(
                    //border: onPressed == null ? Border.all(color: Color(hexStringToHexInt('#a1a1a1'))) : Border.all(color: Color(hexStringToHexInt('#D67154'))),
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(64))),
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
                          style: getCustomFont(Color(hexStringToHexInt('#ffffff')), 14, 'Poppins-Bold'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ) : UnicornOutlineButton(
                  strokeWidth: 2,
                  radius: ScreenUtil().setHeight(64),
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
                      style: getCustomFont(Color(hexStringToHexInt('#ffffff')), 14, 'Poppins-Bold'),
                      textAlign: TextAlign.center,
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