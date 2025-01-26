import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class InkParticle extends PositionComponent {
  InkParticle({required double size, required Vector2 position}) {
    this.size = NotifyingVector2.all(
        size); // Convert size from double to NotifyingVector2
    this.position = position;
    anchor = Anchor.center;
  }

 @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.black; // Ink color
    canvas.drawCircle(Offset(size.x / 2, size.y / 2), size.x / 2, paint);
  }


  @override
  void update(double dt) {
    // You can implement a fading or dissipating effect here
  }
}
