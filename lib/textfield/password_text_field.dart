import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ombre_widget_package/helper/utils.dart';
import 'package:ombre_widget_package/textfield/password_bloc/password_bloc.dart';

class PasswordTextField extends StatelessWidget{

  final String labelText;
  final String placeholder;
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
                  style: getCustomFont(Color(hexStringToHexInt('#373A4D')), 12, 'Roboto-Regular'),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(4),),
              Container(
                height: ScreenUtil().setHeight(48),
                decoration: BoxDecoration(
                  color: Color(hexStringToHexInt('#F5F5FA')),
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(2))),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
                      child: TextFormField(
                        decoration: inputDecoration(placeholder),
                        obscureText: isObscurePasswordText,
                        controller: textController,
                        style: getCustomFont(Colors.black, 14, 'Roboto-Regular'),
                        focusNode: focusNode,
                        keyboardType: TextInputType.text,
                        textInputAction: textInputAction,
                        onChanged: onChanged,
                        onFieldSubmitted: onFieldSubmitted,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: CupertinoButton(
                        minSize: ScreenUtil().setHeight(48),
                        padding: const EdgeInsets.all(0.0),
                        onPressed: (){
                          BlocProvider.of<PasswordBloc>(context)..add(ShowHidePassword(isObscureText: !isObscurePasswordText));
                        },
                        child: Container(
                          width: ScreenUtil().setHeight(48),
                          height: ScreenUtil().setHeight(48),
                          child: Icon(
                            !isObscurePasswordText ? Icons.visibility_off : Icons.visibility,
                            size: ScreenUtil().setWidth(20),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}