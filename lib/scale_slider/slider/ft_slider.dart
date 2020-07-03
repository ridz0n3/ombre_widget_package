import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ombre_widget_package/scale_slider/model/measurement_line.dart';
import 'package:ombre_widget_package/helper/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef void ScaleChangedCallback(String scalePoints);

class FtSlider extends StatefulWidget{
  final int maxValue;
  final double viewWidth;
  final ScrollController heightFtController;
  final ScaleChangedCallback onChanged;

  FtSlider({this.maxValue, this.heightFtController, this.viewWidth, this.onChanged});

  @override
  _FtSliderState createState() => _FtSliderState();
}

class _FtSliderState extends State<FtSlider> with TickerProviderStateMixin{

  var scaleFtController = TextEditingController();
  var scaleInController = TextEditingController();
  FocusNode _focusFtNodes = FocusNode();
  FocusNode _focusInNodes = FocusNode();

  double opacity = 1;
  double top = 3.0;
  double height = 20;
  double width = 40;
  double width2 = 25;
  double heightBorder = 20;
  double textSize = 10;
  InputBorder _inputBorder = InputBorder.none;

  bool isLeft = false;
  bool isRight = false;
  double offset = 0.0;
  String ftVal = '';

  @override
  void initState() {
    super.initState();

    if(widget.heightFtController.initialScrollOffset.toInt() != 0){
      int scalePoints = widget.heightFtController.initialScrollOffset.toInt();
      int inchOffset = scalePoints ~/ ScreenUtil().setWidth(25);
      int feet = inchOffset ~/ 12;
      int inch = inchOffset % 12;

      scaleFtController.text = feet.toString();
      scaleInController.text = inch.toString();
    }else{
      scaleFtController.text = '0';
      scaleInController.text = '0';
    }

    scaleFtController.text = '0';
    scaleInController.text = '0';
    widget.heightFtController.addListener(_scaleScrollListener);
  }

  @override
  void dispose() {
    widget.heightFtController.removeListener(_scaleScrollListener);
    widget.heightFtController.dispose();
    super.dispose();
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
                        double moveToPixel = offset;
                        if (isLeft) {
                          moveToPixel += ScreenUtil().setWidth(25) + 1;
                          widget.heightFtController.animateTo(moveToPixel, duration: Duration(
                              milliseconds: 100), curve: Curves.fastOutSlowIn);
                          isLeft = false;
                          setState(() {});
                        } else if (isRight) {
                          widget.heightFtController.animateTo(moveToPixel, duration: Duration(
                              milliseconds: 100), curve: Curves.fastOutSlowIn);
                          isRight = false;
                          setState(() {});
                        }
                      });
                    }
                    return true;
                  },
                  child: FtScaleWidget(
                    maxValue: widget.maxValue,
                    viewWidth: widget.viewWidth,
                    scaleController: widget.heightFtController,
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
              width2 = 100;
              heightBorder = 40;
              top = 19;
              textSize = 20;
              opacity = 0;
              _inputBorder = OutlineInputBorder();
              Future.delayed(Duration(milliseconds: 500), (){
                FocusScope.of(context).requestFocus(_focusFtNodes);
              });
              setState(() {});
            },
            child: Container(
              height: setHeight(21),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${scaleFtController.text} ft',
                    style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 11, 'Poppins-Bold'),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(5),
                  ),
                  Text(
                    '${scaleInController.text} in',
                    style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 11, 'Poppins-Bold'),
                  ),
                ],
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
                width: setWidth(131),
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
                              decoration: biometricInputDecoration('ft'),
                              controller: scaleFtController,
                              style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
                              focusNode: _focusFtNodes,
                              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value){

                                if (double.tryParse(value) != null) {
                                  ftVal = value;
                                  FocusScope.of(context).requestFocus(_focusInNodes);
                                  setState(() {});
                                }
                                else{
                                  FocusScope.of(context).requestFocus(_focusFtNodes);
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: biometricInputDecoration('in'),
                              controller: scaleInController,
                              style: getCustomFont(Color(hexStringToHexInt('#FFFCF2')), 14, 'Poppins-Regular'),
                              focusNode: _focusInNodes,
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value){

                                if (double.tryParse(value) != null) {
                                  double feet = double.tryParse(ftVal) ?? 0;
                                  double inch = double.tryParse(value) ?? 0;

                                  double feetToInch = feet * 12;
                                  double inchToScalePoints = feetToInch * ScreenUtil().setWidth(25) + 1 + inch * ScreenUtil().setWidth(25) + 1;

                                  if (widget.heightFtController.hasClients) {
                                    widget.heightFtController.animateTo(inchToScalePoints,
                                        duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
                                  }

                                  height = 20;
                                  width = 40;
                                  width2 = 25;
                                  heightBorder = 20;
                                  top = 3;
                                  textSize = 10;
                                  opacity = 1;
                                  _inputBorder = InputBorder.none;
                                  setState(() {});
                                }
                                else{
                                  FocusScope.of(context).requestFocus(_focusFtNodes);
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
    var scalePoints = widget.heightFtController.offset.toInt();
    String scale = _ftScale(scalePoints);
    List ftList = scale.split('/');
    scaleFtController.text = ftList[0];
    scaleInController.text = ftList[1];
    widget.onChanged(scale);
  }

  String _ftScale(int scalePoints){
    int inchOffset = scalePoints ~/ ScreenUtil().setWidth(25);
    int feet = inchOffset ~/ 12;
    int inch = inchOffset % 12;

    getDirection();

    double ft = double.tryParse('$feet') ?? 0;
    double inchVal = double.tryParse('$inch') ?? 0;

    double feetToInch = ft * 12;
    double inchToScalePoints = feetToInch * ScreenUtil().setWidth(25) + inchVal * ScreenUtil().setWidth(25);

    if(offset != inchToScalePoints){
      offset = inchToScalePoints;
      setState(() {});
    }

    return '$feet/$inch';
  }

  void getDirection(){
    if(widget.heightFtController.position.userScrollDirection == ScrollDirection.forward){
      isRight = true;
      isLeft = false;
      setState(() {});
    }else if(widget.heightFtController.position.userScrollDirection == ScrollDirection.reverse){
      isLeft = true;
      isRight = false;
      setState(() {});
    }
  }
}

class FtScaleWidget extends StatefulWidget{

  final int maxValue;
  final double viewWidth;
  final ScrollController scaleController;

  const FtScaleWidget(
      {Key key,
        @required this.maxValue,
        this.viewWidth,
        @required this.scaleController,
      }) : assert(maxValue != null, "maxValue cannot be null. This is used to set scale limit. i.e maxValue=10"),
        assert(scaleController != null, "scaleController cannot be null. This is used to control the behaviour of scale like reading current scale point, move to particular point in scale etc. Try giving value like scaleController: ScrollController(initialScrollOffset: 0)"),
        super(key: key);

  @override
  _FtScaleWidgetState createState() => _FtScaleWidgetState();
}

class _FtScaleWidgetState extends State<FtScaleWidget> {

  List<MeasurementLine> measurementLineList = List<MeasurementLine>();
  int linesBetweenTwoPoints = 11;
  int middleLineAt = 6;

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
      padding: EdgeInsets.only(left: widget.viewWidth * 0.5 - ScreenUtil().setWidth(16), top: ScreenUtil().setHeight(5)),
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
                    width: ScreenUtil().setWidth(22),
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
                width: ScreenUtil().setWidth(24),
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
                width: ScreenUtil().setWidth(23),
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