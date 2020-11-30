import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class MenuButtonWidget extends StatelessWidget{

  final VoidCallback onPressed;
  final String title;
  final String imageName;
  bool hasIcon;
  bool isSelected;
  String subTitle;
  MenuButtonWidget({this.title, this.imageName, this.onPressed, this.hasIcon = true, this.subTitle = '', this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(0),
      child: Container(
        height: setHeight(56),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: setHeight(8),
                left: setWidth(hasIcon ? 38.5 : 24),
                right: setWidth(hasIcon ? 38.5 : 24),
              ),
              child: Row(
                children: <Widget>[
                  hasIcon ? Padding(
                    padding: EdgeInsets.only(
                      right: setWidth(11),
                    ),
                    child: Container(
                      height: setHeight(16),
                      width: setWidth(17),
                      child: Image.asset('assets/images/menu/$imageName.png'),
                    ),
                  ) : Container(),
                  Expanded(
                    child: NormalText(
                      text: title,
                    ),
                  ),
                  NormalText(
                    text: subTitle,
                    fontFamily: 'Poppins-Bold',
                  ),
                  isSelected ? Icon(Icons.check, color: Colors.white, size: setHeight(14),) : Container(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: setHeight(17),
                left: setWidth(24),
                right: setWidth(24),
              ),
              child: Container(
                height: setHeight(1),
                color: Color(hexStringToHexInt('#463434')),
              ),
            ),
            SizedBox(height: setHeight(8),)
          ],
        ),
      ),
    );
  }
}