import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ombre_widget_package/picker/picker/blocs.dart';

class PickerBloc extends Bloc<PickerEvent, PickerState>{
  PickerBloc() : super(UninitializedPicker());

  @override
  Stream<PickerState> mapEventToState(PickerEvent event) async*{
    if(event is SelectColorPicker){
      yield LoadingPicker();
      yield ColorPickerSelected(mainIndex: event.mainIndex, subIndex: event.subIndex);
    }
    else if(event is LoadColorPicker){
      yield LoadingPicker();
      yield ColorPickerLoaded(mainIndex: event.mainIndex, subIndex: event.subIndex);
    }
  }

}