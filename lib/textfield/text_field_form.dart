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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            labelText,
            style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
          ),
        ),
        SizedBox(height: setHeight(8),),
        Container(
          decoration: BoxDecoration(
            color: Color(hexStringToHexInt('#4D574242')),
            borderRadius: BorderRadius.all(Radius.circular(setHeight(61))),
            border: isError ? Border.all(width: setHeight(1), color: Color(hexStringToHexInt('#E5333B'))) : null,
          ),
          child: TextFormField(
            decoration: inputDecoration(placeholder),
            controller: textController,
            style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            onTap: onTap,
            onChanged: onChanged,
            maxLength: maxLength,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: setHeight(8),
          ),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: NormalText(
              text: infoText,
              colorHex: isError ? '#E5333B' : '#FFFCF2',
            ),
          ),
        ),
      ],
    );
  }
}