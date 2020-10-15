import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

import 'gradient_button.dart';

class MainTwinButton extends StatelessWidget{

  final VoidCallback nextBtnPressed;
  final VoidCallback backBtnPressed;
  final bool canBack;
  bool isLoading;
  String nextTitle;
  String backTitle;

  MainTwinButton({this.canBack, this.isLoading = false, this.nextTitle = 'Next', this.backTitle = 'Previous', this.nextBtnPressed, this.backBtnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeight(40),
      decoration: BoxDecoration(
        //border: Border.all(color: Color(hexStringToHexInt('#D67154'))),
        borderRadius: BorderRadius.all(Radius.circular(setHeight(40))),
      ),
      child: Material(
        elevation: setHeight(2),
        shadowColor: Color(hexStringToHexInt('#40BB2034')),
        borderRadius: BorderRadius.circular(setHeight(40)),
        child: GradientBorderButton(
          onPressed: null,
          isSelected: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(setHeight(40)),
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CupertinoButton(
                        pressedOpacity: 0.7,
                        padding: const EdgeInsets.all(0.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Container(
                              color: Color(hexStringToHexInt('#040303')),
                              child: Center(
                                child: Text(backTitle.toUpperCase(),
                                  style: getCustomFont(Color(hexStringToHexInt(canBack ? '#ffffff' : '#d2d2d2')), 14, 'Poppins-Bold'),
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
                                    color: Color(hexStringToHexInt(nextBtnPressed != null ? '#505050' : '#A1A1A1')),
                                    //border: Border.all(color: Color(hexStringToHexInt(nextBtnPressed != null ?'#D67154' : '#A1A1A1'))),
                                    //borderRadius: BorderRadius.only(topRight: Radius.circular(setHeight(40)), bottomRight: Radius.circular(setHeight(40))),
                                  ),
                                  child: Center(
                                    child: isLoading ? loadIndicator(isFill: true) : Text(nextTitle.toUpperCase(),
                                      style: getCustomFont(Color(hexStringToHexInt('#ffffff')), 14, 'Poppins-Bold'),
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
      ),
    );
  }

}