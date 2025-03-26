import 'package:flutter/material.dart';

class TabsProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }
}
