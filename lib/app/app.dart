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
      ),
    );
  }
}