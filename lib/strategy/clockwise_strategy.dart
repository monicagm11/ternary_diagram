import 'package:ternary_diagram/models/binary_coordinate.dart';
import 'package:ternary_diagram/models/ternary_coordinate.dart';
import 'package:ternary_diagram/strategy/converter_strategy.dart';
import 'package:ternary_diagram/utils/constants.dart';
import 'package:ternary_diagram/utils/functions_utils.dart';

class ClockwiseStrategy extends ConverterStrategy {
  ClockwiseStrategy();

  @override
  BinaryCoordinate ternaryToBinaryCoordinate(TernaryCoordinate ternaryCoordinate) {
    // TODO: implement ternaryToBinaryCoordinate
    throw UnimplementedError();
  }

  @override
  List<BinaryCoordinate> getArrowHeadA(BinaryCoordinate start, BinaryCoordinate end) {
    List<BinaryCoordinate> list = [];
    double startAngleToRotate = 120 - Constants.arrowAngle;
    double startAngleToRotateRad = FunctionsUtils.gradesToRadians(- startAngleToRotate);
    double firstPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + end.x;
    double firstPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + end.y;

    list.add(BinaryCoordinate(x: firstPointX, y: firstPointY));
    list.add(end);
    double endAngleToRotate = 60 - Constants.arrowAngle;
    double endAngleToRotateRad = FunctionsUtils.gradesToRadians(- endAngleToRotate);
    double endPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + end.x;
    double endPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + end.y;
    list.add(BinaryCoordinate(x: endPointX, y: endPointY));
    return list;
  }

  @override
  List<BinaryCoordinate> getArrowHeadB(BinaryCoordinate start, BinaryCoordinate end) {
    List<BinaryCoordinate> list = [];
    //end
    double startAngleToRotate = 60 - Constants.arrowAngle;
    double startAngleToRotateRad = FunctionsUtils.gradesToRadians(startAngleToRotate);
    double firstPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + end.x;
    double firstPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, startAngleToRotateRad) + end.y;

    list.add(BinaryCoordinate(x: firstPointX, y: firstPointY));
    list.add(end);

    double endAngleToRotate = 60 + Constants.arrowAngle;
    double endAngleToRotateRad = FunctionsUtils.gradesToRadians(endAngleToRotate);
    double endPointX = FunctionsUtils.rotateX(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + end.x;
    double endPointY = FunctionsUtils.rotateY(-Constants.arrowHeadLength, 0, endAngleToRotateRad) + end.y;
    list.add(BinaryCoordinate(x: endPointX, y: endPointY));
    return list;
  }

  @override
  List<BinaryCoordinate> getArrowHeadC(BinaryCoordinate start, BinaryCoordinate end) {
    List<BinaryCoordinate> list = [];
    double coordX = start.x + 10;
    list.add(BinaryCoordinate(x: coordX, y: start.y - 5));
    list.add(start);
    list.add(BinaryCoordinate(x: coordX, y: start.y + 5));
    return list;
  }
  
}