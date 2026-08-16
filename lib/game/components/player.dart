import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/events.dart';

import 'obstacle.dart';
import '../strawberry_sprint_game.dart';

class Player extends SpriteAnimationComponent with CollisionCallbacks, DragCallbacks, HasGameReference<StrawberrySprintGame> {
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

    animation = await game.loadSpriteAnimation(
      'cute_strawberry_run.png',
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.2,
        textureSize: Vector2.all(32),
      ),
    );

    add(
      RectangleHitbox(),
    );
  }


  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.x += event.localDelta.x;

    _keepInsideScreen();
  }

  void _keepInsideScreen() {
    final gameSize = findGame()?.size;

    if (gameSize == null) {
      return;
    }

    final halfWidth = size.x / 2;

    position.x = position.x.clamp(
      halfWidth,
      gameSize.x - halfWidth,
    );
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Obstacle) {
      game.gameOver();
    }
  }
}