class BinaryCoordinate {
  double x;
  double y;

  BinaryCoordinate({required this.x, required this.y});

  translate({double? dx, double? dy}) {
    x+= (dx??0);
    y+= (dy??0);
  }
}