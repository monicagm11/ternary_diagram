import 'package:ternary_diagram/models/binary_coordinate.dart';
import 'package:ternary_diagram/models/ternary_coordinate.dart';

abstract class ConverterStrategy {

  ConverterStrategy();

  BinaryCoordinate ternaryToBinaryCoordinate(TernaryCoordinate ternaryCoordinate, double offsetX, double offsetY, double heigth, double width);

  List<BinaryCoordinate> getArrowHeadA(BinaryCoordinate start, BinaryCoordinate end);

  List<BinaryCoordinate> getArrowHeadB(BinaryCoordinate start, BinaryCoordinate end);

  List<BinaryCoordinate> getArrowHeadC(BinaryCoordinate start, BinaryCoordinate end);
}