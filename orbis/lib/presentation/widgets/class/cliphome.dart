import 'package:flutter/material.dart';

class Cliphome1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, h * 0.25);

    path.quadraticBezierTo(w * 0.5, h, w, h * 0.15);
    path.lineTo(w, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Cliphome2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, h * 0.45);

    path.quadraticBezierTo(w * 0.5, h * 1.3, w, h * 0.35);
    path.lineTo(w, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Cliphome3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, h * 0.55);

    path.quadraticBezierTo(w * 0.5, h + 5, w, h * 0.5);
    path.lineTo(w, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
