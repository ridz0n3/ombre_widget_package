import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/gradient_border.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class SocialMediaButton extends StatelessWidget{

  final String type;
  bool isLoading;
  final String title;
  final VoidCallback onPressed;
  SocialMediaButton({this.type, this.title, this.isLoading = false, this.onPressed});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: setHeight(57),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(setHeight(64))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(setHeight(64)),
        child: CupertinoButton(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                SocialMediaUnicornOutlineButton(
                  strokeWidth: 2,
                  radius: setHeight(64),
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
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: setWidth(34.5),
                      right: setWidth(24.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/$type.png', height: setHeight(18), width: setHeight(18),),
                        Expanded(
                          child: Text(
                            title,
                            style: getCustomFont(Color(hexStringToHexInt('#ffffff')), 14, 'Poppins-Bold'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            onPressed: onPressed
        ),
      ),
    );

  }
}