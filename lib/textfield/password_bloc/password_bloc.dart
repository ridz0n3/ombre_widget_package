import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ombre_widget_package/helper/utils.dart';

abstract class PasswordState extends Equatable{
  const PasswordState();

  @override
  List<Object> get props => [];
}

class UninitializedPassword extends PasswordState{}

class LoadingPassword extends PasswordState{}

class ValueValidated extends PasswordState{}

class PasswordShowHide extends PasswordState{
  final bool isObscureText;
  PasswordShowHide({this.isObscureText});

  @override
  List<Object> get props => [isObscureText];
}

class PasswordStrengthValidated extends PasswordState{
  final bool hasDigits;
  final bool hasUppercase;
  final bool hasCharLong;
  final bool hasSymbol;
  PasswordStrengthValidated({this.hasDigits, this.hasUppercase, this.hasCharLong, this.hasSymbol});

  @override
  List<Object> get props => [hasDigits, hasUppercase, hasCharLong, hasSymbol];
}

abstract class PasswordEvent extends Equatable{
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class ShowHidePassword extends PasswordEvent{
  final bool isObscureText;
  ShowHidePassword({this.isObscureText});

  @override
  List<Object> get props => [isObscureText];
}

class ValidatePassword1 extends PasswordEvent{}

class ValidatePasswordStrength extends PasswordEvent{
  final String password;
  ValidatePasswordStrength({this.password});

  @override
  List<Object> get props => [password];
}

class PasswordBloc extends Bloc<PasswordEvent, PasswordState>{
  PasswordBloc() : super(UninitializedPassword());

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async*{
    if(event is ShowHidePassword){
      yield LoadingPassword();
      yield PasswordShowHide(isObscureText: event.isObscureText);
    }
    else if(event is ValidatePasswordStrength){
      yield LoadingPassword();

      bool hasDigits = false;
      bool hasUppercase = false;
      bool hasCharLong = false;
      bool hasSymbol = false;
      int i = 0;
      var character = '';

      String tempPassword = event.password;

      if(tempPassword.isNotEmpty){
        if(tempPassword.length >= 12) hasCharLong = true;
        while (i < tempPassword.length){
          character = tempPassword.substring(i,i+1);
          if (isDigit(character , 0)){
            hasDigits=true;
          }else{
            Pattern pattern = r'[!@#$%^&*(),.?":{}|<>]';
            final symbol = RegExp(pattern);
            if (symbol.hasMatch(character)){
              hasSymbol = true;
            }else if (character == character.toUpperCase()){
              hasUppercase=true;
            }
          }

          i++;
        }
      }

      yield PasswordStrengthValidated(
        hasCharLong: hasCharLong,
        hasDigits: hasDigits,
        hasSymbol: hasSymbol,
        hasUppercase: hasUppercase,
      );
    }
    else if(event is ValidatePassword1){
      yield LoadingPassword();
      yield ValueValidated();
    }
  }

}