import 'package:flutter/material.dart';
import 'package:ternary_diagram/models/axis_style.dart';
import 'package:ternary_diagram/utils/constants.dart';

class DiagramStyle {

  //External border
  final Color externalBorderColor;
  final double strokeExternalBorder;

  //Internal Border
  final Color internalGridColor;
  final double strokeInternalGrid;

  //Labels
  final AxisStyle aAxisStyle;
  final AxisStyle bAxisStyle;
  final AxisStyle cAxisStyle;

  const DiagramStyle(
      {this.externalBorderColor = Colors.black,
      this.strokeExternalBorder = 4,
      this.internalGridColor = Colors.grey,
      this.strokeInternalGrid = 1,
      this.aAxisStyle = const AxisStyle(label: Constants.labelComponentA),
      this.bAxisStyle = const AxisStyle(label: Constants.labelComponentB),
      this.cAxisStyle = const AxisStyle(label: Constants.labelComponentC)
      });

  Paint getGridPaint() {
    return Paint()
      ..color = internalGridColor
      ..strokeWidth = strokeInternalGrid
      ..style = PaintingStyle.stroke;
  }

  Paint getBorderPaint() {
    return Paint()
      ..color = externalBorderColor
      ..strokeWidth = strokeExternalBorder
      ..style = PaintingStyle.stroke;
  }
}
