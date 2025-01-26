import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/kaleidoscope_draw.dart';

class InkFlowGame extends FlameGame with DragCallbacks {
  late KaleidoscopeDraw kaleidoscopeDraw;

  @override
  Future<void> onLoad() async {
    kaleidoscopeDraw = KaleidoscopeDraw();
    add(kaleidoscopeDraw);
  }

  @override
  void onDragStart(DragStartEvent event) {
    kaleidoscopeDraw
        .startNewLine(); // Change to a new random color for the new stroke
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    kaleidoscopeDraw.addPoint(event.localPosition);
  }
}
