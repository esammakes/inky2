import 'dart:math';
import 'package:flame/components.dart';

class FlowField {
  final int rows;
  final int cols;
  List<List<Vector2>> field;

  FlowField(this.rows, this.cols)
      : field = List.generate(
            rows, (_) => List.generate(cols, (_) => Vector2.zero())) {
    generateField();
  }

  void generateField() {
    Random random = Random();
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        double angle = (sin(i * 0.2) + cos(j * 0.2)) * pi;
        field[i][j] = Vector2(cos(angle), sin(angle)) * random.nextDouble();
      }
    }
  }

  Vector2 getForceAt(int x, int y) {
    return field[x][y];
  }
}
