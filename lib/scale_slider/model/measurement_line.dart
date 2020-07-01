import 'package:flutter/material.dart';

class MeasurementLine {
  String value;
  MeasureLine type;

  MeasurementLine({this.value, @required this.type});
}

enum MeasureLine {
  big,
  medium,
  small,
}

enum MeasureType {
  cm,
  ft,
  kg,
  lb
}