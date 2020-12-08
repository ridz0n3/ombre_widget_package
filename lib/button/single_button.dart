import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String colorHex;
  bool isActive;

  SingleButton({this.isActive = true, this.colorHex = '', this.fontSize = 14, this.height = 57, this.isLoading = false, this.isFill = false, this.title, this.onPressed, this.hasImg = false, this.imgName = '', this.type = 'mobile'});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActive ? 1 : 0.5,
      child: Container(
        height: setHeight(height),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(setHeight(height))
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(setHeight(height)),
          child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  isFill ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(setHeight(height)),
                      color: colorHex != '' ? Color(hexStringToHexInt(colorHex)) : Colors.white,
                      gradient: colorHex != '' ? null : LinearGradient(
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
                    radius: setHeight(height),
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
                      child: isLoading ? Container(child: loadIndicator(isFill: !isFill), height: setHeight(30), width: setHeight(30)) : Text(title,
                        style: getCustomFont(Color(hexStringToHexInt('#ffffff')), fontSize, 'Poppins-Bold'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ) : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(setHeight(height)),
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
                          borderRadius: BorderRadius.circular(setHeight(height)),
                          color: Color(hexStringToHexInt('#ffffff')),
                        ),
                        child: Center(
                          child: isLoading ? loadIndicator(isFill: isFill) : Text(title,
                            style: getCustomFont(Color(hexStringToHexInt('#040303')), fontSize, 'Poppins-Bold'),
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
      ),
    );
  }

}