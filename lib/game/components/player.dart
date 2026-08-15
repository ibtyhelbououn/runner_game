import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';

import 'obstacle.dart';
import '../strawberry_sprint_game.dart';

class Player extends PositionComponent with CollisionCallbacks, DragCallbacks {
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

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;

    _keepInsideScreen();
  }

  void _keepInsideScreen() {
    final gameSize = findGame()?.size;

    if (gameSize == null) {
      return;
    }

    final halfWidth = size.x / 2;
    final halfHeight = size.y / 2;

    position.x = position.x.clamp(
      halfWidth,
      gameSize.x - halfWidth,
    );

    position.y = position.y.clamp(
      halfHeight,
      gameSize.y - halfHeight,
    );
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Obstacle) {
      final game = findGame();

      if (game is StrawberrySprintGame) {
        game.gameOver();
      }
    }
  }
}