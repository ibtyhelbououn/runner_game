import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Obstacle extends PositionComponent with CollisionCallbacks {
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

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()
      ..color = const Color(0xFFFF6B81)
      ..style = PaintingStyle.fill;

    final center = Offset(size.x / 2, size.y / 2);

    canvas.drawCircle(
      center,
      size.x / 2,
      paint,
    );

    final shinePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.7)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.x * 0.35, size.y * 0.3),
      size.x * 0.12,
      shinePaint,
    );
  }
}