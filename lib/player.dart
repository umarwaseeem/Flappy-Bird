import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'game.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<FlappyEmber> {
  Player() : super(size: Vector2(100, 100), position: Vector2(100, 100));

  @override
  Future<void>? onLoad() async {
    add(CircleHitbox());

    final image = await Flame.images.load('ember.png');
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.10,
        textureSize: Vector2.all(16),
      ),
    );
  }

  @override
  void onCollisionStart(_, __) {
    super.onCollisionStart(_, __);
    gameRef.gameover();
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += 200 * dt;
  }

  void fly() {
    final effect = MoveByEffect(
        Vector2(0, -100),
        EffectController(
          duration: 0.5,
          curve: Curves.decelerate,
        ));

    add(effect);
  }
}
