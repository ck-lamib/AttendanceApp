import 'dart:math';

import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  CirclePainter({
    this.color = AppColor.dark,
  });
  Color color;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.height / 2, size.width / 2),
          height: size.height,
          width: size.width,
        ),
        0,
        pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
