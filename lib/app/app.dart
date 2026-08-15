import 'package:flame/game.dart';

import '../game/strawberry_sprint_game.dart';

import 'package:flutter/material.dart';

class RunnerApp extends StatelessWidget {
  const RunnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Strawberry Sprint',
      home: GameWidget(
        game: StrawberrySprintGame(),
        overlayBuilderMap: {
          'gameOver': (context, game) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'GAME OVER',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        final gameInstance = game as StrawberrySprintGame;
                        
                        gameInstance.overlays.remove('gameOver');
                        gameInstance.resumeEngine();
                      },
                      child: const Text('PLAY AGAIN'),
                    ),
                  ],
                ),
              ),
            );
          },
        },
      ),
    );
  }
}