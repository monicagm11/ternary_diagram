import 'package:flutter/material.dart';

class LabelPainter {
  final TextPainter textPainter;
  final Offset offset;
  final double angleToRotate;

  const LabelPainter({required this.textPainter, required this.offset, this.angleToRotate = 0});

}