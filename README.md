# Strawberry Sprint 🍓

A 2D endless runner game built with **Flutter** and the **Flame game engine** as part of a technical evaluation for a Computer Engineering position.

## 🎮 Game Overview

The player controls a running strawberry and must avoid randomly spawning rocks for as long as possible.

The game features:

* Endless gameplay
* Horizontal drag controls
* Randomly spawning obstacles
* Collision detection using Flame's built-in collision system
* Live survival-based scoring
* Persistent high score
* Main menu
* Pause / Resume
* Game Over screen
* Restart functionality
* Animated strawberry sprite
* Pixel-art background and obstacle assets

## 🕹️ Controls

**Desktop / Emulator:**

* Drag the strawberry horizontally using the mouse/touch input.
* Avoid the falling rocks.

The player is restricted to horizontal movement within the game boundaries.

## 🏗️ Architecture

The project uses Flame's Component System to keep the game modular.

```text
lib/
├── app/
│   └── app.dart
├── game/
│   ├── components/
│   │   ├── obstacle.dart
│   │   └── player.dart
│   ├── systems/
│   │   └── obstacle_spawner.dart
│   ├── game_state.dart
│   └── strawberry_sprint_game.dart
├── providers/
│   └── game_provider.dart
└── main.dart
```

### Main Components

* **StrawberrySprintGame** — manages the main game loop, game states, scoring, and overall gameplay.
* **Player** — handles player rendering, animation, movement, and collision detection.
* **Obstacle** — handles obstacle rendering, movement, and collision detection.
* **ObstacleSpawner** — periodically creates obstacles at randomized horizontal positions.
* **GameProvider** — manages UI-related state such as score, high score, pause state, and persistent high score storage.

## 🛠️ Technologies

* Flutter
* Dart
* Flame `1.38.0`
* Provider
* SharedPreferences

## 🚀 Running the Project

Make sure Flutter is installed and configured, then run:

```bash
flutter pub get
flutter run
```

To run the tests:

```bash
flutter test
```

To analyze the project:

```bash
flutter analyze
```

## 📁 Assets

Game assets are stored under:

```text
assets/images/
```

They include the player animation, obstacle sprite, and game background assets.

## 📌 Project Status

The game implements the required core mechanics and game states for the technical evaluation:

* Main Menu
* Active Gameplay
* Pause / Resume
* Game Over
* Restart
* Score and Persistent High Score
* Player and Obstacle Collision Detection
