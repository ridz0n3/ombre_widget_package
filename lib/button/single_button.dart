import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/utils.dart';

class SingleButton extends StatelessWidget{

  final VoidCallback onPressed;
  bool isLoading;
  bool isFill;
  String title;

  SingleButton({this.isLoading = false, this.isFill = false, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(57),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil().setHeight(64))
      ),
      child: Material(
        elevation: ScreenUtil().setHeight(2),
        shadowColor: Color(hexStringToHexInt('#40BB2034')),
        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(64)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().setHeight(64)),
          child: CupertinoButton(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    //border: onPressed == null ? Border.all(color: Color(hexStringToHexInt('#a1a1a1'))) : Border.all(color: Color(hexStringToHexInt('#D67154'))),
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(64))),
                    color: Color(hexStringToHexInt('#ffffff')),
                    gradient: isFill ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.17, 0.47, 0.69, 1.0],
                      colors: [
                        Color(hexStringToHexInt('#F89825')),
                        Color(hexStringToHexInt('#F26322')),
                        Color(hexStringToHexInt('#E5333B')),
                        Color(hexStringToHexInt('#C81D5E')),
                        Color(hexStringToHexInt('#A91E5E')),
                      ],
                    ) : null,
                  ),
                  child: Center(
                    child: isLoading ? loadIndicator(isFill: isFill) : Text(title.toUpperCase(),
                      style: getCustomFont(Color(hexStringToHexInt(isFill ? '#ffffff' : '#D67154')), 14, 'Poppins-Bold'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: isLoading ? null : onPressed
          ),
        ),
      ),
    );
  }

}