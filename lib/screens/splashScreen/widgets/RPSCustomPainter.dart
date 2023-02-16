import 'package:flutter/material.dart';

import '../../../settings/colors.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.secondaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0025641, size.height);
    path0.lineTo(0, size.height * 0.3213559);
    path0.quadraticBezierTo(size.width * 0.1535897, size.height * 0.1908475,
        size.width * 0.3600000, size.height * 0.3254237);
    path0.cubicTo(
        size.width * 0.5517949,
        size.height * 0.5684746,
        size.width * 0.5748718,
        size.height * 0.1786441,
        size.width * 0.7723077,
        size.height * 0.4027119);
    path0.quadraticBezierTo(size.width * 0.8030769, size.height * 0.2706780,
        size.width, size.height * 0.3355932);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width * 0.0025641, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
