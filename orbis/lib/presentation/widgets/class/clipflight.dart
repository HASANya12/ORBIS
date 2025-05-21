import 'package:flutter/material.dart';
import 'package:orbis/utils/helper/color.dart';

class Clipflight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();
    ///////inner
    Paint paint = Paint()..color = AppColor().baiscblue.withAlpha(200);

    Paint paint2 =
        Paint()
          ..color = Colors.white
          // ..strokeWidth = 1
          ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3);
    path.moveTo(0, h * 0.1);
    path.lineTo(0, h * 0.69);
    /////////////////////////////////////
    path.quadraticBezierTo(w * 0.065, h * 0.68, w * 0.06, h * 0.75);
    path.quadraticBezierTo(w * 0.064, h * 0.81, 0, h * 0.8);
    path.lineTo(0, h * 0.9);
    ////////////////////////////////////
    path.quadraticBezierTo(0, h, w * 0.06, h);
    /////////////////////////////////////////////
    path.lineTo(w * 0.94, h);
    ////////////////////////////////
    path.quadraticBezierTo(w, h, w, h * 0.9);
    path.lineTo(w, h * 0.8);
    ////////////////////////////////////////////

    path.quadraticBezierTo(w * 0.935, h * 0.81, w * 0.936, h * 0.75);
    path.quadraticBezierTo(w * 0.935, h * 0.68, w, h * 0.69);
    path.lineTo(w, h * 0.1);

    /////////////////////////////////////////
    path.quadraticBezierTo(w, 0, w * 0.94, 0);
    path.lineTo(w * 0.06, 0);
    path.quadraticBezierTo(0, 0, 0, h * 0.1);
    ///////border
    Paint paint3 =
        Paint()
          ..color = AppColor().baiscblue
          ..strokeWidth = 0.5
          ..style = PaintingStyle.stroke;
    /////////outer
    Paint paint4 =
        Paint()
          ..color = AppColor().baiscblue
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);

    canvas.drawPath(path, paint4);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, paint3);
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
