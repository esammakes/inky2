import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class KaleidoscopeDraw extends PositionComponent {
  List<List<Vector2>> mirroredLines = [];
  List<Color> lineColors = []; // Stores colors for each stroke
  static const int symmetry = 6; // 6-way symmetry
  static const double centerX = 200.0; // Adjust for screen center
  static const double centerY = 400.0;
  Color currentColor = Colors.white; // Initialize with white

  void startNewLine() {
    final random = Random();
    currentColor = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
    mirroredLines.add([]);
    lineColors.add(currentColor);
  }

  void addPoint(Vector2 point) {
    if (mirroredLines.isEmpty) startNewLine(); // Ensure a new stroke exists
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
    mirroredLines.last.addAll(newMirroredPoints);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y),
        Paint()..color = Colors.black); // Set background to black
    for (int i = 0; i < mirroredLines.length; i++) {
      final paint = Paint()
        ..color = lineColors[i] // Use stored color per stroke
        ..strokeWidth = 2.0;
      for (int j = 1; j < mirroredLines[i].length; j++) {
        canvas.drawLine(mirroredLines[i][j - 1].toOffset(),
            mirroredLines[i][j].toOffset(), paint);
      }
    }
  }
}
