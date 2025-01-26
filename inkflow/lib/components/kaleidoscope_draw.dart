import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class KaleidoscopeDraw extends PositionComponent {
  List<List<Vector2>> mirroredLines = [];
  static const int symmetry = 6; // 6-way symmetry
  static const double centerX = 200.0; // Adjust for screen center
  static const double centerY = 400.0;

  void addPoint(Vector2 point) {
    List<Vector2> newMirroredPoints = [];
    double angleIncrement = (2 * pi) / symmetry;
    for (int i = 0; i < symmetry; i++) {
      double angle = angleIncrement * i;
      double dx = point.x - centerX;
      double dy = point.y - centerY;
      double rotatedX = dx * cos(angle) - dy * sin(angle) + centerX;
      double rotatedY = dx * sin(angle) + dy * cos(angle) + centerY;
      newMirroredPoints.add(Vector2(rotatedX, rotatedY));
    }
    mirroredLines.add(newMirroredPoints);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;
    for (var points in mirroredLines) {
      for (int i = 1; i < points.length; i++) {
        canvas.drawLine(points[i - 1].toOffset(), points[i].toOffset(), paint);
      }
    }
  }
}
