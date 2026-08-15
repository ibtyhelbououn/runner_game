import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/player.dart';
import 'systems/obstacle_spawner.dart';
import 'game_state.dart';
import 'components/obstacle.dart';


class StrawberrySprintGame extends FlameGame with HasCollisionDetection {

  late final Player player;

  GameState currentState = GameState.playing;
  
  @override
  Color backgroundColor() {
    return const Color(0xFFFFEAF2);
  }
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player(
      position: Vector2(
        size.x / 2,
        size.y * 0.8,
      ),
      size: Vector2.all(70),
    );

    add(player);

    add(
      ObstacleSpawner(),
    );
  }

  void gameOver() {

    currentState = GameState.gameOver;

    overlays.add('gameOver');

    pauseEngine();
  }

  void restartGame() {
    currentState = GameState.playing;

    overlays.remove('gameOver');

    // Remove all obstacles.
    children.whereType<Obstacle>().forEach((obstacle) {
      obstacle.removeFromParent();
    });

    // Reset player position.
    player.position = Vector2(
      size.x / 2,
      size.y * 0.8,
    );

    resumeEngine();
  }

  
}