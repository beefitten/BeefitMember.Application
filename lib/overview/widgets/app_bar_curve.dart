import 'package:flutter/material.dart';

class AppBarCurve extends ShapeBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();

    path.moveTo(0, rect.height * 0.80);
    path.quadraticBezierTo(
        rect.width / 2, rect.height, rect.width, rect.height * 0.80);
    path.lineTo(rect.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    throw UnimplementedError();
  }
}
