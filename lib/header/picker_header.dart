import 'package:flutter/material.dart';
import 'package:ombre_widget_package/button/close_button_widget.dart';
import 'package:ombre_widget_package/helper/utils.dart';
import 'normal_text.dart';

class PickerHeader extends StatelessWidget{

  final String title;
  final VoidCallback onTap;
  PickerHeader({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeight(56),
      child: Row(
        children: <Widget>[
          SizedBox(width: setWidth(15),),
          CloseButtonWidget(size: 16,),
          Expanded(
            child: NormalText(
              text: title,
              fontFamily: 'PlayfairDisplay-Bold',
              fontSize: 18,
              textAlign: TextAlign.center,
              align: AlignmentDirectional.center,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: NormalText(
              text: 'Confirm',
              fontFamily: 'Poppins-Bold',
              fontSize: 11,
            ),
          ),
          SizedBox(width: setWidth(9.5),),
        ],
      ),
    );
  }
}