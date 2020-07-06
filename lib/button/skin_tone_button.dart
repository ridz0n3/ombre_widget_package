import 'package:flutter/material.dart';
import 'package:ombre_widget_package/button/gradient_button.dart';
import 'package:ombre_widget_package/helper/gradient_mask.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class SkinToneButton extends StatelessWidget{

  bool isSelected;
  final String skinToneHex;
  final VoidCallback onPressed;
  SkinToneButton({this.isSelected = false, this.onPressed, this.skinToneHex});

  @override
  Widget build(BuildContext context) {
    return GradientBorderButton(
      isSelected: isSelected,
      onPressed: onPressed,
      child: Container(
        height: setHeight(45),
        width: setHeight(45),
        color: Color(hexStringToHexInt(skinToneHex)),
        child: isSelected ? Center(
          child: RadiantGradientMask(
            child: Icon(
              Icons.check_circle,
              size: setHeight(29),
              color: Colors.white,
            ),
          ),
        ) : Container(),
      ),
    );
  }
}