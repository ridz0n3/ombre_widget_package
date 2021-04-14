import 'package:flutter/cupertino.dart';
import 'package:ombre_widget_package/scale_slider/model/measurement_line.dart';
import 'package:ombre_widget_package/helper/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cm_slider.dart';
import 'ft_slider.dart';
import 'kg_slider.dart';
import 'lb_slider.dart';


typedef void ScaleCallback(String scalePoints, String type);

class MainSlider extends StatefulWidget{

  final String initialValue;
  final Type mainType;
  final Type subType;
  final bool typeChange;
  final double viewWidth;
  final ScaleCallback onChanged;
  bool isReset;
  MainSlider({this.mainType, this.subType, this.typeChange, this.viewWidth, this.onChanged, this.initialValue, this.isReset = false});

  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {

  ScrollController _weightKgController;
  ScrollController _weightLbController;
  ScrollController _heightCmController;
  ScrollController _heightFtController;

  String kgValue = '0';
  String lbValue = '0';
  String cmValue = '0';
  String ftValue = '0/0';

  @override
  void initState() {
    super.initState();

    _heightCmController = ScrollController(initialScrollOffset: 0);
    _heightFtController = ScrollController(initialScrollOffset: 0);
    _weightKgController = ScrollController(initialScrollOffset: 0);
    _weightLbController = ScrollController(initialScrollOffset: 0);


    Future.delayed(Duration(milliseconds: 50), (){

      if(widget.mainType == Type.cm){

        double moveToFeet = double.tryParse(widget.initialValue) ?? 0;
        double moveToPixel = moveToFeet / 0.1 * ScreenUtil().setWidth(1) + 1;
        _heightCmController.jumpTo(moveToPixel);

        double feet = convertCmToFeet(widget.initialValue);
        double inch = getInchBalance(widget.initialValue);

        double feetToInch = feet * 12;
        double inchToScalePoints = feetToInch * ScreenUtil().setWidth(25) + 1 + inch * ScreenUtil().setWidth(25) + 1;
        _heightFtController.jumpTo(inchToScalePoints);
      }

    });

    Future.delayed(Duration(milliseconds: 50), (){

      if(widget.mainType == Type.kg) {
        double moveToKg = double.tryParse(widget.initialValue) ?? 0;
        double moveKgToPixel = moveToKg / 0.1 * ScreenUtil().setWidth(20) + 1;
        _weightKgController.animateTo(
            moveKgToPixel, curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 100));

        double moveToLb = double.parse((moveToKg * 2.205).toStringAsFixed(1));
        double moveLbToPixel = moveToLb / 0.1 * ScreenUtil().setWidth(9) + 1;
        _weightLbController.jumpTo(moveLbToPixel);
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    if(widget.isReset){
      Future.delayed(Duration(milliseconds: 50), (){

        if(widget.mainType == Type.cm){

          double moveToFeet = double.tryParse(widget.initialValue) ?? 0;
          double moveToPixel = moveToFeet / 0.1 * ScreenUtil().setWidth(1) + 1;
          _heightCmController.jumpTo(moveToPixel);

          double feet = convertCmToFeet(widget.initialValue);
          double inch = getInchBalance(widget.initialValue);

          double feetToInch = feet * 12;
          double inchToScalePoints = feetToInch * ScreenUtil().setWidth(25) + 1 + inch * ScreenUtil().setWidth(25) + 1;
          _heightFtController.jumpTo(inchToScalePoints);
        }

      });

      Future.delayed(Duration(milliseconds: 50), (){

        if(widget.mainType == Type.kg) {
          double moveToKg = double.tryParse(widget.initialValue) ?? 0;
          double moveKgToPixel = moveToKg / 0.1 * ScreenUtil().setWidth(20) + 1;
          _weightKgController.animateTo(
              moveKgToPixel, curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 100));

          double moveToLb = double.parse((moveToKg * 2.205).toStringAsFixed(1));
          double moveLbToPixel = moveToLb / 0.1 * ScreenUtil().setWidth(9) + 1;
          _weightLbController.jumpTo(moveLbToPixel);
        }
      });

      widget.isReset = false;
      setState(() {});
    }

    if(widget.mainType == Type.kg){
      return Stack(
        children: <Widget>[
          Opacity(
            opacity: widget.typeChange ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.only(left:  widget.typeChange ? 0 : MediaQuery.of(context).size.width),
              child: LbSlider(
                viewWidth: widget.viewWidth,
                maxValue: (204 * 2.205).floor(),
                weightLbController: _weightLbController,
                onChanged: _handleLbWeightScaleChanged,
              ),
            ),
          ),
          Opacity(
            opacity: widget.typeChange ? 0 : 1,
            child: Padding(
              padding: EdgeInsets.only(left: widget.typeChange ? MediaQuery.of(context).size.width : 0),
              child: KgSlider(
                viewWidth: widget.viewWidth,
                maxValue: 204,
                weightKgController: _weightKgController,
                onChanged: _handleKgWeightScaleChanged,
              ),
            ),
          )
        ],
      );
    }
    else{
      return Stack(
        children: <Widget>[
          Opacity(
            opacity: widget.typeChange ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.only(left:  widget.typeChange ? 0 : widget.viewWidth),
              child: FtSlider(
                viewWidth: widget.viewWidth,
                maxValue: 10,
                heightFtController: _heightFtController,
                onChanged: _handleFtHeightScaleChanged,
              ),
            ),
          ),
          Opacity(
            opacity: widget.typeChange ? 0 : 1,
            child: Padding(
              padding: EdgeInsets.only(left: widget.typeChange ? widget.viewWidth : 0),
              child: CmSlider(
                viewWidth: widget.viewWidth,
                maxValue: (120 * 2.5).floor(),
                typeChange: widget.typeChange,
                heightCmController: _heightCmController,
                onChanged: _handleCmHeightScaleChanged,
              ),
            ),
          )
        ],
      );
    }
  }

  void _handleLbWeightScaleChanged(String scalePoints) {

    if(lbValue != scalePoints) {

      if(widget.typeChange) {
        double moveToKg = double.tryParse(scalePoints) ?? 0;
        double moveToLb = double.parse((moveToKg / 2.205).toStringAsFixed(1));
        double moveToPixel = moveToLb / 0.1 * ScreenUtil().setWidth(20) + 1;
        _weightKgController.animateTo(
            moveToPixel, duration: Duration(milliseconds: 100),
            curve: Curves.fastOutSlowIn);
      }else{
        widget.onChanged(kgValue, 'kg');
      }

      lbValue = scalePoints;

      setState(() {});

    }
  }

  void _handleKgWeightScaleChanged(String scalePoints) {

    if(kgValue != scalePoints) {

      if(!widget.typeChange) {
        double moveToKg = double.tryParse(scalePoints) ?? 0;
        double moveToLb = double.parse((moveToKg * 2.205).toStringAsFixed(1));
        double moveToPixel = moveToLb / 0.1 * ScreenUtil().setWidth(9) + 1;
        _weightLbController.animateTo(
            moveToPixel, duration: Duration(milliseconds: 100),
            curve: Curves.fastOutSlowIn);
      }else{
        widget.onChanged(lbValue, 'lb');
      }

      kgValue = scalePoints;

      setState(() {});

    }
  }

  void _handleFtHeightScaleChanged(String scalePoints) {

    if(ftValue != scalePoints){

      if(widget.typeChange){
        List pointList = scalePoints.split('/');
        double moveToCm = convertFeetToCm(pointList[0], pointList[1]);
        double moveToPixel = moveToCm / 0.1 * ScreenUtil().setWidth(1) + 1;
        _heightCmController.animateTo(
            moveToPixel, duration: Duration(milliseconds: 100),
            curve: Curves.fastOutSlowIn);
      }else{
        widget.onChanged(cmValue, 'cm');
      }

      ftValue = scalePoints;
      setState(() {});
    }

  }

  void _handleCmHeightScaleChanged(String scalePoints) {

    if(cmValue != scalePoints) {

      if(!widget.typeChange){
        double feet = convertCmToFeet(scalePoints);
        double inch = getInchBalance(scalePoints);

        double feetToInch = feet * 12;
        double inchToScalePoints = feetToInch * ScreenUtil().setWidth(25) + 1 + inch * ScreenUtil().setWidth(25) + 1;

        _heightFtController.animateTo(inchToScalePoints, duration: Duration(milliseconds: 100),curve: Curves.fastOutSlowIn);
      }else{
        widget.onChanged(ftValue, 'ft/in');
      }

      cmValue = scalePoints;
      setState(() {});
    }
  }
}