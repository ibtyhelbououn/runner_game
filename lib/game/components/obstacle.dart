import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Obstacle extends SpriteComponent with CollisionCallbacks {
  Obstacle({
    required Vector2 position,
    required double size,
    required this._speed,
  })  : super(
          position: position,
          size: Vector2.all(size),
          anchor: Anchor.center,
        );

  final double _speed;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load(
      'rock_obstacle.PNG',
    );

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += _speed * dt;

    if (position.y > (findGame()?.size.y ?? 0) + size.y) {
      removeFromParent();
    }
  }

}