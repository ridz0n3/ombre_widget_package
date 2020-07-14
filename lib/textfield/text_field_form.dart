import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class TextFieldForm extends StatelessWidget{

  final String labelText;
  final String placeholder;
  String infoText;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  int maxLength;
  bool isError;
  final TextEditingController textController;
  final FocusNode focusNode;
  final ValueChanged<String> onFieldSubmitted;
  final GestureTapCallback onTap;
  final ValueChanged<String> onChanged;
  final String fieldKey;
  final FocusNode nextFocusNode;

  TextFieldForm({
    this.labelText,
    this.placeholder,
    this.textController,
    this.focusNode,
    this.onFieldSubmitted,
    this.onTap,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLength = 100,
    this.infoText = '',
    this.isError = false,
    this.fieldKey,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: setHeight(27),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              labelText,
              style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
            ),
          ),
        ),
        SizedBox(height: setHeight(8),),
        TextFormField(
          key: Key(fieldKey),
          decoration: inputFocusDecoration(placeholder, infoText, isError),
          controller: textController,
          style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: (value){
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          onChanged: onChanged,
          maxLength: maxLength,
        ),
      ],
    );
  }
}