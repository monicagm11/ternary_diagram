import 'package:ternary_diagram/models/base_path.dart';
import 'package:ternary_diagram/models/binary_coordinate.dart';

class BinaryPath extends BasePath{
  List<BinaryCoordinate> coordinateList;

  BinaryPath ({this.coordinateList = const [], required super.paint, super.close = true});

}