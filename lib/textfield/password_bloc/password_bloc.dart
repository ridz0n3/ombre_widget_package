import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PasswordState extends Equatable{
  const PasswordState();

  @override
  List<Object> get props => [];
}

class UninitializedPassword extends PasswordState{}

class LoadingPassword extends PasswordState{}

class PasswordShowHide extends PasswordState{
  final bool isObscureText;
  PasswordShowHide({this.isObscureText});

  @override
  List<Object> get props => [isObscureText];
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

class PasswordBloc extends Bloc<PasswordEvent, PasswordState>{
  PasswordBloc() : super(UninitializedPassword());

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async*{
    if(event is ShowHidePassword){
      yield LoadingPassword();
      yield PasswordShowHide(isObscureText: event.isObscureText);
    }
  }

}