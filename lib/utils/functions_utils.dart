import 'dart:math';

import 'package:ternary_diagram/models/binary_coordinate.dart';

class FunctionsUtils {
  static double gradesToRadians (double grades) {
    return grades * pi / 180;
  }
  static double radiansToGrades (double rad) {
    return rad * 180 / pi;
  }
  static double rotateX (double x, double y, double angleRad) {
    return (x * cos(angleRad) - (y * sin(angleRad)));
  }

  static double rotateY (double x, double y, double angleRad) {
    return (x * sin(angleRad)) + (y * cos(angleRad));
  }

  static double distance(BinaryCoordinate start, BinaryCoordinate end) {
    double term1 = end.x - start.x;
    double term2 = end.y - start.y;
    return sqrt(pow(term1,2) + pow(term2, 2));
  }

  static double angle(BinaryCoordinate start, BinaryCoordinate end) {
    double dy = end.y - start.y;
    double dx = end.x - start.x;
    double angle = atan2(dy, dx);
    if(start.y > end.y) {
      dy = -dy;
      dx = -dx;
      angle = atan2(dy, dx);
      
      angle = 2*pi - angle;
    }
    return angle;
  }
}