import 'dart:math';

import 'package:flame/components.dart';

import 'game.dart';
import 'box.dart';

class BoxStack extends PositionComponent with HasGameRef<FlappyEmber> {
  final bool isBottom;
  static final random = Random();

  BoxStack({required this.isBottom});

  @override
  Future<void>? onLoad() async {
    position.x = gameRef.size.x;
    final gameHeight = gameRef.size.y;
    final boxHeight = Box.initialSize.y;
    final maxStackHeight = (gameHeight / boxHeight).floor() - 2;

    final stackHeight = random.nextInt(maxStackHeight + 1);
    final boxSpacing = boxHeight * (2 / 3);
    final initialY = isBottom ? gameHeight - boxHeight : -boxHeight / 3;

    final boxs = List.generate(stackHeight, (index) {
      return Box(
        position:
            Vector2(0, initialY + index * boxSpacing * (isBottom ? -1 : 1)),
      );
    });
    addAll(isBottom ? boxs : boxs.reversed);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (position.x < -Box.initialSize.x) {
      removeFromParent();
    }
    position.x -= gameRef.speed * dt;
  }
}
