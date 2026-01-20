import 'package:ternary_diagram/models/base_path.dart';
import 'package:ternary_diagram/models/ternary_coordinate.dart';

class TernaryPath extends BasePath{
  List<TernaryCoordinate> coordinateList;

  TernaryPath ({this.coordinateList = const [], required super.paint, super.close = true});
}