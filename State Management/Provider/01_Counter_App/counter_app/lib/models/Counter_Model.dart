import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void addCount() {
    counter++;
    notifyListeners();
  }
}

// ****************** Provider Guide ********************

/* 

1: Add Provider Package => (flutter pub add provider)
2: Define/ Return Provider in Main.dart as (Multiple / Single Provider)
3: Use the class in the widget tree using Consumer widget
  => (Wrap the Scaffold with Consumer Package Return Builder )

*/
