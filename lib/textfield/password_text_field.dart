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
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  labelText,
                  style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
                ),
              ),
              SizedBox(height: setHeight(8),),
              Container(
                height: setHeight(61),
                decoration: BoxDecoration(
                  color: Color(hexStringToHexInt('#4D574242')),
                  borderRadius: BorderRadius.all(Radius.circular(setHeight(61))),
                  border: isError ? Border.all(width: setHeight(1), color: Color(hexStringToHexInt('#E5333B'))) : null,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        decoration: inputDecoration(placeholder),
                        obscureText: isObscurePasswordText,
                        controller: textController,
                        style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
                        focusNode: focusNode,
                        keyboardType: TextInputType.text,
                        textInputAction: textInputAction,
                        onChanged: onChanged,
                        onFieldSubmitted: onFieldSubmitted,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: setWidth(28)
                      ),
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: CupertinoButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: (){
                            BlocProvider.of<PasswordBloc>(context)..add(ShowHidePassword(isObscureText: !isObscurePasswordText));
                          },
                          child: Container(
                            child: Icon(
                              !isObscurePasswordText ? Icons.visibility_off : Icons.visibility,
                              size: ScreenUtil().setWidth(20),
                              color: Color(hexStringToHexInt('#FFFCF2')),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
        },
      ),
    );
  }

}