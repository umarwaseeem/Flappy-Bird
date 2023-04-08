import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Box extends SpriteComponent {
  static Vector2 initialSize = Vector2.all(150);
  Box({super.position}) : super(size: initialSize);

  @override
  Future<void>? onLoad() async {
    final image = await Flame.images.load('boxes/1.png');

    sprite = Sprite(image);

    add(RectangleHitbox());
  }
}
