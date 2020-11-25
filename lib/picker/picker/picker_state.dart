import 'package:equatable/equatable.dart';

abstract class PickerState extends Equatable{
  const PickerState();

  @override
  List<Object> get props => [];
}

class UninitializedPicker extends PickerState{}

class LoadingPicker extends PickerState{}

class ColorPickerSelected extends PickerState{
  final int mainIndex;
  final subIndex;

  ColorPickerSelected({this.mainIndex, this.subIndex});

  @override
  List<Object> get props => [mainIndex, subIndex];
}