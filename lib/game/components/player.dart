import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent with CollisionCallbacks {
  Player({
    required Vector2 position,
    required Vector2 size,
  }) : super(
          position: position,
          size: size,
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      RectangleHitbox(),
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()
      ..color = const Color(0xFFE91E63)
      ..style = PaintingStyle.fill;

    final center = Offset(size.x / 2, size.y / 2);

    canvas.drawCircle(
      center,
      size.x / 2,
      paint,
    );

    final leafPaint = Paint()
      ..color = const Color(0xFF4CAF50)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(center.dx, 8)
      ..lineTo(center.dx - 12, 20)
      ..lineTo(center.dx, 16)
      ..lineTo(center.dx + 12, 20)
      ..close();

    canvas.drawPath(path, leafPaint);
  }
}