import 'package:flutter/material.dart';

class ScrollViews extends StatelessWidget {

  List<Widget> children;
  ScrollViews({List<Widget> children}) : this.children = children;

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
      builder:
          (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
            BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Column(children:
            // remaining stuffs
            children
            ),
          ),
        );
      },
    );
  }

}