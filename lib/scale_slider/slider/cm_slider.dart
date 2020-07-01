import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ombre_widget_package/scale_slider/model/measurement_line.dart';
import 'package:ombre_widget_package/helper/utils.dart';

typedef void ScaleChangedCallback(String scalePoints);

class CmSlider extends StatefulWidget{
  final int maxValue;
  final bool typeChange;
  final double viewWidth;
  final ScrollController heightCmController;
  final ScaleChangedCallback onChanged;

  CmSlider({this.maxValue, this.typeChange, this.viewWidth, this.heightCmController, this.onChanged});

  @override
  _CmSliderState createState() => _CmSliderState();
}

class _CmSliderState extends State<CmSlider> with TickerProviderStateMixin{

  var scaleController = TextEditingController();
  FocusNode _focusNodes = FocusNode();

  double opacity = 1;
  double top = 3.0;
  double height = 20;
  double width = 50;
  double textSize = 10;
  double heightBorder = 20;

  bool textFieldChange = false;
  bool isLeft = false;
  bool isRight = false;
  double offset = 0.0;

  @override
  void initState() {
    super.initState();

    if(widget.heightCmController.initialScrollOffset.toInt() != 0){
      int scalePoints = widget.heightCmController.initialScrollOffset.toInt();
      int mm = scalePoints ~/ ScreenUtil().setWidth(10);
      double cm = ((mm * 100) / 100);

      scaleController.text = cm.toString();

    }else{
      scaleController.text = '0';
    }

    widget.heightCmController.addListener(_scaleScrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(70),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(23)),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification){
                    if (scrollNotification is ScrollEndNotification) {
                      Future.delayed(const Duration(milliseconds: 100), () {

                        double moveToPixel = _getPixel();

                        if(!textFieldChange) {
                          if (!widget.typeChange) {
                            if (isLeft) {
                              moveToPixel += ScreenUtil().setWidth(10) + 1;
                              widget.heightCmController.animateTo(
                                  moveToPixel, duration: Duration(
                                  milliseconds: 100),
                                  curve: Curves.fastOutSlowIn);
                              isLeft = false;
                              setState(() {});
                            } else if (isRight) {
                              widget.heightCmController.animateTo(
                                  moveToPixel, duration: Duration(
                                  milliseconds: 100),
                                  curve: Curves.fastOutSlowIn);
                              isRight = false;
                              setState(() {});
                            }
                          }
                          else {
                            if (isLeft) {
                              moveToPixel += ScreenUtil().setWidth(1) + 1;
                              widget.heightCmController.animateTo(
                                  moveToPixel, duration: Duration(
                                  milliseconds: 100),
                                  curve: Curves.fastOutSlowIn);
                              isLeft = false;
                              setState(() {});
                            } else if (isRight) {
                              widget.heightCmController.animateTo(
                                  moveToPixel, duration: Duration(
                                  milliseconds: 100),
                                  curve: Curves.fastOutSlowIn);
                              isRight = false;
                              setState(() {});
                            }
                          }
                        }else{
                          textFieldChange = false;
                          setState(() {});
                        }
                      });
                    }
                    return true;
                  },
                  child: CmScaleWidget(
                    maxValue: widget.maxValue,
                    viewWidth: widget.viewWidth,
                    scaleController: widget.heightCmController,
                  ), //slider
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: widget.viewWidth/2 - ScreenUtil().setWidth(17),
                  top: ScreenUtil().setHeight(2),
                ),
                child: Container(
                    width: ScreenUtil().setWidth(51),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(13)),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Color(hexStringToHexInt('#F89825')),
                            size: ScreenUtil().setHeight(20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(27.3)),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.17, 0.47, 0.69, 1.0],
                                  colors: [
                                    Color(hexStringToHexInt('#F89825')),
                                    Color(hexStringToHexInt('#F26322')),
                                    Color(hexStringToHexInt('#E5333B')),
                                    Color(hexStringToHexInt('#C81D5E')),
                                    Color(hexStringToHexInt('#A91E5E')),
                                  ],
                                )
                            ),
                            width: ScreenUtil().setWidth(3),
                            height: ScreenUtil().setHeight(40),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(62)),
                          child: Icon(
                            Icons.arrow_drop_up,
                            color: Color(hexStringToHexInt('#A91E5E')),
                            size: ScreenUtil().setHeight(20),
                          ),
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),//indicator
        AnimatedOpacity(
          opacity: opacity,
          duration: Duration(milliseconds: 300),
          child: GestureDetector(
            onTap: (){
              height = 50;
              width = 100;
              heightBorder = 40;
              top = 19;
              textSize = 20;
              opacity = 0;
              Future.delayed(Duration(milliseconds: 500), (){
                FocusScope.of(context).requestFocus(_focusNodes);
              });
              setState(() {});
            },
            child: Container(
              height: setHeight(21),
              color: Colors.transparent,
              child: Center(
                child: Text(
                  '${scaleController.text} cm',
                  style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 11, 'Poppins-Bold'),
                ),
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: opacity == 1 ? 0 : 1,
          duration: Duration(milliseconds: 300),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: setHeight(20)
              ),
              child: Container(
                height: setHeight(opacity == 1 ? 0 : 60),
                width: setWidth(111),
                decoration: BoxDecoration(
                  color: Color(hexStringToHexInt('#4D574242')),
                  borderRadius: BorderRadius.all(Radius.circular(setHeight(61))),
                ),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.0),
                        borderRadius: BorderRadius.all(Radius.circular(setHeight(61))),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: biometricInputDecoration('cm'),
                              controller: scaleController,
                              style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
                              focusNode: _focusNodes,
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value){
                                
                                Pattern pattern = r'^(?:0|[1-9][0-9]*)\.[0-9]+$';
                                final checkNumber = RegExp(pattern);
                                if (checkNumber.hasMatch(value)) {
                                  print('in');
                                  double moveToFeet = double.tryParse(value) ?? 0;
                                  double moveToPixel = moveToFeet / 0.1 * ScreenUtil().setWidth(1) + 1;
                                  textFieldChange = true;
                                  if (widget.heightCmController.hasClients) {
                                    widget.heightCmController.animateTo(moveToPixel, duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
                                  }

                                  height = 20;
                                  width = 50;
                                  heightBorder = 20;
                                  top = 3;
                                  textSize = 10;
                                  opacity = 1;
                                  setState(() {});
                                }
                                else{
                                  FocusScope.of(context).requestFocus(_focusNodes);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _scaleScrollListener(){
    var scalePoints = widget.heightCmController.offset.toInt();
    String scale = _cmScale(scalePoints);
    scaleController.text = scale;
    widget.onChanged(scale);
  }

  String _cmScale(int scalePoints){

    if(!textFieldChange) {
      if (!widget.typeChange) {
        int mm = scalePoints ~/ ScreenUtil().setWidth(10);
        double cm = ((mm * 100) / 100);

        getDirection();
        if (offset != cm) {
          offset = cm;
          setState(() {});
        }

        return cm.toString();
      }
      else {
        int mm = scalePoints ~/ ScreenUtil().setWidth(1);
        double cm = ((mm * 100) / 1000);

        getDirection();
        if (offset != cm) {
          offset = cm;
          setState(() {});
        }

        return cm.toString();
      }
    }else{
      int mm = scalePoints ~/ ScreenUtil().setWidth(1);
      double cm = ((mm * 100) / 1000);

      getDirection();
      if (offset != cm) {
        offset = cm;
        setState(() {});
      }

      return cm.toString();
    }
  }

  double _getPixel(){

    if(!textFieldChange) {
      if (!widget.typeChange) {
        double moveToFeet = double.tryParse('$offset') ?? 0;
        double moveToPixel = moveToFeet / 0.1 * ScreenUtil().setWidth(1);

        return moveToPixel;
      } else {
        double moveToFeet = double.tryParse('$offset') ?? 0;
        double moveToPixel = moveToFeet / 1 * ScreenUtil().setWidth(1);

        return moveToPixel;
      }
    }else{
      double moveToFeet = double.tryParse('$offset') ?? 0;
      double moveToPixel = moveToFeet / 1 * ScreenUtil().setWidth(1);

      return moveToPixel;
    }
  }

  void getDirection(){
    if(widget.heightCmController.position.userScrollDirection == ScrollDirection.forward){
      isRight = true;
      isLeft = false;
      setState(() {});
    }else if(widget.heightCmController.position.userScrollDirection == ScrollDirection.reverse){
      isLeft = true;
      isRight = false;
      setState(() {});
    }
  }
}

class CmScaleWidget extends StatefulWidget{

  final int maxValue;
  final double viewWidth;
  final ScrollController scaleController;

  const CmScaleWidget(
      {Key key,
        @required this.maxValue,
        this.viewWidth,
        @required this.scaleController,
      }) : assert(maxValue != null, "maxValue cannot be null. This is used to set scale limit. i.e maxValue=10"),
        assert(scaleController != null, "scaleController cannot be null. This is used to control the behaviour of scale like reading current scale point, move to particular point in scale etc. Try giving value like scaleController: ScrollController(initialScrollOffset: 0)"),
        super(key: key);

  @override
  _CmScaleWidgetState createState() => _CmScaleWidgetState();
}

class _CmScaleWidgetState extends State<CmScaleWidget> {

  List<MeasurementLine> measurementLineList = List<MeasurementLine>();
  int linesBetweenTwoPoints = 9;
  int middleLineAt = 5;

  @override
  void initState() {
    super.initState();
    _createListOfLinesToDraw();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: widget.scaleController,
      itemCount: measurementLineList.length,
      padding: EdgeInsets.only(left: widget.viewWidth * 0.5, top: ScreenUtil().setHeight(5)),
      itemBuilder: (context, index) {
        final mLine = measurementLineList[index];

        if (mLine.type == Line.big) {
          return Stack(
            alignment: AlignmentDirectional.center,
            overflow: Overflow.visible,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ScreenUtil().setWidth(7),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(40),
                    width: ScreenUtil().setWidth(3),
                    color: Color(hexStringToHexInt('#FFFCF2')),
                  ),
                ],
              ),
            ],
          );
        }
        else if (measurementLineList[index].type == Line.small) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil().setWidth(9),
              ),
              Container(
                height: ScreenUtil().setHeight(16),
                width: ScreenUtil().setWidth(1),
                color: Color(hexStringToHexInt('#FFFCF2')),
              ),
            ],
          );
        }
        else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil().setWidth(8),
              ),
              Container(
                height: ScreenUtil().setHeight(24),
                width: ScreenUtil().setWidth(2),
                color: Color(hexStringToHexInt('#FFFCF2')),
              ),
            ],
          );
        }

      },
    );
  }

  void _createListOfLinesToDraw(){
    for (int i = 0; i <= widget.maxValue; i++) {
      measurementLineList.add(MeasurementLine(type: Line.big, value: '$i'));
      for (int j = 1; j <= linesBetweenTwoPoints; j++) {
        measurementLineList.add(
            j != middleLineAt ?
            MeasurementLine(type: Line.small, value: '$i.$j') :
            MeasurementLine(type: Line.medium, value: '$i.$j')
        );
      }
    }
  }

}