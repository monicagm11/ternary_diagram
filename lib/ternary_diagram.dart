import 'package:flutter/material.dart';
import 'package:ternary_diagram/diagram_config/converter_config_impl.dart';
import 'package:ternary_diagram/models/diagram_style.dart';
import 'package:ternary_diagram/models/ternary_path.dart';
import 'package:ternary_diagram/strategy/clockwise_strategy.dart';
import 'package:ternary_diagram/strategy/counter_clockwise_strategy.dart';
import 'package:ternary_diagram/utils/diagram_types.dart';
import 'package:ternary_diagram/widgets/ternary_painter.dart';

class TernaryDiagram extends StatelessWidget {
  final DiagramTypes diagramType;

  final double? heigth;
  final double? width;
  final Color? color;
  final Widget? title;
  final DiagramStyle diagramStyle;
  final List<TernaryPath> functions;

  const TernaryDiagram(
      {super.key,
      required this.diagramType,
      required this.functions,
      this.heigth,
      this.width,
      this.title,
      this.color,
      this.diagramStyle = const DiagramStyle()
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      width: width,
      color: color,
      child: Column(
        children: [
          title ?? SizedBox.shrink(),
          Expanded(child: 
          CustomPaint(
            size: Size.infinite,
            painter: TernaryPainter(
                diagramConfig: DiagramConfigImpl(
                    converterStrategy: diagramType == DiagramTypes.clockwise
                        ? ClockwiseStrategy()
                        : CounterClockwiseStrategy(),
                    diagramStyle: diagramStyle,
                    functions: functions)),
          ))
        ],
      ),
    );
  }
}
