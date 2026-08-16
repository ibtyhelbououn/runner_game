import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider extends ChangeNotifier {
  int _score = 0;
  int _highScore = 0;
  bool _isGameOver = false;
  bool _isPaused = false;
  bool _isNewHighScore = false;

  int get score => _score;
  int get highScore => _highScore;
  bool get isGameOver => _isGameOver;
  bool get isPaused => _isPaused;
  bool get isNewHighScore => _isNewHighScore;

  void updateScore(int score) {
    if (_score != score) {
      _score = score;
      notifyListeners();
    }
  }

  void setGameOver(bool value) {
    _isGameOver = value;
    notifyListeners();
  }

  void setPaused(bool value) {
    _isPaused = value;
    notifyListeners();
  }

  void reset() {
    _score = 0;
    _isGameOver = false;
    _isPaused = false;
    _isNewHighScore = false;
    notifyListeners();
  }

  Future<void> loadHighScore() async {
    final preferences = await SharedPreferences.getInstance();

    _highScore = preferences.getInt('highScore') ?? 0;

    notifyListeners();
  }

  Future<void> saveHighScore() async {
    if (_score <= _highScore) {
      _isNewHighScore = false;
      notifyListeners();
      return;
    }

    _highScore = _score;
    _isNewHighScore = true;

    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt('highScore', _highScore);

    notifyListeners();
  }
}