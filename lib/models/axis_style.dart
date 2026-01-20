import 'package:flutter/material.dart';

class AxisStyle {
  final Color arrowColor;
  final double arrowStroke;

  final Color labelColor;
  final Color labelBackgroundColor;

  final Color axisColor;
  final double axisStroke;

  final String label;
  final double labelFontSize;

  const AxisStyle({
      required this.label,
      this.labelFontSize = 14,
      this.arrowColor = Colors.grey,
      this.arrowStroke = 2,
      this.labelColor = Colors.black,
      this.labelBackgroundColor = Colors.white,
      this.axisColor = Colors.black,
      this.axisStroke = 2,
  });

  Paint getAxisPaint() {
    return Paint()
      ..color = axisColor
      ..strokeWidth = axisStroke
      ..style = PaintingStyle.stroke;
  }

  Paint getArrowPaint() {
    return Paint()
      ..color = arrowColor
      ..strokeWidth = arrowStroke
      ..style = PaintingStyle.stroke;
  }

  TextPainter getTextPainter() {
    return TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(fontSize: labelFontSize),
      ),
      textDirection: TextDirection.ltr,
    );
  }
}