import 'package:flutter/material.dart';

class ScrollViews extends StatelessWidget {

  List<Widget> children;
  Axis scrollDirection;
  ScrollController scrollController;
  ScrollViews({this.children, this.scrollController, this.scrollDirection = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          controller: scrollController,
          scrollDirection: scrollDirection,
          child: ConstrainedBox(
            constraints: scrollDirection == Axis.horizontal ? BoxConstraints(minWidth: viewportConstraints.maxWidth) : BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: scrollDirection == Axis.horizontal ? Row(children: children) : Column(children: children),
          ),
        );
      },
    );
  }

}