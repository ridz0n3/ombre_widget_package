import 'package:equatable/equatable.dart';

abstract class PickerEvent extends Equatable{
  const PickerEvent();

  @override
  List<Object> get props => [];
}

class SelectColorPicker extends PickerEvent{
  final int mainIndex;
  final subIndex;

  SelectColorPicker({this.mainIndex, this.subIndex});

  @override
  List<Object> get props => [mainIndex, subIndex];
}

class LoadColorPicker extends PickerEvent{
  final int mainIndex;
  final subIndex;

  LoadColorPicker({this.mainIndex, this.subIndex});

  @override
  List<Object> get props => [mainIndex, subIndex];
}