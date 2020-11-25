import 'package:flutter/material.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class GarmentItemWidget extends StatelessWidget{

  bool isSelected;
  final String title;
  final VoidCallback onTap;
  GarmentItemWidget({this.title, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: setHeight(106),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/garment/${title.replaceAll('-', '').toLowerCase()}.png',
              fit: BoxFit.cover,
            ),
            !isSelected ? Container(
              color: Color(hexStringToHexInt('#80040303')),
            ) :
            Padding(
              padding: EdgeInsets.only(
                top: setHeight(16),
                left: setHeight(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: setHeight(29),
                    width: setHeight(29),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(setHeight(29)),
                        color: Color(hexStringToHexInt('#80040303'))
                    ),
                    child: Center(
                      child: Icon(Icons.check, color: Color(hexStringToHexInt('#FDFFFC')),),
                    ),
                  ),
                ],
              ),
            ),
            NormalText(
              text: title,
              fontFamily: 'Poppins-Bold',
              fontSize: 14,
              align: AlignmentDirectional.center,
            ),
          ],
        ),
      ),
    );
  }
}