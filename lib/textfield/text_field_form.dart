import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class TextFieldForm extends StatelessWidget{

  final String labelText;
  final String placeholder;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  int maxLength;
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
      ],
    );
  }

  InputDecoration inputDecoration(String placeholder){
    return InputDecoration(
      labelText: '$placeholder',
      labelStyle: getCustomFont(Color(hexStringToHexInt('#4DFFFCF2')), 14, 'Poppins-Regular'),
      hasFloatingPlaceholder: false,
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
      contentPadding: EdgeInsets.only(
        top: setHeight(17),
        bottom: setHeight(17),
        left: setWidth(28),
        right: setWidth(28),
      ),
      counterText: "",
      focusedBorder:OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}