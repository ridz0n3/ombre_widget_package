import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ombre_widget_package/scale_slider/model/measurement_line.dart';
import 'package:ombre_widget_package/helper/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef void ScaleChangedCallback(String scalePoints);

class LbSlider extends StatefulWidget{
  final int maxValue;
  final ScrollController weightLbController;
  final double viewWidth;
  final ScaleChangedCallback onChanged;
  LbSlider({this.maxValue, this.onChanged, this.viewWidth, this.weightLbController});

  @override
  _LbSliderState createState() => _LbSliderState();
}

class _LbSliderState extends State<LbSlider> with TickerProviderStateMixin{

  var scaleController = TextEditingController();
  FocusNode _focusNodes = FocusNode();

  double opacity = 1;
  double top = 3.0;
  double height = 20;
  double width = 40;
  double heightBorder = 20;
  double textSize = 10;
  InputBorder _inputBorder = InputBorder.none;

  bool isLeft = false;
  bool isRight = false;
  double offset = 0.0;

  @override
  void initState() {
    super.initState();

    if(widget.weightLbController.initialScrollOffset.toInt() != 0){
      int scalePoints = widget.weightLbController.initialScrollOffset.toInt();
      int gram = scalePoints ~/ ScreenUtil().setWidth(9);
      double kg = gram * 100 / 1000;

      scaleController.text = kg.toString();

    }else{
      scaleController.text = '0';
    }

    scaleController.text = '0';
    widget.weightLbController.addListener(_scaleScrollListener);
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
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(23.0)),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification){
                    if (scrollNotification is ScrollEndNotification) {
                      Future.delayed(const Duration(milliseconds: 100), () {
                        double moveToPixel = _getLbPixel();
                        if (isLeft) {
                          moveToPixel += ScreenUtil().setWidth(10) + 1;
                          widget.weightLbController.animateTo(moveToPixel, duration: Duration(
                              milliseconds: 100), curve: Curves.fastOutSlowIn);
                          isLeft = false;
                          setState(() {});
                        } else if (isRight) {
                          widget.weightLbController.animateTo(moveToPixel, duration: Duration(
                              milliseconds: 100), curve: Curves.fastOutSlowIn);
                          isRight = false;
                          setState(() {});
                        }
                      });
                    }
                    return true;
                  },
                  child: LbScaleWidget(
                    maxValue: widget.maxValue,
                    viewWidth: widget.viewWidth,
                    scaleController: widget.weightLbController,
                  ), //slider
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.viewWidth * 0.5 + ScreenUtil().setWidth(17) - ScreenUtil().setWidth(35), top: ScreenUtil().setHeight(2)),
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
              _inputBorder = OutlineInputBorder();
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
                  '${scaleController.text} lb',
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
                width: setWidth(121),
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
                              decoration: biometricInputDecoration('lb'),
                              controller: scaleController,
                              style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
                              focusNode: _focusNodes,
                              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value){

                                Pattern pattern = r'^(?:0|[1-9][0-9]*)\.[0-9]+$';
                                final checkNumber = RegExp(pattern);
                                if (checkNumber.hasMatch(value)) {
                                  double moveToFeet = double.tryParse(value) ?? 0;
                                  double moveToPixel = moveToFeet / 0.1 * ScreenUtil().setWidth(9) + 1; //scale points = measurement unit * 20.

                                  if (widget.weightLbController.hasClients) {
                                    widget.weightLbController.animateTo(moveToPixel, duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
                                  }

                                  height = 20;
                                  width = 40;
                                  heightBorder = 20;
                                  top = 3;
                                  textSize = 10;
                                  _inputBorder = InputBorder.none;
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
    var scalePoints = widget.weightLbController.offset.toInt();
    String scale = _lbScale(scalePoints);
    scaleController.text = scale;
    widget.onChanged(scale);
  }

  String _lbScale(int scalePoints){

    int gram = scalePoints ~/ ScreenUtil().setWidth(9);
    double kg = gram * 100 / 1000;

    getDirection();
    if(offset != kg){
      offset = kg;
      setState(() {});
    }

    return kg.toString();

  }

  double _getLbPixel(){

    double moveToFeet = double.tryParse('$offset') ?? 0;
    double moveToPixel = moveToFeet / 0.1 * ScreenUtil().setWidth(9);
    return moveToPixel.roundToDouble();

  }

  void getDirection(){
    if(widget.weightLbController.position.userScrollDirection == ScrollDirection.forward){
      isRight = true;
      isLeft = false;
      setState(() {});
    }else if(widget.weightLbController.position.userScrollDirection == ScrollDirection.reverse){
      isLeft = true;
      isRight = false;
      setState(() {});
    }
  }
}

class LbScaleWidget extends StatefulWidget{

  final int maxValue;
  final double viewWidth;
  final ScrollController scaleController;

  const LbScaleWidget(
      {Key key,
        @required this.maxValue,
        this.viewWidth,
        @required this.scaleController,
      }) : assert(maxValue != null, "maxValue cannot be null. This is used to set scale limit. i.e maxValue=10"),
        assert(scaleController != null, "scaleController cannot be null. This is used to control the behaviour of scale like reading current scale point, move to particular point in scale etc. Try giving value like scaleController: ScrollController(initialScrollOffset: 0)"),
        super(key: key);

  @override
  _LbScaleWidgetState createState() => _LbScaleWidgetState();
}

class _LbScaleWidgetState extends State<LbScaleWidget> {

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
                    width: ScreenUtil().setWidth(6),
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
                width: ScreenUtil().setWidth(8),
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
                width: ScreenUtil().setWidth(7),
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