import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ombre_widget_package/helper/constant.dart';
import 'package:ombre_widget_package/helper/utils.dart';
import 'package:ombre_widget_package/picker/picker/blocs.dart';

import 'color_card.dart';

typedef void ColorPickerCallback(int mainIndex, int subIndex);

class ColorPickerWidget extends StatelessWidget{

  final ColorPickerCallback onChanged;
  bool shrinkWrap;
  ScrollPhysics physics;
  ColorPickerWidget({this.onChanged, this.shrinkWrap = false, this.physics = const AlwaysScrollableScrollPhysics()});

  int mainIndex;
  int subIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PickerBloc>(
      create: (context) => PickerBloc(),
      child: BlocBuilder<PickerBloc, PickerState>(
        builder: (context, state){

          if(state is ColorPickerSelected){
            mainIndex = state.mainIndex;
            subIndex = state.subIndex;
            onChanged(mainIndex, subIndex);
          }

          return StaggeredGridView.countBuilder(
            physics: physics,
            padding: EdgeInsets.only(
              top: setHeight(18),
              left: setWidth(17),
              right: setWidth(17),
            ),
            crossAxisCount: 4,
            itemCount: ombreColor.length,
            staggeredTileBuilder: (i) => new StaggeredTile.fit(2),
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16,
            shrinkWrap: shrinkWrap,
            itemBuilder: (context, index){

              return Container(
                height: setHeight(135),
                width: setHeight(135),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(setHeight(4))
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(setHeight(4)),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: ColorCard(
                                colorHex: ombreColor[index][3],
                                isSelected: mainIndex == index && subIndex == 3 ? true : false,
                                onPressed: () => BlocProvider.of<PickerBloc>(context)..add(SelectColorPicker(mainIndex: index, subIndex: 3)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: ColorCard(
                                      colorHex: ombreColor[index][5],
                                      isSelected: mainIndex == index && subIndex == 5 ? true : false,
                                      onPressed: () => BlocProvider.of<PickerBloc>(context)..add(SelectColorPicker(mainIndex: index, subIndex: 5)),
                                    ),
                                  ),
                                  Expanded(
                                    child: ColorCard(
                                      colorHex: ombreColor[index][4],
                                      isSelected: mainIndex == index && subIndex == 4 ? true : false,
                                      onPressed: () => BlocProvider.of<PickerBloc>(context)..add(SelectColorPicker(mainIndex: index, subIndex: 4)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ColorCard(
                                colorHex: ombreColor[index][0],
                                isSelected: mainIndex == index && subIndex == 0 ? true : false,
                                onPressed: () => BlocProvider.of<PickerBloc>(context)..add(SelectColorPicker(mainIndex: index, subIndex: 0)),
                              ),
                            ),
                            Expanded(
                              child: ColorCard(
                                colorHex: ombreColor[index][1],
                                isSelected: mainIndex == index && subIndex == 1 ? true : false,
                                onPressed: () => BlocProvider.of<PickerBloc>(context)..add(SelectColorPicker(mainIndex: index, subIndex: 1)),
                              ),
                            ),
                            Expanded(
                              child: ColorCard(
                                colorHex: ombreColor[index][2],
                                isSelected: mainIndex == index && subIndex == 2 ? true : false,
                                onPressed: () => BlocProvider.of<PickerBloc>(context)..add(SelectColorPicker(mainIndex: index, subIndex: 2)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}