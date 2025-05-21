
import 'package:flutter/material.dart';

class Clipnavbar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();

    path.quadraticBezierTo(0, h * 0.3, w * 0.15, h * 0.3);
    ///////////
    path.quadraticBezierTo(w * 0.4, h * 0.2, w * 0.43, h * 0.6);
    ///////////
    path.quadraticBezierTo(w * 0.5, h * 0.7, w * 0.55, h * 0.6);
    ////////////////
    path.quadraticBezierTo(w * 0.6, h * 0.3, w * 0.7, h * 0.3);
    ////////////////////
    path.quadraticBezierTo(w, h * 0.3, w * 0.85, h * 0.3);
    path.quadraticBezierTo(w, h * 0.3, w, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
