import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void addCount() {
    counter++;
    notifyListeners();
  }
}
