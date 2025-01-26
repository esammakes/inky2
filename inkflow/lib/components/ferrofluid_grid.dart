import 'package:flame/components.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class FerrofluidGrid extends PositionComponent {
  final int rows = 20;
  final int cols = 20;
  final double cellSize = 20;
  List<List<double>> heightMap = [];

  FerrofluidGrid() {
    _initializeHeightMap();
  }

  void _initializeHeightMap() {
    Random random = Random();
    for (int i = 0; i < rows; i++) {
      List<double> row = [];
      for (int j = 0; j < cols; j++) {
        row.add(sin(i * 0.2) + cos(j * 0.2) + random.nextDouble());
      }
      heightMap.add(row);
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint();
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        double heightFactor = heightMap[i][j];
        paint.color = Color.lerp(Color(0xFF000000), Color(0xFF444444), heightFactor)!;
        canvas.drawRect(
            Rect.fromLTWH(j * cellSize, i * cellSize, cellSize, cellSize), paint);
      }
    }
  }
}
