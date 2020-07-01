import 'package:flutter/material.dart';
import 'package:ombre_widget_package/button/gradient_button.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class GenderButton extends StatelessWidget{

  final String gender, selectedGender;
  final VoidCallback onPressed;
  GenderButton({this.gender, this.selectedGender, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GradientBorderButton(
      onPressed: onPressed,
      isSelected: gender == selectedGender ? true : false,
      child: Container(
        color: Color(hexStringToHexInt('#040303')),
        child: Column(
          children: <Widget>[
            Expanded(child: Image.asset('assets/images/$gender.png', fit: BoxFit.fitHeight)),
            Container(
              height: setHeight(70),
              child: Center(
                child: Text(
                  capitalize(gender),
                  style: getCustomFont(Color(hexStringToHexInt('#FDFFFC')), 19, 'Poppins-Bold'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}