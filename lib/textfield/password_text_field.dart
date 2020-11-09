import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ombre_widget_package/helper/password_rule.dart';
import 'package:ombre_widget_package/helper/utils.dart';
import 'package:ombre_widget_package/textfield/password_bloc/password_bloc.dart';

class PasswordTextField extends StatelessWidget{

  final String labelText;
  final String placeholder;
  String infoText;
  bool isError;
  bool hasRule;
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
    this.hasRule = false,
  });

  bool isObscurePasswordText = true;
  bool hasDigits = false;
  bool hasUppercase = false;
  bool hasCharLong = false;
  bool hasSymbol = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordBloc>(
      create: (context) => PasswordBloc(),
      child: BlocBuilder<PasswordBloc, PasswordState>(
        builder: (context, state){

          if(state is PasswordShowHide){
            isObscurePasswordText = state.isObscureText;
          }

          if(state is PasswordStrengthValidated){
            hasDigits = state.hasDigits;
            hasUppercase = state.hasUppercase;
            hasCharLong = state.hasCharLong;
            hasSymbol = state.hasSymbol;
          }

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: setHeight(hasRule ? 4 : 0),
                  left: setHeight(hasRule ? 4 : 0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: setHeight(27),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          labelText,
                          style: getCustomFont(Color(hexStringToHexInt(platform == 'web' ? '#040303' : '#FFFCF2')), platform == 'web' ? 11 : 14, 'Poppins-Regular'),
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
                      style: getCustomFont(Color(hexStringToHexInt(platform == 'web' ? '#040303' : '#FFFCF2')), platform == 'web' ? 11 : 14, 'Poppins-Regular'),
                      focusNode: focusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: textInputAction,
                      onChanged: hasRule ? (value) {
                        BlocProvider.of<PasswordBloc>(context)..add(ValidatePasswordStrength(password: value));
                      } : onChanged,
                      onFieldSubmitted: onFieldSubmitted,
                    ),
                  ],
                ),
              ),
              hasRule ? Padding(
                padding: EdgeInsets.only(
                  top: setHeight(7.63),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(child: PasswordRule(title: '8 characters minimum', isContain: textController.text.length >= 8 && textController.text.length < 12 ? false : hasCharLong, isWarning: textController.text.length >= 8 && textController.text.length < 12 ? true : false,)),
                        Expanded(child: PasswordRule(title: 'Atleast one symbol', isContain: hasSymbol)),
                      ],
                    ),
                    SizedBox(height: setHeight(4),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(child: PasswordRule(title: 'Atleast one number', isContain: hasDigits)),
                        Expanded(child: PasswordRule(title: 'Atleast one capital case', isContain: hasUppercase)),
                      ],
                    ),
                  ],
                ),
              ) : Container(),
            ],
          );
        },
      ),
    );
  }

}