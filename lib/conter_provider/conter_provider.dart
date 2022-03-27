import 'package:flutter/material.dart';

class ConterProvider extends ChangeNotifier {
  int counter = 0;
  add() {
    counter++;
    notifyListeners();
  }
}
