import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class SearchTextField extends StatelessWidget{

  final String placeholder;
  final ValueChanged<String> onChanged;
  final String fieldKey;
  final FocusNode focusNode;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController textController;
  final GestureTapCallback onTap;

  SearchTextField({
    this.placeholder,
    this.onFieldSubmitted,
    this.onChanged,
    this.fieldKey,
    this.focusNode,
    this.textController,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(fieldKey),
      decoration: inputDecoration(placeholder, top: 1, left: 0),
      controller: textController,
      style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 11, 'Poppins-Regular'),
      focusNode: focusNode,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (value){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}