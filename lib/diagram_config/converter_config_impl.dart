import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ternary_diagram/models/axis_style.dart';
import 'package:ternary_diagram/models/binary_coordinate.dart';
import 'package:ternary_diagram/models/binary_path.dart';
import 'package:ternary_diagram/models/diagram_style.dart';
import 'package:ternary_diagram/models/label_painter.dart';
import 'package:ternary_diagram/models/ternary_coordinate.dart';
import 'package:ternary_diagram/strategy/converter_strategy.dart';
import 'package:ternary_diagram/utils/constants.dart';
import 'package:ternary_diagram/utils/functions_utils.dart';

class DiagramConfigImpl {
  double totalHeigth = 0;
  double totalWidth = 0;
  double availableHeigth = 0;
  double availableWidth = 0;
  double offsetX = 0;
  double offsetY = 0;

  double spaceForLabel = 30;
  double spaceForArrow = 10;

  List<BinaryPath> internalGridPath = [];
  late BinaryPath externalBorderPath;
  List<BinaryPath> arrowComponentA = [];
  List<BinaryPath> pathToPaint = [];
  List<LabelPainter> labelToPaint = [];

  late LabelPainter labelPainterA;
  late LabelPainter labelPainterB;
  late LabelPainter labelPainterC;

  ConverterStrategy converterStrategy;
  DiagramStyle diagramStyle;

  DiagramConfigImpl(
      {required this.converterStrategy, required this.diagramStyle});

  setUp({required double totalWidth, required double totalHeigth}) {
    _validateSpaceForLabel();
    this.totalHeigth = totalHeigth;
    this.totalWidth = totalWidth;
    double heightWithoutPadding = totalHeigth - 2 * spaceForLabel;
    double widthWithoutPadding = totalWidth - 2 * spaceForLabel;

    double ratio = heightWithoutPadding / widthWithoutPadding;
    if (ratio >= Constants.ratioHeightWidth) {
      availableWidth = widthWithoutPadding;
      availableHeigth =
          (Constants.ratioHeightWidth * totalWidth) - 2 * spaceForLabel;

      offsetX = spaceForLabel;
      offsetY = (totalHeigth - availableHeigth) / 2;
    } else {
      availableHeigth = heightWithoutPadding;
      availableWidth = ((availableHeigth) / Constants.ratioHeightWidth);

      offsetY = spaceForLabel;
      offsetX = (totalWidth - availableWidth) / 2;
    }

    _calculateInternalGridPath();
    _calculateBorderPath();
    _calculateArrowAPath();
    _calculateArrowBPath();
    _calculateArrowCPath();
  }

  List<BinaryCoordinate> convertCoordinates(List<TernaryCoordinate> data) {
    // TODO: implement convertCoordinates
    throw UnimplementedError();
  }

  void _calculateInternalGridPath() {
    Paint gridPaint = diagramStyle.getGridPaint();
    List<BinaryPath> list = [];
    double step = availableWidth / 10;
    double deltaY = (availableWidth / 10) * sin(Constants.radians60Grades);
    double deltaX = (availableWidth / 10) * cos(Constants.radians60Grades);
    for (int i = 1; i <= 9; i++) {
      List<BinaryCoordinate> coordinateList = [];
      coordinateList.add(BinaryCoordinate(
          x: offsetX + (step * i), y: availableHeigth + offsetY));
      coordinateList.add(BinaryCoordinate(
          x: totalWidth / 2 + (deltaX * i), y: offsetY + (deltaY * i)));
      coordinateList.add(BinaryCoordinate(
          x: totalWidth / 2 - (deltaX * i), y: offsetY + (deltaY * i)));
      coordinateList.add(BinaryCoordinate(
          x: offsetX + (step * (10 - i)), y: availableHeigth + offsetY));

      list.add(BinaryPath(coordinateList: coordinateList, paint: gridPaint));
    }
    pathToPaint.addAll(list);
  }

  void _calculateBorderPath() {
    Paint borderPaint = diagramStyle.getBorderPaint();
    List<BinaryCoordinate> list = [];
    list.add(BinaryCoordinate(x: totalWidth / 2, y: offsetY));
    list.add(BinaryCoordinate(x: offsetX, y: totalHeigth - offsetY));
    list.add(
        BinaryCoordinate(x: totalWidth - offsetX, y: totalHeigth - offsetY));
    pathToPaint.add(BinaryPath(coordinateList: list, paint: borderPaint));
  }

  void _calculateArrowCPath() {
    AxisStyle style = diagramStyle.cAxisStyle;
    Paint arrowPaint = style.getArrowPaint();
    List<BinaryCoordinate> list = [];
    double coordY = totalHeigth - offsetY + spaceForArrow;
    BinaryCoordinate start = BinaryCoordinate(x: offsetX, y: coordY);
    BinaryCoordinate end = BinaryCoordinate(x: totalWidth - offsetX, y: coordY);
    list.addAll([start, end]);
    pathToPaint.add(BinaryPath(coordinateList: list, paint: arrowPaint));
    List<BinaryCoordinate> headCoord =
        converterStrategy.getArrowHeadC(start, end);
    pathToPaint.add(
        BinaryPath(coordinateList: headCoord, paint: arrowPaint, close: false));
    labelToPaint.add(getLabelPainter(style.getTextPainter(), start, end, 0, 0));
  }

  void _calculateArrowBPath() {
    AxisStyle style = diagramStyle.bAxisStyle;
    Paint arrowPaint = style.getArrowPaint();
    List<BinaryCoordinate> list = [];
    BinaryCoordinate start =
        BinaryCoordinate(x: totalWidth / 2 + spaceForArrow + 2, y: offsetY);
    BinaryCoordinate end = BinaryCoordinate(
        x: totalWidth - offsetX + spaceForArrow + 2, y: totalHeigth - offsetY);
    list.addAll([start, end]);
    pathToPaint.add(BinaryPath(coordinateList: list, paint: arrowPaint));
    List<BinaryCoordinate> headCoord =
        converterStrategy.getArrowHeadB(start, end);
    pathToPaint.add(
        BinaryPath(coordinateList: headCoord, paint: arrowPaint, close: false));
    labelToPaint.add(getLabelPainter(style.getTextPainter(), start, end, Constants.radians60Grades, spaceForLabel - spaceForArrow));
  }

  void _calculateArrowAPath() {
    AxisStyle style = diagramStyle.aAxisStyle;
    Paint arrowPaint = style.getArrowPaint();
    List<BinaryCoordinate> list = [];
    BinaryCoordinate end =
        BinaryCoordinate(x: totalWidth / 2 - spaceForArrow - 2, y: offsetY);
    BinaryCoordinate start = BinaryCoordinate(
        x: offsetX - spaceForArrow - 2, y: totalHeigth - offsetY);
    list.addAll([start, end]);
    pathToPaint.add(BinaryPath(coordinateList: list, paint: arrowPaint));
    List<BinaryCoordinate> headCoord =
        converterStrategy.getArrowHeadA(start, end);
    pathToPaint.add(
        BinaryPath(coordinateList: headCoord, paint: arrowPaint, close: false));
    labelToPaint.add(getLabelPainter(style.getTextPainter(), start, end, Constants.radians300Grades, - spaceForLabel + spaceForArrow));
  }

  void _validateSpaceForLabel() {
    TextPainter painterC = diagramStyle.cAxisStyle.getTextPainter();
    painterC.layout();
    
    spaceForLabel = (painterC.height <= Constants.minHeigthLabel ? Constants.minHeigthLabel : painterC.height) + spaceForArrow;
  }

  LabelPainter getLabelPainter(TextPainter textPainter, BinaryCoordinate start, BinaryCoordinate end, double angleToRotate, double spaceToTranslate) {
    textPainter.layout();
    BinaryCoordinate labelStart = BinaryCoordinate(x: start.x + spaceToTranslate, y: start.y);
    BinaryCoordinate labelEnd = BinaryCoordinate(x: end.x + spaceToTranslate, y: end.y);
    double angle = (labelStart.y == labelEnd.y)? 0 : FunctionsUtils.angle(labelStart, labelEnd);
    double distance = angleToRotate == 0 ? (labelEnd.x - labelStart.x).abs() : FunctionsUtils.distance(labelStart, labelEnd);
    double x = labelStart.x;
    double y = labelStart.y;
    double dx = (distance - textPainter.width)/2;
    if(angle == 0) {
      y+=5;
      x+=dx;
    } else {
      x = labelStart.x + (dx/distance) * (labelEnd.x - labelStart.x);
      y = labelStart.y + (dx/distance) * (labelEnd.y - labelStart.y);
    }
    return LabelPainter(textPainter: textPainter, offset: Offset(x, y), angleToRotate: angleToRotate);
  }

  LabelPainter getLabelBOffset(TextPainter textPainter, BinaryCoordinate start, BinaryCoordinate end) {
    return LabelPainter(textPainter: textPainter, offset: Offset(0, 0));
  }

  LabelPainter getLabelCOffset(TextPainter textPainter, BinaryCoordinate start, BinaryCoordinate end) {
    return LabelPainter(textPainter: textPainter, offset: Offset(0, 0));
  }
  
}
