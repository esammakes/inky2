import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'components/ferrofluid_grid.dart';
import 'components/flow_field.dart';
import 'components/ink_particle.dart';

class InkFlowGame extends FlameGame with TapCallbacks {
  late FerrofluidGrid ferrofluid;
  late FlowField flowField;

  @override
  Future<void> onLoad() async {
    ferrofluid = FerrofluidGrid();
    flowField = FlowField(20, 20);
    add(ferrofluid);
  }

  @override
  void onTapDown(TapDownEvent event) {
    add(InkParticle(
        position: event.localPosition,
        size: 10.0)); // Pass arguments with named parameters
  }

}
