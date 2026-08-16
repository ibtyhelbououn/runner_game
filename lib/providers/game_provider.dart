import 'package:flutter/foundation.dart';

class GameProvider extends ChangeNotifier {
  int _score = 0;
  bool _isGameOver = false;
  bool _isPaused = false;

  int get score => _score;
  bool get isGameOver => _isGameOver;
  bool get isPaused => _isPaused;

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
    notifyListeners();
  }
}