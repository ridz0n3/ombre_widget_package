import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../helper/utils.dart';

class TwinButton extends StatelessWidget{

  final VoidCallback nextBtnPressed;
  final VoidCallback backBtnPressed;
  final bool canBack;
  bool isLoading;
  String nextTitle;
  String backTitle;

  TwinButton({this.canBack, this.isLoading = false, this.nextTitle = 'Next', this.backTitle = 'Previous', this.nextBtnPressed, this.backBtnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(2)),
      ),
      child: Material(
        elevation: ScreenUtil().setHeight(2),
        shadowColor: Color(hexStringToHexInt('#40BB2034')),
        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(40)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().setHeight(40)),
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(0.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(hexStringToHexInt(canBack ? '#D67154' : '#d2d2d2'))),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(ScreenUtil().setHeight(40)), bottomLeft: Radius.circular(ScreenUtil().setHeight(40))),
                            ),
                            child: Center(
                              child: Text(backTitle.toUpperCase(),
                                style: getCustomFont(Color(hexStringToHexInt(canBack ? '#D67154' : '#d2d2d2')), 14, 'Roboto-Regular'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: canBack ? backTitle != 'Previous' ? backBtnPressed : (){
                        Navigator.pop(context);
                      } : null,
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(0.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    stops: [0.0, 1.0],
                                    colors: [
                                      Color(hexStringToHexInt('#D67154')),
                                      Color(hexStringToHexInt('#BB2034')),
                                    ],
                                  ),
                                  color: Color(hexStringToHexInt(nextBtnPressed != null ? '#505050' : '#A1A1A1')),
                                  border: Border.all(color: Color(hexStringToHexInt(nextBtnPressed != null ?'#D67154' : '#A1A1A1'))),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(ScreenUtil().setHeight(40)), bottomRight: Radius.circular(ScreenUtil().setHeight(40))),
                                ),
                                child: Center(
                                  child: isLoading ? loadIndicator(isFill: true) : Text(nextTitle.toUpperCase(),
                                    style: getCustomFont(Color(hexStringToHexInt('#ffffff')), 14, 'Roboto-Regular'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              nextBtnPressed == null ? Opacity(
                                opacity: 0.7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: [0.0, 1.0],
                                      colors: [
                                        Color(hexStringToHexInt('#F1F3F5')),
                                        Color(hexStringToHexInt('#DEE2E6')),
                                      ],
                                    )
                                  ),
                                ),
                              ) : Container(),
                            ],
                          ),
                        ],
                      ),
                      onPressed: isLoading ? null : nextBtnPressed,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}