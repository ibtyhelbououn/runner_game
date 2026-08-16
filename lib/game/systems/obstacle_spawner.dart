import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'dart:math';

import '../components/obstacle.dart';

class ObstacleSpawner extends Component
    with HasGameReference<FlameGame> {
  ObstacleSpawner({
    this.spawnInterval = 1.5,
  });

  final double spawnInterval;

  double _timer = 0;

  @override
  void update(double dt) {
    super.update(dt);

    _timer += dt;

    if (_timer >= spawnInterval) {
      _timer = 0;
      _spawnObstacle();
    }
  }

  void _spawnObstacle() {
    final gameWidth = game.size.x;

    const obstacleSize = 45.0;

    final x = obstacleSize / 2 +
        Random().nextDouble() * (gameWidth - obstacleSize);

    final obstacle = Obstacle(
      position: Vector2(
        x,
        -obstacleSize,
      ),
      size: obstacleSize,
      speed: 250,
    );

    game.add(obstacle);
  }
}