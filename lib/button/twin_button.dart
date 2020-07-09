import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ombre_widget_package/button/gradient_button.dart';

import '../helper/utils.dart';

class TwinButton extends StatelessWidget{

  final VoidCallback nextBtnPressed;
  final VoidCallback backBtnPressed;
  bool isLoading;
  String nextTitle;
  String backTitle;

  TwinButton({
    this.isLoading = false,
    this.nextTitle = 'Yes',
    this.backTitle = 'No',
    this.nextBtnPressed,
    this.backBtnPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(40),
      child: GradientBorderButton(
        onPressed: null,
        hasRadius: false,
        isSelected: true,
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
                            color: Color(hexStringToHexInt('#E5040303')),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(setHeight(24)),
                            ),
                          ),
                          child: Center(
                            child: Text(backTitle,
                              style: getCustomFont(Color(hexStringToHexInt('#FDFFFC')), 14, 'Poppins-Bold'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: backTitle != 'No' ? backBtnPressed : (){
                      Navigator.pop(context);
                    },
                  ),
                ),//cancel button
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
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(ScreenUtil().setHeight(40))),
                              ),
                              child: Center(
                                child: isLoading ? loadIndicator(isFill: true) : Text(nextTitle,
                                  style: getCustomFont(Color(hexStringToHexInt('#FDFFFC')), 14, 'Poppins-Bold'),
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
    );
  }

}