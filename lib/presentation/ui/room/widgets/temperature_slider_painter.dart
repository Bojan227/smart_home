import 'package:flutter/material.dart';
import 'dart:math' as math;

class TemperatureSliderPainer extends CustomPainter {
  final int divisions;
  final Rect arcRect;
  final double nubAngle;
  final bool isBackground;
  final Color bgArcColor;
  final Color mainArcColor;
  final Color innerNubColor;
  final int progress;

  TemperatureSliderPainer(
      this.divisions,
      this.arcRect,
      this.nubAngle,
      this.isBackground,
      this.progress,
      this.bgArcColor,
      this.mainArcColor,
      this.innerNubColor);

  static const nubRadius = 16.0;
  static const lineWidth = 16.0;
  static const stepThickness = 3.0;
  static const stepLength = 2.0;
  late final lineArcRect = arcRect.deflate(lineWidth / 2);
  late final xradius = lineArcRect.width / 2;
  late final yradius = lineArcRect.height / 2;
  late final center = arcRect.center;

  late final nubPath = Path()
    ..addPath(
      Path()
        ..moveTo(0, 0)
        ..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromCircle(
                center: const Offset(nubRadius / 2, 0), radius: nubRadius),
            const Radius.circular(nubRadius),
          ),
        ),
      Offset(
        center.dx + math.cos(nubAngle) * xradius,
        center.dy + math.sin(nubAngle) * yradius,
      ),
      matrix4: Matrix4.rotationZ(nubAngle).storage,
    );

  late final innerNubPath = Path()
    ..addPath(
      Path()
        ..moveTo(0, 0)
        ..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromCircle(center: const Offset(8, 0), radius: 8),
            const Radius.circular(8),
          ),
        ),
      Offset(
        center.dx + math.cos(nubAngle) * xradius,
        center.dy + math.sin(nubAngle) * yradius,
      ),
      matrix4: Matrix4.rotationZ(nubAngle).storage,
    );

  @override
  void paint(Canvas canvas, Size size) {
    if (isBackground) {
      canvas.drawArc(
          arcRect,
          0,
          -math.pi,
          false,
          Paint()
            ..strokeCap = StrokeCap.round
            ..color = bgArcColor
            ..style = PaintingStyle.stroke
            ..strokeWidth = 8);
    }

    canvas.drawArc(
      arcRect,
      math.pi,
      -((progress / 20) * 100) * -math.pi / 100,
      false,
      Paint()
        ..strokeCap = StrokeCap.round
        ..color = mainArcColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8,
    );

    // Paint division markers
    // for (var i = 0; i < 21; i++) {
    //   final angle = -math.pi * i / (21 - 1);
    //   final xnorm = math.cos(angle);
    //   final ynorm = math.sin(angle);

    //   canvas.drawLine(
    //     center +
    //         Offset(
    //           xnorm * (xradius - stepLength),
    //           ynorm * (yradius - stepLength),
    //         ),
    //     center +
    //         Offset(
    //           xnorm * (xradius + stepLength),
    //           ynorm * (yradius + stepLength),
    //         ),
    //     Paint()
    //       ..style = PaintingStyle.stroke
    //       ..color = Colors.amber
    //       ..strokeWidth = stepThickness
    //       ..strokeCap = StrokeCap.round,
    //   );
    // }
    // Paint nub
    if (!isBackground) {
      canvas.drawPath(
        nubPath,
        Paint()..color = mainArcColor,
      );

      canvas.drawPath(
        innerNubPath,
        Paint()..color = innerNubColor,
      );
    }
  }

  @override
  bool? hitTest(Offset position) {
    // Only respond to hit tests when tapping the nub
    return nubPath.contains(position);
  }

  @override
  bool shouldRepaint(TemperatureSliderPainer oldDelegate) =>
      divisions != oldDelegate.divisions ||
      arcRect != oldDelegate.arcRect ||
      nubAngle != oldDelegate.nubAngle;
}
