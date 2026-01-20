import 'dart:math';

import 'package:ternary_diagram/models/binary_coordinate.dart';
import 'package:ternary_diagram/models/ternary_coordinate.dart';
import 'package:ternary_diagram/strategy/converter_strategy.dart';
import 'package:ternary_diagram/utils/constants.dart';
import 'package:ternary_diagram/utils/functions_utils.dart';

class CounterClockwiseStrategy extends ConverterStrategy {
  CounterClockwiseStrategy();

  @override
  BinaryCoordinate ternaryToBinaryCoordinate(TernaryCoordinate ternaryCoordinate) {
    double componentA = ternaryCoordinate.componentA;
    double componentB = ternaryCoordinate.componentB;
    double y = offsetY + (1 - componentA) * heigth;
    
    double heightB = componentA * heigth;

    double deltaX = heightB/tan(Constants.radians60Grades);

    double x = (componentB * width) + offsetX + deltaX;
    return BinaryCoordinate(x: x, y: y);
  }

  @override
  List<BinaryCoordinate> getArrowHeadA(BinaryCoordinate start, BinaryCoordinate end) {
    /*List<BinaryCoordinate> list = [];
    double startAngleToRotate = 120 - Constants.arrowAngle;
    double startAngleToRotateRad = FunctionsUtils.gradesToRadians(startAngleToRotate);
    double firstPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + end.x;
    double firstPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + end.y;

    list.add(BinaryCoordinate(x: firstPointX, y: firstPointY));
    list.add(end);
    double endAngleToRotate = 120 + Constants.arrowAngle;
    double endAngleToRotateRad = FunctionsUtils.gradesToRadians(endAngleToRotate);
    double endPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + end.x;
    double endPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + end.y;
    list.add(BinaryCoordinate(x: endPointX, y: endPointY));*/
    List<BinaryCoordinate> list = [];
    double startAngleToRotate = 120 + Constants.arrowAngle;
    double startAngleToRotateRad = FunctionsUtils.gradesToRadians(startAngleToRotate);
    double firstPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + start.x;
    double firstPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + start.y;

    list.add(BinaryCoordinate(x: firstPointX, y: firstPointY));
    list.add(start);
    double endAngleToRotate = 60 + Constants.arrowAngle;
    double endAngleToRotateRad = FunctionsUtils.gradesToRadians(endAngleToRotate);
    double endPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + start.x;
    double endPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + start.y;
    list.add(BinaryCoordinate(x: endPointX, y: endPointY));
    return list;
  }

  @override
  List<BinaryCoordinate> getArrowHeadB(BinaryCoordinate start, BinaryCoordinate end) {
    List<BinaryCoordinate> list = [];
    //start
    double startAngleToRotate = 120 + Constants.arrowAngle;
    double startAngleToRotateRad = FunctionsUtils.gradesToRadians(- startAngleToRotate);
    double firstPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + start.x;
    double firstPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + start.y;

    list.add(BinaryCoordinate(x: firstPointX, y: firstPointY));
    list.add(start);
    double endAngleToRotate = 60 + Constants.arrowAngle;
    double endAngleToRotateRad = FunctionsUtils.gradesToRadians(- endAngleToRotate);
    double endPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + start.x;
    double endPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + start.y;
    list.add(BinaryCoordinate(x: endPointX, y: endPointY));
    return list;
  }

  @override
  List<BinaryCoordinate> getArrowHeadC(BinaryCoordinate start, BinaryCoordinate end) {
    List<BinaryCoordinate> list = [];
    double coordX = end.x - 10;
    list.add(BinaryCoordinate(x: coordX, y: end.y - 5));
    list.add(end);
    list.add(BinaryCoordinate(x: coordX, y: end.y + 5));
    return list;
  }
  
}