import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Sky extends SpriteComponent {
  Sky() : super(priority: -1);

  @override
  Future<void>? onLoad() async {
    final image = await Flame.images.load('sky.png');

    sprite = Sprite(image);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    this.size = size;
  }
}
