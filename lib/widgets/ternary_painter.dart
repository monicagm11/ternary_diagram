import 'package:flutter/material.dart';
import 'package:ternary_diagram/diagram_config/converter_config_impl.dart';
import 'package:ternary_diagram/models/binary_coordinate.dart';
import 'package:ternary_diagram/models/binary_path.dart';
import 'package:ternary_diagram/models/label_painter.dart';

class TernaryPainter extends CustomPainter {
  final DiagramConfigImpl diagramConfig;
  TernaryPainter({required this.diagramConfig});
  
  @override
  void paint(Canvas canvas, Size size) {
    double totalWidth = size.width;
    double totalHeigth = size.height;
    diagramConfig.setUp(totalWidth: totalWidth, totalHeigth: totalHeigth);
    _drawPathList(canvas, diagramConfig.pathToPaint);
    _drawLabelList(canvas, diagramConfig.labelToPaint);
    _drawPathList(canvas, diagramConfig.functionsToPaint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

  void _drawPathList(Canvas canvas, List<BinaryPath> pathList) {
    for (BinaryPath path in pathList) {
      path.coordinateList.length == 1 ? _drawPoint (canvas, path) : _drawPath(canvas, path);
    }
  }

  void _drawPath(Canvas canvas, BinaryPath path) {
      List<BinaryCoordinate> coordinateList = path.coordinateList;
      Path internalPath = Path();
      coordinateList.asMap().forEach((index, coord) {
        index == 0 ? internalPath.moveTo(coord.x, coord.y) : internalPath.lineTo(coord.x, coord.y);
      });
      path.close ? internalPath.close() : null;
      canvas.drawPath(internalPath, path.paint);
  }

  void _drawPoint(Canvas canvas, BinaryPath path) {
    BinaryCoordinate coord = path.coordinateList.first;
    Paint paint = path.paint;
    double stroke = paint.strokeWidth;
    canvas.drawCircle(Offset(coord.x, coord.y), stroke, paint);
  }

  void _drawLabelList(Canvas canvas, List<LabelPainter> labelList) {
    for (LabelPainter label in labelList) {
      _drawLabel(canvas, label);
    }
  }
  void _drawLabel(Canvas canvas, LabelPainter painter) {
    TextPainter textPainter = painter.textPainter;
    Offset offset = painter.offset;
    textPainter.layout();
    if(painter.angleToRotate == 0) {
      textPainter.paint(canvas, painter.offset);
    } else {
      canvas.save();
      canvas.translate(offset.dx, offset.dy);
      canvas.rotate(painter.angleToRotate);
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }
    
  }
}