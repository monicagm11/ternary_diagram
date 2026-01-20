import 'package:ternary_diagram/models/binary_coordinate.dart';
import 'package:ternary_diagram/models/ternary_coordinate.dart';

abstract class ConverterStrategy {
  late double heigth;
  late double width;
  late double offsetX;
  late double offsetY;

  ConverterStrategy();

  BinaryCoordinate ternaryToBinaryCoordinate(TernaryCoordinate ternaryCoordinate);

  List<BinaryCoordinate> getArrowHeadA(BinaryCoordinate start, BinaryCoordinate end);

  List<BinaryCoordinate> getArrowHeadB(BinaryCoordinate start, BinaryCoordinate end);

  List<BinaryCoordinate> getArrowHeadC(BinaryCoordinate start, BinaryCoordinate end);
}