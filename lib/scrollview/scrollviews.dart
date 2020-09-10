import 'package:flutter/material.dart';

class ScrollViews extends StatelessWidget {

  List<Widget> children;
  ScrollController scrollController;
  ScrollViews({List<Widget> children, ScrollController scrollController}) : this.children = children, this.scrollController = scrollController;

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
      builder:
          (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          controller: scrollController,
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