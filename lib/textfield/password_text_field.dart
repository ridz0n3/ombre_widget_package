import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';
import 'package:ombre_widget_package/textfield/password_bloc/password_bloc.dart';

class PasswordTextField extends StatelessWidget{

  final String labelText;
  final String placeholder;
  String infoText;
  bool isError;
  TextInputAction textInputAction;
  final TextEditingController textController;
  final FocusNode focusNode;
  final ValueChanged<String> onFieldSubmitted;
  final ValueChanged<String> onChanged;
  String platform;

  PasswordTextField({
    this.labelText,
    this.placeholder,
    this.textController,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.infoText = '',
    this.isError = false,
    this.platform = 'mobile',
  });

  bool isObscurePasswordText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordBloc>(
      create: (context) => PasswordBloc(),
      child: BlocBuilder<PasswordBloc, PasswordState>(
        builder: (context, state){

          if(state is PasswordShowHide){
            isObscurePasswordText = state.isObscureText;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: setHeight(27),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    labelText,
                    style: getCustomFont(Color(hexStringToHexInt(platform == 'web' ? '#040303' : '#FFFCF2')), 14, 'Poppins-Regular'),
                  ),
                ),
              ),
              SizedBox(height: setHeight(8),),
              TextFormField(
                key: Key('passwordKey'),
                decoration: inputFocusDecoration(placeholder, infoText, isError, isObscure: isObscurePasswordText, platform: platform, onPressed: (){
                  BlocProvider.of<PasswordBloc>(context)..add(ShowHidePassword(isObscureText: !isObscurePasswordText));
                }),
                obscureText: isObscurePasswordText,
                controller: textController,
                style: getCustomFont(Color(hexStringToHexInt(platform == 'web' ? '#040303' : '#FFFCF2')), 14, 'Poppins-Regular'),
                focusNode: focusNode,
                keyboardType: TextInputType.text,
                textInputAction: textInputAction,
                onChanged: onChanged,
                onFieldSubmitted: onFieldSubmitted,
              ),
            ],
          );
        },
      ),
    );
  }

}