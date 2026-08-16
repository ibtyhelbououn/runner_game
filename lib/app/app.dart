import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game/strawberry_sprint_game.dart';
import '../providers/game_provider.dart';

class RunnerApp extends StatelessWidget {
  const RunnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Strawberry Sprint',
            home: GameWidget(
              game: StrawberrySprintGame(
                gameProvider: context.read<GameProvider>(),
              ),
              overlayBuilderMap: {
                'pause': (context, game) {
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
                            'PAUSED',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              final gameInstance = game as StrawberrySprintGame;
                              gameInstance.resumeGame();
                            },
                            child: const Text('RESUME'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
                              final gameInstance =
                                  game as StrawberrySprintGame;

                              gameInstance.restartGame();
                            },
                            child: const Text('PLAY AGAIN'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                'hud': (context, game) {
                  return Consumer<GameProvider>(
                    builder: (context, gameProvider, child) {
                      return SafeArea(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  'SCORE: ${gameProvider.score}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        offset: Offset(1, 1),
                                        color: Colors.black45,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.pause_circle_filled,
                                  size: 36,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  final gameInstance = game as StrawberrySprintGame;
                                  gameInstance.pauseGame();
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              },
            ),
          );
        },
      ),
    );
  }
}