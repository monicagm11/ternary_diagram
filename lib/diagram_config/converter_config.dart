import 'package:ternary_diagram/models/binary_coordinate.dart';
import 'package:ternary_diagram/models/ternary_coordinate.dart';
import 'package:ternary_diagram/utils/diagram_types.dart';

abstract class DiagramConfig {
  DiagramTypes diagramType;
  double totalHeight = 0;
  double totalWidth = 0;

  DiagramConfig({
    required this.diagramType
  });

  List<BinaryCoordinate> convertCoordinates(List<TernaryCoordinate> data);
  
}